//
//  DestinationsTests.m
//  RouteBuddy
//
//  Created by Adam Lewis on 25/01/2016.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface DestinationsTests : XCTestCase

@end

@implementation DestinationsTests

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

-(void)testAddDestinationSelectCurrentLocationFillingInName {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.navigationBars[@"Route Buddy"].buttons[@"Settings"] tap];
    [app.buttons[@"Destinations"] tap];
    [app.tables.buttons[@"+ Add"] tap];
    
    XCUIElement *textField = [[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"New Destination"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField].element;
    [textField tap];
    [textField typeText:@"Place"];
    [app.buttons[@"Return"] tap];
    [app.buttons[@"Select a Location"] tap];
    [app.buttons[@"Pin Current Location"] tap];
    [app.navigationBars[@"Select a Location"].buttons[@"Select"] tap];
    [app.navigationBars[@"New Destination"].buttons[@"Save"] tap];
    
}

-(void)testAddDestinationSelectLocationOnMapFillingInName {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.navigationBars[@"Route Buddy"].buttons[@"Settings"] tap];
    [app.buttons[@"Destinations"] tap];
    [app.tables.buttons[@"+ Add"] tap];
    
    XCUIElement *textField = [[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"New Destination"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField].element;
    [textField tap];
    [textField typeText:@"Place"];
    [app.buttons[@"Return"] tap];
    [app.buttons[@"Select a Location"] tap];
    [[[[[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Select a Location"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeMap].element tap];
    [app.navigationBars[@"Select a Location"].buttons[@"Select"] tap];
    [app.navigationBars[@"New Destination"].buttons[@"Save"] tap];
    
}

-(void)testAddDestinationSelectCurrentLocationWithoutFillingInName {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.navigationBars[@"Route Buddy"].buttons[@"Settings"] tap];
    [app.buttons[@"Destinations"] tap];
    [app.tables.buttons[@"+ Add"] tap];
    [app.buttons[@"Select a Location"] tap];
    [app.buttons[@"Pin Current Location"] tap];
    [app.navigationBars[@"Select a Location"].buttons[@"Select"] tap];
    [app.navigationBars[@"New Destination"].buttons[@"Save"] tap];
    
    XCTAssert(app.alerts[@"Invalid input"] != nil);
    
    if (app.alerts[@"Invalid input"])
        [app.alerts[@"Invalid input"].collectionViews.buttons[@"OK"] tap];
}

-(void)testEditDestinationSelectNewLocationRemoveName {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.navigationBars[@"Route Buddy"].buttons[@"Settings"] tap];
    [app.buttons[@"Destinations"] tap];
    [[[app.tables childrenMatchingType:XCUIElementTypeCell] elementBoundByIndex:3].staticTexts[@"Place"] tap];
    [app.buttons[@"Select a Location"] tap];
    [app.otherElements[@"PopoverDismissRegion"] tap];
    [app.navigationBars[@"Select a Location"].buttons[@"Select"] tap];
    [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Edit Destination"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField].element tap];
    
    XCUIElement *deleteKey = app.keys[@"delete"];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [app.buttons[@"Return"] tap];
    [app.navigationBars[@"Edit Destination"].buttons[@"Update"] tap];
    
    XCTAssert(app.alerts[@"Invalid input"] != nil);
    
    if (app.alerts[@"Invalid input"])
        [app.alerts[@"Invalid input"].collectionViews.buttons[@"OK"] tap];
    
}

-(void)testEditDestinationSelectNewLocationChangeName {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.navigationBars[@"Route Buddy"].buttons[@"Settings"] tap];
    [app.buttons[@"Destinations"] tap];
    [[[app.tables childrenMatchingType:XCUIElementTypeCell] elementBoundByIndex:1].staticTexts[@"Place"] tap];
    
    XCUIElement *textField = [[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Edit Destination"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField].element;
    [textField tap];
    
    XCUIElement *deleteKey = app.keys[@"delete"];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [deleteKey tap];
    [textField typeText:@"Other Place"];
    [app.buttons[@"Return"] tap];
    [app.buttons[@"Select a Location"] tap];
    [[[[[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Select a Location"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element tap];
    [app.navigationBars[@"Select a Location"].buttons[@"Select"] tap];
    [app.navigationBars[@"Edit Destination"].buttons[@"Update"] tap];
    
}

-(void)testDeleteDestination {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.navigationBars[@"Route Buddy"].buttons[@"Settings"] tap];
    [app.alerts[@"No emergency contacts"].collectionViews.buttons[@"OK"] tap];
    [app.buttons[@"Destinations"] tap];
    
    XCUIElementQuery *tablesQuery = app.tables;
    XCUIElement *cell = [[tablesQuery childrenMatchingType:XCUIElementTypeCell] elementBoundByIndex:2];
    
    XCUIElement *destinationsNavigationBar = app.navigationBars[@"Destinations"];
    [destinationsNavigationBar.buttons[@"Edit"] tap];
    [cell.buttons[@"Delete Place"] tap];
    [tablesQuery.buttons[@"Delete"] tap];
    [destinationsNavigationBar.buttons[@"Done"] tap];
    
}

@end
