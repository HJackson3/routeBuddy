//
//  EmergencyContactNewViewController.h
//  RouteBuddy
//
//  Created by Adam Lewis on 18/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "EmergencyContact.h"

@interface EmergencyContactNewViewController : UIViewController

@property (weak, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberField;

-(void)clearFields;

-(IBAction)insertNewObject: (id) sender;

@end
