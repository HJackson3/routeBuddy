//
//  Destination.h
//  Route Buddy
//
//  Created by Harry Jackson on 11.01.16.
//  Copyright (c) 2016 Harry and Adam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Destination : NSObject

@property NSString* name;
@property CLLocationCoordinate2D location;

-(id)initWithName:(NSString *)name AndLocation:(CLLocationCoordinate2D)location;
-(void) setName:(NSString *)name AndLocation:(CLLocationCoordinate2D)location;

@end
