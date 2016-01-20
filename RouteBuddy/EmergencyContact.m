//
//  EmergencyContact.m
//  RouteBuddy
//
//  Created by Adam Lewis on 18/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import "EmergencyContact.h"

@implementation EmergencyContact

+(BOOL)isValidName:(NSString *)name AndPhoneNumber:(NSString *)phoneNumber {
//    Boolean valid = true;
    if ([name isEqualToString:@""]) {
        return false;
    }else if ([phoneNumber isEqualToString:@""]) {
        return false;
    }else if ([phoneNumber intValue] == 0) {
        return false;
    } else {
        return true;
    }
}

@end
