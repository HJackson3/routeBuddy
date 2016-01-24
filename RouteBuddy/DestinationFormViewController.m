//
//  DestinationFormViewController.m
//  RouteBuddy
//
//  Created by Adam Lewis on 19/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import "DestinationFormViewController.h"

@interface DestinationFormViewController ()

@end

@implementation DestinationFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set the update button target
    self.updateButton.target = self;
    
    // Capitalise first letter of word
    self.nameField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    
    // Update the user interface for the detail item.
    if (self.destination) {
        self.nameField.text = [[self.destination valueForKey:@"name"] description];
        self.coordinate = CLLocationCoordinate2DMake([(NSNumber*)[self.destination valueForKey:@"xLocation"] doubleValue],[(NSNumber*)[self.destination valueForKey:@"yLocation"] doubleValue]);
        self.imageView.image = [UIImage imageWithData:self.destination.image];
        self.titleBar.title = @"Edit Destination";
        self.updateButton.action = @selector(updateDestination:);
        self.updateButton.title = @"Update";
    } else {
        self.titleBar.title = @"New Destination";
        self.updateButton.title = @"Save";
        self.updateButton.action = @selector(insertNewObject:);
        [self clearFields];
    }
    
    // Dismiss text fields on tap
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboards)];
    [self.view addGestureRecognizer:tap];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self dismissKeyboards];
    return NO;
}

-(void)dismissKeyboards {
    [self.nameField resignFirstResponder];
}

-(void)updateDestination:(id)sender {
    if (![self isValidForm])
        return;
    
    // Update the object
    if (self.destination) {
        // Set values
        self.destination.name = self.nameField.text;
        self.destination.xLocation = [NSNumber numberWithDouble: self.coordinate.latitude];
        self.destination.yLocation = [NSNumber numberWithDouble: self.coordinate.longitude];
        self.destination.image = UIImagePNGRepresentation(self.imageView.image);
    }
    // Go back
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clearFields {
    [self.nameField setText:@""];
}

- (IBAction)insertNewObject:(id)sender {
    if (![self isValidForm])
        return;
    
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
    Destination *destination = (Destination *) [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    // Set values
    destination.name = self.nameField.text;
    destination.xLocation = [NSNumber numberWithDouble: self.coordinate.latitude];
    destination.yLocation = [NSNumber numberWithDouble: self.coordinate.longitude];
    destination.image = UIImagePNGRepresentation(self.imageView.image);
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    // Go back
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)takePhoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
        [self presentViewController:picker animated:YES completion:NULL];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"You don't have a camera on your device." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

-(void)selectFromGallery:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"selectLocation"]) {
        LocationSelectViewController *controller = (LocationSelectViewController*)[segue destinationViewController];
        controller.coordinate = self.coordinate;
        controller.name = self.nameField.text;
    }
}

-(void)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)isValidForm {
    if ([Destination isValidName:self.nameField.text andCoordinate:self.coordinate])
        return true;
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid input" message:@"Please make sure you have entered a valid name and selected a location." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
    }
}

@end
