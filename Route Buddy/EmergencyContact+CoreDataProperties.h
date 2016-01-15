//
//  EmergencyContact+CoreDataProperties.h
//  Route Buddy
//
//  Created by Adam Lewis on 14/01/2016.
//  Copyright © 2016 Harry and Adam. All rights reserved.
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

@end

NS_ASSUME_NONNULL_END
