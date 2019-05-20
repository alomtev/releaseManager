//
//  ReleaseManagerTests.m
//  ReleaseManagerTests
//
//  Created by Lomtev on 03.05.2019.
//  Copyright © 2019 Александр Ломтев. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "../ReleaseManager/NewsModel.h"
#import "../ReleaseManager/NewsNetworkService.h"

@interface NewsModelTests : XCTestCase

@property (nonatomic, strong) NewsModel *newsModel;

@end

@implementation NewsModelTests

- (void)setUp
{
    [super setUp];
    self.newsModel = [NewsModel new];
}

- (void)tearDown
{
    self.newsModel = nil;
    [super tearDown];
}

- (void)testLoadNews
{
    // arrange
    NewsNetworkService *newsNetwork = OCMClassMock([NewsNetworkService class]);
    self.newsModel.networkService = newsNetwork;
    OCMStub([newsNetwork loadNews]);
    OCMStub([newsNetwork setDelegate:self.newsModel]);
    
    // act
    [self.newsModel loadNews];
    
    // assert
    OCMVerify([newsNetwork loadNews]);
}

- (void)testProsessResponse
{
    // arrange
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestBundle.bundle/news_list" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    // act
    [self.newsModel prosessResponse:data];
    NSError *err;
    [self.newsModel.fetchedNewsController performFetch:&err];
    
    // assert
    XCTAssertNil(err);
    XCTAssertEqual(self.newsModel.fetchedNewsController.fetchedObjects.count, 3);
}

@end
