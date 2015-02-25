//
//  TextfieldValidation.m
//  MonthlyPayslip
//
//  Created by yu on 25/02/2015.
//  Copyright (c) 2015 yu. All rights reserved.
//

#import "TextfieldValidation.h"

@implementation TextfieldValidation

-(BOOL)textFieldNotFilled:(NSString *)text
{
    bool isNotFilled = NO;
    if (text.length == 0) {
        isNotFilled = YES;
    }
    return isNotFilled;
}

-(BOOL)textFieldisNumeric:(NSString *)text
{
    
    NSScanner *scan = [NSScanner scannerWithString:text];
    
    if (![scan scanFloat:NULL] || ![scan isAtEnd])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

-(BOOL)textFieldNumberisNegative:(NSString *)text
{
    if ([text integerValue] < 0) {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (BOOL)textFieldNumberBetweenZeroToOne:(NSString *)text
{
    if ([text floatValue] > 0 && [text floatValue] < 1 ) {
        return  YES;
    }
    else
    {
        return NO;
    }
}
@end
