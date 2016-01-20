//
//  ManagedObjectContextViewController.m
//  RouteBuddy
//
//  Created by Adam Lewis on 19/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import "ManagedObjectContextViewController.h"

@interface ManagedObjectContextViewController ()

@end

@implementation ManagedObjectContextViewController

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *controller = [segue destinationViewController];
    if ([controller respondsToSelector:@selector(setManagedObjectContext:)])
        [controller performSelector:@selector(setManagedObjectContext:) withObject:self.managedObjectContext];
}

@end
