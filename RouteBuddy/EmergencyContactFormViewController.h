//
//  DetailViewController.h
//  RouteBuddy
//
//  Created by Adam Lewis on 17/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "EmergencyContact.h"

@interface EmergencyContactFormViewController : UIViewController <UIImagePickerControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (strong, nonatomic) EmergencyContact *emergencyContact;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *updateButton;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleBar;

-(void) dismissKeyboards;

-(IBAction)updateEmergencyContact:(id)sender;

-(IBAction)insertNewObject:(id)sender;

-(IBAction)back:(id)sender;

- (IBAction)takePhoto:(id)sender;
- (IBAction)selectFromGallery:(id)sender;

-(BOOL)isValidForm;

@end