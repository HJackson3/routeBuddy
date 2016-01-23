//
//  Destination.m
//  RouteBuddy
//
//  Created by Adam Lewis on 19/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import "Destination.h"

@implementation Destination

-(CLLocationCoordinate2D)getCoordinate {
    return CLLocationCoordinate2DMake(
        [self.xLocation doubleValue],
        [self.yLocation doubleValue]
    );
}

@end
