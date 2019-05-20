//
//  ReleaseManagerUITests.m
//  ReleaseManagerUITests
//
//  Created by Lomtev on 03.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NewsModelUITests : XCTestCase

@end

@implementation NewsModelUITests

- (void)setUp
{
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testLoadNews
{    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.tables.staticTexts[@"Заголовок 3"] tap];
    [app.navigationBars[@"NewsDetailsView"].buttons[@"Релизные новости"] tap];
}

@end
