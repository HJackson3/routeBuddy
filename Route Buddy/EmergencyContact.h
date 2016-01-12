//
//  EmergencyContact.h
//  Route Buddy
//
//  Created by Harry Jackson on 11.01.16.
//  Copyright (c) 2016 Harry and Adam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface EmergencyContact : NSManagedObject

@property NSString* name;
@property NSString* phoneNumber;
@property int priority;

-(id)initWithName:(NSString*)name PhoneNumber:(NSString*)phoneNumber AndPriority:(int)priority;

-(void)updateName:(NSString*)name AndPhoneNumber:(NSString*)phoneNumber;

@end
