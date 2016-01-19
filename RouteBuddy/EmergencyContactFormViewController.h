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

@interface EmergencyContactFormViewController : UIViewController

@property (weak, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (strong, nonatomic) id emergencyContact;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *updateButton;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleBar;

-(IBAction)updateEmergencyContact:(id)sender;

@end