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

@property (strong, nonatomic) UIBarButtonItem *addButton;

@property (strong, nonatomic) EmergencyContactFormViewController *formViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(void) insertNewObject:(id) sender;

@end