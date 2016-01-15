//
//  EmergencyContact.h
//  Route Buddy
//
//  Created by Adam Lewis on 14/01/2016.
//  Copyright © 2016 Harry and Adam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface EmergencyContact : NSManagedObject

-(void)insertInManagedObjectContext:(NSManagedObjectContext*) context;

-(void)updateInManagedObjectContext: (NSManagedObjectContext*) context;

-(void)deleteFromManagedObjectContext: (NSManagedObjectContext*) context;

@end

NS_ASSUME_NONNULL_END

#import "EmergencyContact+CoreDataProperties.h"
