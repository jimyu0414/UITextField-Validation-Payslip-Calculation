//
//  TextfieldValidationTests.m
//  MonthlyPayslip
//
//  Created by yu on 25/02/2015.
//  Copyright (c) 2015 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TextfieldValidation.h"

@interface InputPayslipControllerTests : XCTestCase
{
    TextfieldValidation *validator;
}
@end

@implementation InputPayslipControllerTests

- (void)setUp {
    [super setUp];
    validator = [[TextfieldValidation alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testtextFieldNotFilledTure
{
    NSString *str = @"";
    BOOL flag = [validator textFieldNotFilled:str];
    XCTAssertTrue(flag);
    
}

-(void)testtextFieldNotFilledFalse
{
    NSString *str = @"1";
    BOOL flag = [validator textFieldNotFilled:str];
    XCTAssertFalse(flag,@"textField is not empty");
}

-(void)testtextFieldisNumericTure
{
    NSString *str=@"12.22";
    BOOL flag = [validator textFieldisNumeric:str];
    XCTAssertTrue(flag);
}
-(void)testtextFieldisNumericFalse
{
    NSString *str=@"abc123";
    BOOL flag = [validator textFieldisNumeric:str];
    XCTAssertFalse(flag);
}
-(void)testtextFieldNumberisNegativeTure
{
    NSString *str=@"-5500.5555";
    BOOL flag = [validator textFieldNumberisNegative:str];
    XCTAssertTrue(flag);
}
-(void)testtextFieldNumberisNegativeFlase
{
    NSString *str=@"75500.5555";
    BOOL flag = [validator textFieldNumberisNegative:str];
    XCTAssertFalse(flag);
}

-(void)testtextFieldNumberBetweenZeroToOneTure
{
    NSString *str = @"0.09999";
    BOOL flag = [validator textFieldNumberBetweenZeroToOne:str];
    XCTAssertTrue(flag);
}

-(void)testtextFieldNumberBetweenZeroToOneFalse
{
    NSString *str = @"1";
    BOOL flag1 = [validator textFieldNumberBetweenZeroToOne:str];
    NSString *str1 = @"0";
    BOOL flag0 = [validator textFieldNumberBetweenZeroToOne:str1];
    XCTAssertFalse(flag1);
    XCTAssertFalse(flag0);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
