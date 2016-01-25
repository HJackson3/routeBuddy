//
//  HomeViewController.h
//  RouteBuddy
//
//  Created by Adam Lewis on 19/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActiveRouteViewController.h"
#import "Destination.h"
#import "HomeViewDestinationCell.h"

@interface HomeViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) Destination *selectedDestination;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSFetchedResultsController *emergencyContactsfetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(void)selectDestination: (Destination*) destination;

-(void)performAlertAboutEmergencyContacts;

@end
