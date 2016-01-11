//
//  Destination.h
//  Route Buddy
//
//  Created by Harry Jackson on 11.01.16.
//  Copyright (c) 2016 Harry and Adam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Destination : NSObject

@property NSString* name;
@property NSString* location;

-(id)initWithName:(NSString *)name AndLocation:(NSString*)location;
-(void) setName:(NSString *)name AndLocation:(NSString*)location;

@end
