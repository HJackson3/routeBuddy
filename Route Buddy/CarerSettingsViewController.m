//
//  CarerSettingsViewController.m
//  Route Buddy
//
//  Created by Adam Lewis on 15/01/2016.
//  Copyright © 2016 Harry and Adam. All rights reserved.
//

#import "CarerSettingsViewController.h"

@interface CarerSettingsViewController ()

@end

@implementation CarerSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"emergencyContactListViewController"]) {
        // Obtain Reference to View Controller
        UINavigationController *nc = (UINavigationController *)[segue destinationViewController];
        EmergencyContactListViewController *vc = (EmergencyContactListViewController *)[nc topViewController];
        
        // Configure View Controller
        [vc setManagedObjectContext:self.managedObjectContext];
    }
}

@end
