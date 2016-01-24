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
    if ([name isEqualToString:@""]) {
        return false;
    }else if ([phoneNumber isEqualToString:@""]) {
        return false;
    }else if ([phoneNumber intValue] == 0) { // TODO Maybe regex to avoid silly input
        return false;
    } else {
        return true;
    }
}

-(NSURL*)getPhoneNSURL {
    return [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",self.phoneNumber]];
}

@end
