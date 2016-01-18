//
//  DetailViewController.h
//  RouteBuddy
//
//  Created by Adam Lewis on 17/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmergencyContactFormViewController : UIViewController

@property (strong, nonatomic) id emergencyContact;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;

-(IBAction)updateEmergencyContact:(id)sender;

@end

