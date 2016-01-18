//
//  EmergencyContactNewViewController.m
//  RouteBuddy
//
//  Created by Adam Lewis on 18/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import "EmergencyContactNewViewController.h"

@interface EmergencyContactNewViewController ()

@end

@implementation EmergencyContactNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self clearFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
