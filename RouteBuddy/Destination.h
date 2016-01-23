//
//  Destination.h
//  RouteBuddy
//
//  Created by Adam Lewis on 19/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Destination : NSManagedObject

-(CLLocationCoordinate2D) getCoordinate;

@end

NS_ASSUME_NONNULL_END

#import "Destination+CoreDataProperties.h"
