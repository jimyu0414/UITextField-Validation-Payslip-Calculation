//
//  PaySlipCalculator.m
//  MonthlyPayslip
//
//  Created by yu on 25/02/2015.
//  Copyright (c) 2015 yu. All rights reserved.
//

#import "PaySlipCalculator.h"

@implementation PaySlipCalculator

-(NSInteger)getGrossIncom:(NSString *)text
{
    NSInteger grossincome = lroundf([text floatValue] / 12);
    return grossincome;
}

-(NSInteger)calculateTax:(NSString *)text
{
    NSInteger tax = 0.0;
    float AnnualIncome = [text floatValue];
    
    if (AnnualIncome >= 0 && AnnualIncome <= 18200 ) {
        tax = 0;
    }
    if (AnnualIncome >= 18201 && AnnualIncome <= 37000) {
        tax = (AnnualIncome - 18200)*0.19/12;
    }
    if (AnnualIncome >=37001 && AnnualIncome <=80000) {
        tax = (3572+(AnnualIncome - 37000)*0.325)/12;
    }
    if (AnnualIncome >=80001 && AnnualIncome <=180000) {
        tax = (17547+(AnnualIncome - 80000)*0.37)/12;
    }
    if (AnnualIncome >= 180001) {
        tax = (54547+(AnnualIncome - 180000)*0.45)/12;
    }
    
    return lroundf(tax);
}

@end
