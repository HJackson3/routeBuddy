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
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
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
    if(!self.alreadyConstructed) {
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
        self.alreadyConstructed = true;
        [self constructRouteTo:[self.destination getCoordinate]];
    }
    [self checkRouteWithUserLocation: [userLocation location].coordinate];
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
        self.regions = [[NSMutableArray alloc] init];
        self.monitoredRegions = [[NSMutableArray alloc] init];
        if (!error) {
            for (MKRoute *route in [response routes]) {
                [self.mapView addOverlay:[route polyline] level:MKOverlayLevelAboveRoads];
                for (int i=0; i<route.polyline.pointCount-1; i++) {
                    CLLocationCoordinate2D coord = MKCoordinateForMapPoint(route.polyline.points[i]);
                    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:coord radius:100 identifier:[[NSString alloc] initWithFormat:@"%d", i]];
                    [self.regions insertObject:region atIndex: i];
                    
//                    // Add the new pin
//                    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
//                    [pin setCoordinate:coord];
//                    [self.mapView addAnnotation:pin];
                }
                self.currentRegionIndex = 0;
                for (int i=0; i<3; i++)
                     [self pushRegionFromIndex:i];
            }
        }
    }];
    return directions;
}

-(void)pushRegionFromIndex:(int)index {
    CLCircularRegion *region = [self.regions objectAtIndex:index];
    int pushIndex = (int) [self.monitoredRegions count];
    [self.monitoredRegions insertObject:region atIndex:pushIndex];
}

-(void)popRegionAtIndex:(int)index {
    [self.monitoredRegions removeObjectAtIndex:index];
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

// Location manager did enter / exit region adds a padding of 200m for the region which is too inaccurate for our purpose.
//-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)exitedRegion {
//    NSLog(@"Did exit region %@", exitedRegion.identifier);
//    
//    // Check if in any other of locationManagers regions
//    BOOL inAnotherRegion = false;
//    for (CLCircularRegion* region in [manager monitoredRegions]) {
//        NSLog(@"Region %@ is still being monitored", region.identifier);
//        [self drawRegionOnMap:self.mapView withCoordinate:region.center andRadius:region.radius];
//        if ([region containsCoordinate:manager.location.coordinate]) {
//            NSLog(@"Still in region %@", region.identifier);
//            inAnotherRegion = true;
//        }
//    }
//    if (!inAnotherRegion) {
//        // Notification for the user, prompt if they would like to call - remind them where they are headed.
//        if (!self.notification) {
//            [self makeNotificationWithTitle:@"Not on route" withBody:@"Are you lost? Would you like to call someone?" andDisplayAfterTime:5];
//        }
//    } else {
//        // All is well, pop lowest numbered region, add next region from index
//        if (![exitedRegion.identifier isEqualToString:@"0"]) {
//            int regIdent = [exitedRegion.identifier intValue]; // TODO test to make sure this works
//            
//            // Start monitoring the new set
//            int newIndex = regIdent + 3; // New region is "Two regions" ahead of
//            [self registerRegionFromIndex:newIndex];
//            
//            // Stop monitoring the oldest
//            CLRegion* deletedRegion = NULL;
//            int oldIndex = regIdent - 2;
//            for (CLCircularRegion* region in [manager monitoredRegions]) {
//                NSString* testIdent = [[NSString alloc]initWithFormat:@"%d",oldIndex];
//                if ([region.identifier isEqualToString:testIdent])  {
//                    deletedRegion = region;
//                }
//            }
//            [manager stopMonitoringForRegion:deletedRegion];
//        }
//    }
//}

// Location manager did enter / exit region adds a padding of 200m for the region which is too inaccurate for our purpose.
//-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
//    NSLog(@"Did enter region %@", region.identifier);
//    // This will kill any UILocalNotifications that exist
//    if (self.notification) {
//        [[UIApplication sharedApplication] cancelLocalNotification:self.notification];
//        self.notification = nil;
//    }
//}

-(void)makeNotificationWithTitle:(NSString *)title withBody:(NSString *)body andDisplayAfterTime:(int)seconds {
    self.notification = [[UILocalNotification alloc] init];
    self.notification.alertTitle = title;
    self.notification.alertBody = body;
    self.notification.timeZone = [NSTimeZone defaultTimeZone];
    self.notification.alertAction = nil;
    self.notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:seconds];
    [[UIApplication sharedApplication] scheduleLocalNotification:self.notification];
}

-(void)checkRouteWithUserLocation:(CLLocationCoordinate2D)location {
    // Approx
    for (CLCircularRegion *region in self.regions)
        if ([region containsCoordinate:location]) {
            // Stop timer for notification
            if (self.notification) {
                [[UIApplication sharedApplication] cancelAllLocalNotifications];
                self.notification = nil;
            }
        } else if (!self.notification) {
            // Start timer for notification
            [self makeNotificationWithTitle:@"Not on route" withBody:@"Are you lost? Would you like to call someone?" andDisplayAfterTime:2];
        }
    
    // Real
    // for each region as r
        // if is inside r
            // set bool to true and break from loop (for efficiency)
            // keep hold of r
    //
    
}

@end
