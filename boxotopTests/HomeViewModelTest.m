//
//  HomeViewModel.m
//  boxotop
//
//  Created by benjamin prieur on 06/08/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HomeViewModel.h"


@interface HomeViewModelTest : XCTestCase

@end

@implementation HomeViewModelTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUpdateMovies
{
    HomeViewModel *sut = [[HomeViewModel alloc] init];
    
    XCTAssertNotNil(sut.movies, @"");
}

@end
