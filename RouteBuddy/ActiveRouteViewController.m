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
    double padding = 5.0;
    x = x - (width / (padding * 2.0));
    y = y - (height / (padding * 2.0));
    width = width + (width / padding);
    height = height + (height / padding);
    MKMapRect rect = MKMapRectMake(x, y, width, height);
    MKCoordinateRegion region = MKCoordinateRegionForMapRect(rect);
    [mapView setRegion:region animated:YES];
}

@end
