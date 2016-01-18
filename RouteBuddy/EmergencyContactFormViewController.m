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
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    [self.phoneNumberField setKeyboardType:UIKeyboardTypePhonePad];
    
    // Update the user interface for the detail item.
    if (self.emergencyContact) {
        self.nameField.text = [[self.emergencyContact valueForKey:@"name"] description];
        self.phoneNumberField.text = [[self.emergencyContact valueForKey:@"phoneNumber"] description];
    }
}

-(void)updateEmergencyContact:(id)sender {
    // Update the object
    if (self.emergencyContact) {
        [self.emergencyContact setValue:self.nameField.text forKey:@"name"];
        [self.emergencyContact setValue:self.phoneNumberField.text forKey:@"phoneNumber"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
