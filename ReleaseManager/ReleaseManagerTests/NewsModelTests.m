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
    NewsNetworkService *newsNetwork = OCMStrictClassMock([NewsNetworkService class]);
    self.newsModel.networkService = newsNetwork;
    OCMStub([newsNetwork loadNews]);
    OCMStub([newsNetwork setDelegate:self.newsModel]);
    
    // act
    [self.newsModel loadNews];
    
    // assert
    OCMVerify([newsNetwork loadNews]);
}

@end
