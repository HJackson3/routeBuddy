//
//  AddEmergencyContactsTests.m
//  RouteBuddy
//
//  Created by Harry Jackson on 25.01.16.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AddEmergencyContactsTests : XCTestCase

@end

@implementation AddEmergencyContactsTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

//-(void)testAddFirstEmergencyContactHasDestination {
//    
//}
//-(void)testAddFirstEmergencyContactNoDestination {
//    
//}
//-(void)testAddOtherEmergencyContactHasDestination {
//    
//}
//-(void)testAddOtherEmergencyContactNoDestination {
//    
//}
-(void)testValidateNoName {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.navigationBars[@"Route Buddy"].buttons[@"Settings"] tap];
    [app.buttons[@"Emergency Contacts"] tap];
    [app.tables.buttons[@"+ Add"] tap];
    
    XCUIElement *textField = [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"New Emergency Contact"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
    [textField tap];
    [textField typeText:@"2"];
    [app.navigationBars[@"New Emergency Contact"].buttons[@"Save"] tap];
    
}
-(void)testValidateNoNumber {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.navigationBars[@"Route Buddy"].buttons[@"Settings"] tap];
    [app.buttons[@"Emergency Contacts"] tap];
    [app.tables.buttons[@"+ Add"] tap];
    [[[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"New Emergency Contact"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0] tap];
    [app.otherElements[@"The"] tap];
    [app.navigationBars[@"New Emergency Contact"].buttons[@"Save"] tap];
}
-(void)testValidateNoNameOrNumber {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.navigationBars[@"Route Buddy"].buttons[@"Settings"] tap];
    [app.buttons[@"Emergency Contacts"] tap];
    [app.tables.buttons[@"+ Add"] tap];
    [app.navigationBars[@"New Emergency Contact"].buttons[@"Save"] tap];
    
}
@end
