//
//  EmergencyContact.m
//  Route Buddy
//
//  Created by Harry Jackson on 11.01.16.
//  Copyright (c) 2016 Harry and Adam. All rights reserved.
//

#import "EmergencyContact.h"

@implementation EmergencyContact

-(id)initWithName:(NSString *)name PhoneNumber:(NSString *)phoneNumber AndPriority:(int)priority {
    
    self = [super init];
    if(self){
        self.name = name;
        self.phoneNumber = phoneNumber;
        self.priority = priority;
    }
    return self;
    
}

-(void)updateName:(NSString *)name AndPhoneNumber:(NSString *)phoneNumber {
    
    self.name = name;
    self.phoneNumber = phoneNumber;
    
}

@end
