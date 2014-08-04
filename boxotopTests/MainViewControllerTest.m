//
//  MainViewControllerTest.m
//  boxotop
//
//  Created by benjamin prieur on 30/07/2014.
//  Copyright (c) 2014 benjamin prieur. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface MainViewControllerTest : XCTestCase
{
    ViewController *_sut;
}

@end

@implementation MainViewControllerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    _sut = [storyBoard instantiateViewControllerWithIdentifier:@"MainView"];
    [_sut view];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    _sut = nil;
    [super tearDown];
}

- (void)testListBoxOfficeMovieNotEmpty
{
    XCTAssertNotNil([_sut getCurrentBoxOffice], @"box office not empty");
}

- (void)testTableViewIsLinked
{
    XCTAssertNotNil([_sut tableView], @"TableView Not Nil");
}

- (void)testTableViewDelegateLinked
{
    XCTAssertNotNil([_sut.tableView delegate], @"tableView delegate linked");
}

- (void)testTableViewDataSourceLinked
{
    XCTAssertNotNil([_sut.tableView dataSource], @"tableView dataSource linked");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

//- (void)testSomething {
//    __block BOOL done = NO;
//    
//    [obj asyncMethodUnderTestWithCompletionBlock:^{
//        done = YES;
//    }];
//    
//    XCTAssertTrue([self waitFor:&done timeout:2],
//                  @"Timed out waiting for response asynch method completion");
//}


- (BOOL)waitFor:(BOOL *)flag timeout:(NSTimeInterval)timeoutSecs {
    NSDate *timeoutDate = [NSDate dateWithTimeIntervalSinceNow:timeoutSecs];
    
    do {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:timeoutDate];
        if ([timeoutDate timeIntervalSinceNow] < 0.0) {
            break;
        }
    }
    while (!*flag);
    return *flag;
}

@end
