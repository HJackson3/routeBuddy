//
//  EmergencyContactTests.m
//  RouteBuddy
//
//  Created by Harry Jackson on 19.01.16.
//  Copyright © 2016 The University of Sheffield. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmergencyContact.h"

@interface EmergencyContactTests : XCTestCase

@property (strong, nonatomic) NSManagedObjectContext* moc;

@property EmergencyContact* ec;
@property NSString* n;
@property NSString* pN;

@end

@implementation EmergencyContactTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"RouteBuddy" withExtension:@"momd"];
//    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
//    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
//    XCTAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL] ? YES : NO, @"Should be able to add in-memory store");
//    self.moc = [[NSManagedObjectContext alloc] init];
//    self.moc.persistentStoreCoordinator = psc;

//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"EmergencyContact" inManagedObjectContext:self.moc];
//    self.ec = (EmergencyContact *) [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:self.moc];
    
    self.n = @"";
    self.pN = @"";
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testisValidNameAndPhoneNumberWorks {
    self.n = @"test";
    self.pN = @"1234";
    XCTAssertTrue([EmergencyContact isValidName:self.n AndPhoneNumber:self.pN]);
    
}
- (void)testisValidNameAndPhoneNumberWrongName {
    self.n = @"";
    self.pN = @"1234";
    XCTAssertFalse([EmergencyContact isValidName:self.n AndPhoneNumber:self.pN]);
}
- (void)testisValidNameAndPhoneNumberWrongPhoneNumber {
    self.n = @"test";
    self.pN = @"";
    XCTAssertFalse([EmergencyContact isValidName:self.n AndPhoneNumber:self.pN]);
}
- (void)testisValidNameAndPhoneNumberNonNumberPhoneNumber {
    self.n = @"test";
    self.pN = @"notNumber";
    XCTAssertFalse([EmergencyContact isValidName:self.n AndPhoneNumber:self.pN]);
}

@end
