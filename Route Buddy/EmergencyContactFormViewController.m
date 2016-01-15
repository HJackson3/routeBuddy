//
//  EmergencyContactFormViewController.m
//  Route Buddy
//
//  Created by Adam Lewis on 15/01/2016.
//  Copyright © 2016 Harry and Adam. All rights reserved.
//

#import "EmergencyContactFormViewController.h"

@interface EmergencyContactFormViewController ()

@end

@implementation EmergencyContactFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Actions
//- (IBAction)cancel:(id)sender {
//    // Dismiss View Controller
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

- (IBAction)save:(id)sender {
    // Helpers
    NSString *name = self.nameField.text;
    NSString *phoneNumber = self.phoneNumberField.text;
    
    if (name && name.length && phoneNumber && phoneNumber.length) {
        // Create Entity
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"EmergencyContact" inManagedObjectContext:self.managedObjectContext];
        
        // Initialize Record
        NSManagedObject *record = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        
        // Populate Record
        [record setValue:name forKey:@"name"];
        [record setValue:phoneNumber forKey:@"phoneNumber"];
        
        // Save Record
        NSError *error = nil;
        
        if ([self.managedObjectContext save:&error]) {
            // Dismiss View Controller
            [self dismissViewControllerAnimated:YES completion:nil];
            
        } else {
            if (error) {
                NSLog(@"Unable to save record.");
                NSLog(@"%@, %@", error, error.localizedDescription);
            }
            
            // Show Alert View
            //[[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Contact could not be saved." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
        
    } else {
        // Show Alert View
        //[[[UIAlertView alloc] initWithTitle:@"Warning" message:@"You need to fill in all the fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}

@end
