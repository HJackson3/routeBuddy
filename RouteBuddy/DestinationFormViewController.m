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

- (void)configureView {
    self.updateButton.target = self;
    
    // Update the user interface for the detail item.
    if (self.destination) {
        self.nameField.text = [[self.destination valueForKey:@"name"] description];
        self.coordinate = CLLocationCoordinate2DMake(
            [(NSNumber*)[self.destination valueForKey:@"xLocation"] doubleValue],
            [(NSNumber*)[self.destination valueForKey:@"yLocation"] doubleValue]);
        NSLog(@"%f, %f", self.coordinate.latitude, self.coordinate.longitude);
        self.titleBar.title = @"Edit Destination";
        self.updateButton.action = @selector(updateDestination:);
        self.updateButton.title = @"Update";
    } else {
        self.titleBar.title = @"New Destination";
        self.updateButton.title = @"Save";
        self.updateButton.action = @selector(insertNewObject:);
        [self clearFields];
    }
}

-(void)updateDestination:(id)sender {
    // Update the object
    if (self.destination) {
        [self.destination setValue:self.nameField.text forKey:@"name"];
    }
    // Go back
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clearFields {
    [self.nameField setText:@""];
}

- (IBAction)insertNewObject:(id)sender {
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
    Destination *newManagedObject = (Destination *) [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    // If appropriate, configure the new managed object.
    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
    [newManagedObject setValue:self.nameField.text forKey:@"name"];
    [newManagedObject setValue:[NSNumber numberWithDouble:self.coordinate.latitude] forKey:@"xLocation"];
    [newManagedObject setValue:[NSNumber numberWithDouble:self.coordinate.longitude] forKey:@"yLocation"];
    
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

- (IBAction)takePhoto:(id)sender {
    
}

- (IBAction)selectFromGallery:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"selectLocation"]) {
        LocationSelectViewController *controller = (LocationSelectViewController*)[segue destinationViewController];
        controller.coordinate = self.coordinate;
    }
    
}

@end
