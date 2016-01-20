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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectCurrentPinLocation:(id)sender {
    // TODO set location and forward back to previous view controller
}

- (IBAction)getCurrentLocation:(id)sender {
    MKUserLocation *userLocation = self.mapView.userLocation;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance (userLocation.location.coordinate, 2000, 2000);
    [_mapView setRegion:region animated:NO];
    // TODO drop a pin in user location
}

@end
