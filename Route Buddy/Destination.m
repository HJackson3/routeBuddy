//
//  Destination.m
//  Route Buddy
//
//  Created by Harry Jackson on 11.01.16.
//  Copyright (c) 2016 Harry and Adam. All rights reserved.
//

#import "Destination.h"

@implementation Destination

-(id)initWithName:(NSString *)name AndLocation:(CLLocationCoordinate2D)location {

    self = [super init];
    
    self.name = name;
    self.location = location;
    
    return self;
}

-(void)setName:(NSString *)name AndLocation:(CLLocationCoordinate2D)location {
    
    self.name = name;
    self.location = location;
    
}

@end
