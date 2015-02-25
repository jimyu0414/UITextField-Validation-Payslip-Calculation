 //
//  InputPayslipController.h
//  MonthlyPayslip
//
//  Created by yu on 19/02/2015.
//  Copyright (c) 2015 yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputPayslipController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *FirstName;
@property (strong, nonatomic) IBOutlet UITextField *Surname;
@property (strong, nonatomic) IBOutlet UITextField *AnnualSalary;
@property (strong, nonatomic) IBOutlet UITextField *SuperRate;
@property (strong, nonatomic) IBOutlet UITextField *PayPeriod;
@property (strong, nonatomic) IBOutlet UIButton *BtnSave;

//UILabels for show
@property (strong, nonatomic) IBOutlet UILabel *LabelGrossIncome;
@property (strong, nonatomic) IBOutlet UILabel *LabelIncomeTax;
@property (strong, nonatomic) IBOutlet UILabel *LabelNetIncome;
@property (strong, nonatomic) IBOutlet UILabel *LabelSuper;
@property (strong, nonatomic) IBOutlet UILabel *InputResult;

//two buttions
- (IBAction)calculate:(id)sender;
- (IBAction)save:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *saveBtn;

@end
