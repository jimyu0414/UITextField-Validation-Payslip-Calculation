//
//  PaySlipCalculator.h
//  MonthlyPayslip
//
//  Created by yu on 25/02/2015.
//  Copyright (c) 2015 yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaySlipCalculator : NSObject
//methods for calculation
-(NSInteger)getGrossIncom:(NSString *)text;
-(NSInteger)calculateTax:(NSString *)text;
@end
