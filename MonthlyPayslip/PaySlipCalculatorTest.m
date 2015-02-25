//
//  PaySlipCalculatorTest.m
//  MonthlyPayslip
//
//  Created by yu on 25/02/2015.
//  Copyright (c) 2015 yu. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "PaySlipCalculator.h"

@interface PaySlipCalculatorTest : XCTestCase
{
    PaySlipCalculator *calculator;
}
@end

@implementation PaySlipCalculatorTest

- (void)setUp {
    [super setUp];
    calculator = [[PaySlipCalculator alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testgetGrossIncom
{
    NSString *str = @"5500.44";
    NSInteger income = [calculator getGrossIncom:str];
    BOOL flag = false;
    if (income >0) {
        flag = true;
    }
    XCTAssert(flag);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
