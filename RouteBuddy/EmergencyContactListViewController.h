//
//  MasterViewController.h
//  RouteBuddy
//
//  Created by Adam Lewis on 17/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "EmergencyContactFormViewController.h"
#import "EmergencyContact.h"

@class EmergencyContactFormViewController;

@interface EmergencyContactListViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(void) insertNewObject:(id) sender;

-(IBAction)goBack:(id)sender;

@end