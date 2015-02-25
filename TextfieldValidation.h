//
//  TextfieldValidation.h
//  MonthlyPayslip
//
//  Created by yu on 25/02/2015.
//  Copyright (c) 2015 yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextfieldValidation : NSObject
//methods for textField check
-(BOOL)textFieldNotFilled:(NSString *)text;
-(BOOL)textFieldisNumeric:(NSString *)text;
-(BOOL)textFieldNumberisNegative:(NSString *)text;
- (BOOL)textFieldNumberBetweenZeroToOne:(NSString *)text;
@end
