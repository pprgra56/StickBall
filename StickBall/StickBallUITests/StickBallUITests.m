//
//  StickBallUITests.m
//  StickBallUITests
//
//  Created by 常琼 on 16/3/21.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface StickBallUITests : XCTestCase

@end

@implementation StickBallUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    

}

- (void)tearDown {

    [super tearDown];
}

- (void)testExample {


}

@end
