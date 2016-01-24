//
//  DetailViewController.m
//  RouteBuddy
//
//  Created by Adam Lewis on 17/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import "EmergencyContactFormViewController.h"

@interface EmergencyContactFormViewController ()

@end

@implementation EmergencyContactFormViewController

#pragma mark - Managing the emergency contact

- (void)setEmergencyContact:(id)emergencyContact {
    if (_emergencyContact != emergencyContact) {
        _emergencyContact = emergencyContact;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self dismissKeyboards];
    return NO;
}

-(void)dismissKeyboards {
    [self.nameField resignFirstResponder];
    [self.phoneNumberField resignFirstResponder];
}

-(void)updateEmergencyContact:(id)sender {
    if (![self isValidForm])
        return;
    
    // Update the object
    if (self.emergencyContact) {
        // Set the values
        self.emergencyContact.name = self.nameField.text;
        self.emergencyContact.phoneNumber = self.phoneNumberField.text;
        self.emergencyContact.priority = [NSNumber numberWithInt:0];
        self.emergencyContact.image = UIImagePNGRepresentation(self.icon.image);
    }
    
    // Go back
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clearFields {
    [self.nameField setText:@""];
    [self.phoneNumberField setText:@""];
}

- (void)insertNewObject:(id)sender {
    if (![self isValidForm])
        return;
    
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
    EmergencyContact *emergencyContact = (EmergencyContact *) [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    // Set the values
    emergencyContact.name = self.nameField.text;
    emergencyContact.phoneNumber = self.phoneNumberField.text;
    emergencyContact.priority = [NSNumber numberWithInt:0];
    emergencyContact.image = UIImagePNGRepresentation(self.icon.image);
    
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

-(BOOL)isValidForm {
    if ([EmergencyContact isValidName:self.nameField.text AndPhoneNumber:self.phoneNumberField.text])
        return true;
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid input" message:@"Please make sure name and phone number fields are filled with valid information." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.phoneNumberField setKeyboardType:UIKeyboardTypePhonePad];
    self.updateButton.target = self;
    
    // Update the user interface for the detail item.
    if (self.emergencyContact) {
        self.nameField.text = self.emergencyContact.name;
        self.phoneNumberField.text = self.emergencyContact.phoneNumber;
        self.icon.image = [UIImage imageWithData:self.emergencyContact.image];
        self.titleBar.title = @"Edit Emergency Contact";
        self.updateButton.action = @selector(updateEmergencyContact:);
        self.updateButton.title = @"Update";
    } else {
        self.titleBar.title = @"New Emergency Contact";
        self.updateButton.title = @"Save";
        self.updateButton.action = @selector(insertNewObject:);
        [self clearFields];
    }
    
    // Dismiss text fields on tap
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboards)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)back:(id)sender {
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
    self.icon.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
