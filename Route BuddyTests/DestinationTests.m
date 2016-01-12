//
//  DestinationTests.m
//  Route Buddy
//
//  Created by Harry Jackson on 11.01.16.
//  Copyright (c) 2016 Harry and Adam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Destination.h"

@interface DestinationTests : XCTestCase

@end

@implementation DestinationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    
    Destination* des = [[Destination alloc] initWithName:@"name" AndLocation:CLLocationCoordinate2DMake(1.0, 0.0)];
    XCTAssertTrue([des.name isEqual:@"name"]);
    XCTAssertTrue(des.location.latitude == 1.0);
    XCTAssertTrue(des.location.longitude == 0.0);
    
}

-(void)testSetNameAndLocation {
    
    Destination* des = [[Destination alloc] initWithName:@"name" AndLocation:CLLocationCoordinate2DMake(1.0, 0.0)];
    [des setName:@"new" AndLocation:CLLocationCoordinate2DMake(0.0, 1.0)];
    XCTAssertTrue([des.name isEqual:@"new"]);
    XCTAssertTrue(des.location.latitude == 0.0);
    XCTAssertTrue(des.location.longitude == 1.0);
}

@end
