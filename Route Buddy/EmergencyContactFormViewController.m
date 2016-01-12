//
//  EmergencyContactFormViewController.m
//  Route Buddy
//
//  Created by Adam Lewis on 12/01/2016.
//  Copyright © 2016 Harry and Adam. All rights reserved.
//

#import "EmergencyContactFormViewController.h"

@implementation EmergencyContactFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Set the delegates for the text field to this so return hides the keyboard
    self.nameTextField.delegate = self;
    self.phoneNumberTextField.delegate = self;
    
    // Set phone number text field to open numeric keyboard
    self.phoneNumberTextField.keyboardType = UIKeyboardTypePhonePad;
    
    // If editing an emergency contact
    if (self.emergencyContact != NULL) {
        // Populate form if contact already exists
        [self.nameTextField setText: self.emergencyContact.name];
        [self.phoneNumberTextField setText: self.emergencyContact.phoneNumber];
        
        // Set the button and title text to edit
        [self.submitButton.titleLabel setText:@"Update"];
        self.navigationTitle.title = @"Update Emergency Contact";
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)onSubmitButtonClick {
    if (self.emergencyContact == NULL) {
        // Add a new emergency contact
        [[EmergencyContact alloc] initWithName:self.nameTextField.text PhoneNumber:self.phoneNumberTextField.text AndPriority:0];
    } else {
        // Update contact
    }
}

@end