//
//  MasterViewController.h
//  RouteBuddy
//
//  Created by Adam Lewis on 17/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "EmergencyContactEditViewController.h"
#import "EmergencyContactNewViewController.h"
#import "EmergencyContact.h"

@class EmergencyContactEditViewController;

@interface EmergencyContactListViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) EmergencyContactEditViewController *editViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(void) insertNewObject:(id) sender;


@end