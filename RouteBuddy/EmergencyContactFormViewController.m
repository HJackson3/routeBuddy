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

- (void)configureView {
    [self.phoneNumberField setKeyboardType:UIKeyboardTypePhonePad];
    self.updateButton.target = self;
    
    // Update the user interface for the detail item.
    if (self.emergencyContact) {
        self.nameField.text = [[self.emergencyContact valueForKey:@"name"] description];
        self.phoneNumberField.text = [[self.emergencyContact valueForKey:@"phoneNumber"] description];
        self.titleBar.title = @"Edit Emergency Contact";
        self.updateButton.action = @selector(updateEmergencyContact:);
        self.updateButton.title = @"Update";
    } else {
        self.titleBar.title = @"New Emergency Contact";
        self.updateButton.title = @"Save";
        self.updateButton.action = @selector(insertNewObject:);
        [self clearFields];
    }
}

-(void)updateEmergencyContact:(id)sender {
    // Update the object
    if (self.emergencyContact) {
        [self.emergencyContact setValue:self.nameField.text forKey:@"name"];
        [self.emergencyContact setValue:self.phoneNumberField.text forKey:@"phoneNumber"];
    }
    // Go back
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clearFields {
    [self.nameField setText:@""];
    [self.phoneNumberField setText:@""];
}

- (IBAction)insertNewObject:(id)sender {
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
    EmergencyContact *newManagedObject = (EmergencyContact *) [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    // If appropriate, configure the new managed object.
    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
    [newManagedObject setValue:self.nameField.text forKey:@"name"];
    [newManagedObject setValue:self.phoneNumberField.text forKey:@"phoneNumber"];
    [newManagedObject setValue:[NSNumber numberWithInt:1] forKey:@"priority"];
    
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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
