//
//  LocationSelectViewController.h
//  RouteBuddy
//
//  Created by Adam Lewis on 19/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "ManagedObjectContextViewController.h"
#import "DestinationFormViewController.h"

@interface LocationSelectViewController : ManagedObjectContextViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, retain) CLLocationManager *locationManager;
@property CLLocationCoordinate2D coordinate;
@property (strong, nonatomic) MKPointAnnotation *pin;

-(void)organiseLocationManager;

- (IBAction)selectCurrentPinLocation:(id)sender;
- (IBAction)getCurrentLocation:(id)sender;

@end