//
//  EmergencyContactTests.m
//  Route Buddy
//
//  Created by Harry Jackson on 12.01.16.
//  Copyright (c) 2016 Harry and Adam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "EmergencyContact.h"

@interface EmergencyContactTests : XCTestCase

@end

@implementation EmergencyContactTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testInit {
    EmergencyContact* ec = [[EmergencyContact alloc] initWithName:@"name" PhoneNumber:@"999" AndPriority:0];
    XCTAssertTrue([ec.name isEqual:@"name"]);
    XCTAssertTrue([ec.phoneNumber isEqual:@"999"]);
    XCTAssertTrue(ec.priority == 0);
}

-(void)testUpdate {
    EmergencyContact* ec = [[EmergencyContact alloc] initWithName:@"name" PhoneNumber:@"999" AndPriority:0];
    [ec updateName:@"new" AndPhoneNumber:@"911"];
    XCTAssertTrue([ec.name isEqual:@"new"]);
    XCTAssertTrue([ec.phoneNumber isEqual:@"911"]);
    XCTAssertTrue(ec.priority == 0);
}

@end
