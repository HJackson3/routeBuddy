//
//  ActiveRouteViewController.m
//  RouteBuddy
//
//  Created by Adam Lewis on 21/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import "ActiveRouteViewController.h"

@interface ActiveRouteViewController ()

@end

@implementation ActiveRouteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self organiseLocationManager];
    self.mapView.delegate = self;
    self.destinationLabel.text = self.destination.name;
    [self dropPinAtPoint:[self.destination getCoordinate] withLabel:@"Destination"];
    self.alreadyConstructed = false;
    self.destinationImage.image = [UIImage imageWithData:self.destination.image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)organiseLocationManager {
    if (self.locationManager==nil)
        self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestAlwaysAuthorization];
    self.mapView.showsUserLocation=YES;
    
}

-(void)dropPinAtPoint:(CLLocationCoordinate2D)point withLabel:(NSString *)label {
    // Remove previous pin
    if (self.pin)
        [self.mapView removeAnnotations:[self.mapView annotations]];
    
    // Add the new pin
    self.pin = [[MKPointAnnotation alloc] init];
    [self.pin setCoordinate:point];
    [self.pin setTitle:label];
    [self.mapView addAnnotation:self.pin];
}

-(void)mapView:(MKMapView*)mapView didUpdateUserLocation:(MKUserLocation*)userLocation {
    MKMapPoint p1 = MKMapPointForCoordinate([userLocation location].coordinate);
    MKMapPoint p2 = MKMapPointForCoordinate([self.destination getCoordinate]);
    double x = MIN(p1.x, p2.x);
    double y = MIN(p1.y, p2.y);
    double width = MAX(p1.x, p2.x) - x;
    double height = MAX(p1.y, p2.y) - y;
    double padding = 4.0;
    x = x - (width / (padding * 2.0));
    y = y - (height / (padding * 2.0));
    width = width + (width / padding);
    height = height + (height / padding);
    MKMapRect rect = MKMapRectMake(x, y, width, height);
    MKCoordinateRegion region = MKCoordinateRegionForMapRect(rect);
    [mapView setRegion:region animated:YES];
    if(!self.alreadyConstructed)
        [self constructRouteTo:[self.destination getCoordinate]];
}

-(MKDirections *)constructRouteTo:(CLLocationCoordinate2D)to {
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc]initWithCoordinate:to addressDictionary:NULL]];
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    [request setSource:[MKMapItem mapItemForCurrentLocation]];
    [request setDestination:mapItem];
    [request setTransportType:MKDirectionsTransportTypeWalking]; // This can be limited to automobile and walking directions.
    [request setRequestsAlternateRoutes:YES]; // Gives you several route options.
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        self.regionCenters = [[NSMutableArray alloc] init];
        if (!error) {
            for (MKRoute *route in [response routes]) {
                [self.mapView addOverlay:[route polyline] level:MKOverlayLevelAboveRoads];
                for (int i=0; i<route.polyline.pointCount-1; i++) {
                    CLLocationCoordinate2D coord = MKCoordinateForMapPoint(route.polyline.points[i]);
                    NSValue *value = [NSValue value:&coord withObjCType:@encode(CLLocationCoordinate2D)];
                    [self.regionCenters insertObject:value atIndex: i];
                }
                self.alreadyConstructed = true;
                self.regionIndex = 0;
                for (int i=0; i<3; i++)
                    [self registerRegionFromIndex:i];
            }
        }
    }];
    return directions;
}

-(void)registerRegionFromIndex:(int)index {
    NSString* ident = [[NSString alloc] initWithFormat:@"%d", index];
    CLLocationCoordinate2D coordinate;
    [self.regionCenters[index] getValue:&coordinate];
    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:coordinate radius:100 identifier:ident];
    [self.locationManager startMonitoringForRegion:region];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolyline *route = overlay;
        MKPolylineRenderer *routeRenderer = [[MKPolylineRenderer alloc] initWithPolyline:route];
        routeRenderer.strokeColor = [UIColor colorWithRed:0 green:0.5 blue:1 alpha:1];
        routeRenderer.lineWidth = 5;
        return routeRenderer;
    }
    else return nil;
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    
    // Check if in any other of locationManagers regions
    BOOL inAnotherRegion = false;
    for (CLCircularRegion* region in [manager monitoredRegions]) {
        if ([region containsCoordinate:manager.location.coordinate]) {
            inAnotherRegion = true;
        }
    }
    if (!inAnotherRegion) {
        // Notification for the user, prompt if they would like to call - remind them where they are headed.
    } else {
        // All is well, pop lowest numbered region, add next region from index
        if (![region.identifier isEqualToString:@"0"]) {
            int regIdent = [region.identifier intValue]; // TODO test to make sure this works
            // Start monitoring the new set
            int newIndex = regIdent + 3; // New region is "Two regions" ahead of
            [self registerRegionFromIndex:newIndex];
            // Stop monitoring the oldest
            CLRegion *deletedRegion = NULL; //TODO make deleted region - is in monitoredRegions NSSet
            [manager stopMonitoringForRegion:deletedRegion];
        }
    }
}

@end
