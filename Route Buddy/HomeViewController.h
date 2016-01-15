//
//  ViewController.h
//  Route Buddy
//
//  Created by Adam Lewis on 11/01/2016.
//  Copyright © 2016 Harry and Adam. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CarerSettingsViewController.h"

@interface HomeViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak, nonatomic) IBOutlet UIView *DestinationsView;

@end

