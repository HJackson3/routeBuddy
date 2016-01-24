//
//  LocationSelectViewController.m
//  RouteBuddy
//
//  Created by Adam Lewis on 19/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import "LocationSelectViewController.h"

@interface LocationSelectViewController ()

@end

@implementation LocationSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    [self organiseLocationManager];
    if (!(self.coordinate.latitude == 0 && self.coordinate.longitude == 0)) {
        [self centreOnSavedCoordinate:self.coordinate];
    }
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onMapTap:)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    [self.mapView addGestureRecognizer:tapRecognizer];
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

-(void)mapView:(MKMapView*)mapView didUpdateUserLocation:(MKUserLocation*)userLocation {
    if (self.coordinate.latitude == 0 && self.coordinate.longitude == 0) {
        [self.locationManager stopUpdatingLocation];
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance ([userLocation location].coordinate, 2000, 2000);
        [mapView setRegion:region animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)centreOnSavedCoordinate:(CLLocationCoordinate2D)coord {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (coord, 2000, 2000);
    [self.mapView setRegion:region animated:YES];
    
    // Drop a pin in user location
    // Drop a pin in user location
    if ([self.name isEqualToString:@""])
        [self dropPinAtPoint:self.coordinate withLabel:@"Saved Location"];
    else
        [self dropPinAtPoint:self.coordinate withLabel:self.name];
}

- (void)selectCurrentPinLocation:(id)sender {
    if (self.pin) {
        [self.navigationController popViewControllerAnimated:TRUE];
        DestinationFormViewController *controller = (DestinationFormViewController*) [self.navigationController topViewController];
        controller.coordinate = self.coordinate;
    }
}

- (void)getCurrentLocation:(id)sender {
    // Center on the user location
    MKUserLocation *userLocation = self.mapView.userLocation;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance ([userLocation location].coordinate, 2000, 2000);
    [self.mapView setRegion:region animated:YES];
    
    // Drop a pin in user location
    if ([self.name isEqualToString:@""])
        [self dropPinAtPoint:[[userLocation location] coordinate] withLabel:@"Current Location"];
    else
        [self dropPinAtPoint:[[userLocation location] coordinate] withLabel:self.name];
}

-(void)onMapTap:(UITapGestureRecognizer *)recognizer {
    CGPoint point = [recognizer locationInView:self.mapView];
    CLLocationCoordinate2D tapPoint = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    if ([self.name isEqualToString:@""])
        [self dropPinAtPoint:tapPoint withLabel:@"Selected Location"];
    else
        [self dropPinAtPoint:tapPoint withLabel:self.name];
}

-(void)dropPinAtPoint:(CLLocationCoordinate2D)point withLabel:(NSString *)label {
    // Remove previous pin
    if (self.pin)
        [self.mapView removeAnnotations:[self.mapView annotations]];
    
    // Set the coordinate
    self.coordinate = point;
    
    // Add the new pin
    self.pin = [[MKPointAnnotation alloc] init];
    [self.pin setCoordinate:self.coordinate];
    [self.pin setTitle:label];
    [self.mapView addAnnotation:self.pin];
    [self.mapView selectAnnotation:self.pin animated:YES];
}

-(void)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
