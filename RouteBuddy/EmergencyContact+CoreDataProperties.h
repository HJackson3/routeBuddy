//
//  EmergencyContact+CoreDataProperties.h
//  RouteBuddy
//
//  Created by Adam Lewis on 24/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "EmergencyContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface EmergencyContact (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *phoneNumber;
@property (nullable, nonatomic, retain) NSNumber *priority;
@property (nullable, nonatomic, retain) NSData *image;

@end

NS_ASSUME_NONNULL_END
