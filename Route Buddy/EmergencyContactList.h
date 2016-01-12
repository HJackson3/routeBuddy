//
//  EmergencyContactList.h
//  Route Buddy
//
//  Created by Adam Lewis on 12/01/2016.
//  Copyright © 2016 Harry and Adam. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "EmergencyContact.h"

@interface EmergencyContactList : NSManagedObjectContext

@property NSArray* emergencyContactArray;



@end
