//
//  EmergencyContact.m
//  Route Buddy
//
//  Created by Adam Lewis on 14/01/2016.
//  Copyright © 2016 Harry and Adam. All rights reserved.
//

#import "EmergencyContact.h"

@implementation EmergencyContact

-(void)insertInManagedObjectContext:(NSManagedObjectContext *)context {
    // Get the managed object
    NSManagedObject *ec = [NSEntityDescription insertNewObjectForEntityForName:@"EmergencyContact" inManagedObjectContext:context];
    
    // Set the values
    [ec setValue:self.name forKey:@"name"];
    [ec setValue:self.phoneNumber forKey:@"phoneNumber"];
    [ec setValue:self.priority forKey:@"priority"];
    
    // write the context to the persistent store
    NSError *error;
    if (![context save:&error])
        NSLog(@"Save failed: %@", [error localizedDescription]);
}

-(void)updateInManagedObjectContext:(NSManagedObjectContext *)context {
    
}

-(void)deleteFromManagedObjectContext:(NSManagedObjectContext *)context {
    
}

@end
