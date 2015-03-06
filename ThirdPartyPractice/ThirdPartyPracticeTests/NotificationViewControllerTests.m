//
//  NotificationViewControllerTests.m
//  ThirdPartyPractice
//
//  Created by Vinita Miranda on 3/5/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NotificationViewController.h"
@interface NotificationViewController ()
@property(nonatomic)NSArray  *schedulenotifications;
@end

@interface NotificationViewControllerTests : XCTestCase
@property(nonatomic)NotificationViewController *notificationVC;

@end

@implementation NotificationViewControllerTests

- (void)setUp {
    [super setUp];
    self.notificationVC = [[NotificationViewController alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testFetchNotifications
{
 
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    localNotification.fireDate = [NSDate date];
    localNotification.alertBody = @"Hurray";;
    localNotification.timeZone =[NSTimeZone systemTimeZone];
    [[UIApplication  sharedApplication]scheduleLocalNotification:localNotification];
    
    [self.notificationVC fetchNotifications];
    
    XCTAssert([self.notificationVC.schedulenotifications count] == 1);
}

@end
