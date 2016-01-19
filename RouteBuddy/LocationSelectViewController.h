//
//  LocationSelectViewController.h
//  RouteBuddy
//
//  Created by Adam Lewis on 19/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "ManagedObjectContextViewController.h"

@interface LocationSelectViewController : ManagedObjectContextViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)selectCurrentPinLocation:(id)sender;
- (IBAction)getCurrentLocation:(id)sender;

@end
