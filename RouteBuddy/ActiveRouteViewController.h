//
//  ActiveRouteViewController.h
//  RouteBuddy
//
//  Created by Adam Lewis on 21/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "ManagedObjectContextViewController.h"
#import "Destination.h"

@interface ActiveRouteViewController : ManagedObjectContextViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) Destination *destination;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *destinationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *destinationImage;
@property (strong, retain) CLLocationManager *locationManager;
@property (strong, nonatomic) MKPointAnnotation *pin;
@property (strong, nonatomic) NSMutableArray *regionCenters;
@property (atomic) int regionIndex;
@property BOOL alreadyConstructed;

- (void)dropPinAtPoint:(CLLocationCoordinate2D) point withLabel:(NSString*) label;

-(void)organiseLocationManager;

-(MKDirections*)constructRouteTo: (CLLocationCoordinate2D) to;

-(void) makeRegionForLocationManager: (CLLocationManager *) manager fromIndex: (int) index;



@end