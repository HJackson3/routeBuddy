//
//  EmergencyContact.h
//  RouteBuddy
//
//  Created by Adam Lewis on 18/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface EmergencyContact : NSManagedObject

+(BOOL) isValidName:(NSString*)name AndPhoneNumber:(NSString*)phoneNumber;

-(NSURL*)getPhoneNSURL;

@end

NS_ASSUME_NONNULL_END

#import "EmergencyContact+CoreDataProperties.h"