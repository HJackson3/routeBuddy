//
//  DestinationFormViewController.h
//  RouteBuddy
//
//  Created by Adam Lewis on 19/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>

#import "Destination.h"
#import "LocationSelectViewController.h"

@interface DestinationFormViewController : UIViewController

@property (weak, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (strong, nonatomic) id destination;

@property CLLocationCoordinate2D coordinate;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *updateButton;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleBar;

-(IBAction)updateDestination:(id)sender;

-(IBAction)insertNewObject:(id)sender;

@end
