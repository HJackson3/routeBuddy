//
//  EmergencyContactListViewController.h
//  Route Buddy
//
//  Created by Adam Lewis on 14/01/2016.
//  Copyright © 2016 Harry and Adam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "EmergencyContactTableViewCell.h"

@interface EmergencyContactListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

-(void)configureCell: (EmergencyContactTableViewCell *) cell atIndexPath: (NSIndexPath *) indexPath;

@end
