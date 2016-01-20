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
    NSLog(@"%f %f", self.coordinate.latitude, self.coordinate.longitude);
    if (!(self.coordinate.latitude == 0 && self.coordinate.longitude == 0)) {
        [self centreOnSavedCoordinate:self.coordinate];
    }
//    MKUserLocation *userLocation = self.mapView.userLocation;
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
    CLLocationCoordinate2D point = self.coordinate;
    self.pin = [[MKPointAnnotation alloc] init];
    [self.pin setCoordinate:point];
    [self.pin setTitle:@"Saved Location"]; //You can set the subtitle too
    [self.mapView addAnnotation:self.pin];
}

- (IBAction)selectCurrentPinLocation:(id)sender {
    if (self.pin) {
        [self.navigationController popViewControllerAnimated:TRUE];
        DestinationFormViewController *controller = (DestinationFormViewController*) [self.navigationController topViewController];
        controller.coordinate = self.coordinate;
    }
}

- (IBAction)getCurrentLocation:(id)sender {
    // Center on the user location
    MKUserLocation *userLocation = self.mapView.userLocation;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance ([userLocation location].coordinate, 2000, 2000);
    [self.mapView setRegion:region animated:YES];
    
    // Remove previous pin
    if (self.pin)
        [self.mapView removeAnnotations:[self.mapView annotations]];
    
    // Drop a pin in user location
    self.coordinate = [[userLocation location] coordinate];
    self.pin = [[MKPointAnnotation alloc] init];
    [self.pin setCoordinate:self.coordinate];
    [self.pin setTitle:@"Current Location"];
    [self.mapView addAnnotation:self.pin];
}

@end
