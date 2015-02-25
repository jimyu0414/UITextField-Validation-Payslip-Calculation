//
//  Employee.h
//  MonthlyPayslip
//
//  Created by yu on 21/02/2015.
//  Copyright (c) 2015 yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject

@property NSString *FirstName;
@property NSString *Surname;
@property NSString *payPeriod;
@property NSString *GrossIncome;
@property NSString *Tax;
@property NSString *NetIncome;
@property NSString *Super;

@end
