//
//  CarerSettingsViewController.h
//  RouteBuddy
//
//  Created by Adam Lewis on 25/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "ManagedObjectContextViewController.h"

@interface CarerSettingsViewController : ManagedObjectContextViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

-(void) performAlertAboutEmergencyContacts;

@end
