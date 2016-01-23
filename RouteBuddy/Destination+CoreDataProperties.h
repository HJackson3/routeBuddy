//
//  Destination+CoreDataProperties.h
//  RouteBuddy
//
//  Created by Adam Lewis on 23/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Destination.h"

NS_ASSUME_NONNULL_BEGIN

@interface Destination (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *xLocation;
@property (nullable, nonatomic, retain) NSNumber *yLocation;
@property (nullable, nonatomic, retain) NSData *image;

@end

NS_ASSUME_NONNULL_END
