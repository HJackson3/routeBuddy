//
//  EmergencyCallViewController.h
//  RouteBuddy
//
//  Created by Adam Lewis on 24/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "EmergencyContact.h"
#import "EmergencyCallTableViewCell.h"

@interface EmergencyCallViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(IBAction)back:(id)sender;

@end
