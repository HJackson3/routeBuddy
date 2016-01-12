//
//  EmergencyContactFormViewController.h
//  Route Buddy
//
//  Created by Adam Lewis on 12/01/2016.
//  Copyright © 2016 Harry and Adam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "EmergencyContact.h"

@interface EmergencyContactFormViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@property (weak, nonatomic) IBOutlet UINavigationItem *navigationTitle;

@property (strong) EmergencyContact *emergencyContact;

- (void) onSubmitButtonClick;

@end