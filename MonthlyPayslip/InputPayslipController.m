//
//  InputPayslipController.m
//  MonthlyPayslip
//
//  Created by yu on 19/02/2015.
//  Copyright (c) 2015 yu. All rights reserved.
//

#import "InputPayslipController.h"
#import "TextfieldValidation.h"
#import "PaySlipCalculator.h"

@interface InputPayslipController ()
{
    //the single line of string to input to scv file
    NSString *inputData;
    //define TextfieldValidation ofject
    TextfieldValidation *TextfieldValidator;
    //define PaySlipCalculator
    PaySlipCalculator  *Calculator;
}
@end

@implementation InputPayslipController

- (void)viewDidLoad {
    [super viewDidLoad];
    //set delegate for resigning keyboard
    [self setDelegate];
    //disable save button
    [self.saveBtn setEnabled:NO];
    //init TextfieldValidation
    TextfieldValidator = [[TextfieldValidation alloc] init];
    //init PayslipCalculator
    Calculator = [[PaySlipCalculator alloc] init];
}

- (void)setDelegate
{
    self.FirstName.delegate = self;
    self.Surname.delegate = self;
    self.AnnualSalary.delegate = self;
    self.SuperRate.delegate = self;
    self.PayPeriod.delegate = self;
    self.PayPeriod.placeholder = @"01 March – 31 March";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)calculate:(id)sender {
    //check if each textField is filled
    if (   [TextfieldValidator textFieldNotFilled:self.FirstName.text]
        || [TextfieldValidator textFieldNotFilled:self.Surname.text]
        || [TextfieldValidator textFieldNotFilled:self.AnnualSalary.text]
        || [TextfieldValidator textFieldNotFilled:self.SuperRate.text]
        || [TextfieldValidator textFieldNotFilled:self.PayPeriod.text]
        )
    {
        [self callAlert:@"all Text fields should be filled Please"];
    }
    else
    {
         //check salary textField
        if (![TextfieldValidator textFieldisNumeric:self.AnnualSalary.text])
            {
                [self callAlert:@"Annual salary should be numeric"];
            }
        else if ([TextfieldValidator textFieldNumberisNegative:self.AnnualSalary.text])
            {
                [self callAlert:@"Annual salary should not be negative"];
            }
        //check super rate textfield
        else if (![TextfieldValidator textFieldisNumeric:self.SuperRate.text])
            {
                [self callAlert:@"Super rate should be numeric"];
            }
       else if (![TextfieldValidator textFieldNumberBetweenZeroToOne:self.SuperRate.text])
            {
                [self callAlert:@"Super rate should between 0 - 1"];
            }
        else
            //start calculation
        {
            [self startCalculation];
        }
    }
}

-(BOOL)textFieldNotFilled:(NSString *)text
{
    bool isNotFilled = NO;
    if (text.length == 0) {
        isNotFilled = YES;
    }
    return isNotFilled;
}



-(void)startCalculation
{
    NSInteger GrossIncome = [Calculator getGrossIncom:self.AnnualSalary.text];
    NSInteger IncomTax = [Calculator calculateTax:self.AnnualSalary.text];
    NSInteger netIncome = GrossIncome - IncomTax;
    float superRate = [self.SuperRate.text floatValue];
    int incomeSuper = GrossIncome * superRate;
    //set labels
    self.LabelGrossIncome.text = [NSString stringWithFormat:@"%ld",(long)GrossIncome];
    self.LabelIncomeTax.text =[NSString stringWithFormat:@"%ld",(long)IncomTax];
    self.LabelNetIncome.text = [NSString stringWithFormat:@"%ld",(long)netIncome];
    self.LabelSuper.text = [NSString stringWithFormat:@"%d",incomeSuper];
    //set in put data
   inputData = [NSString stringWithFormat:@"%@,%@,%@,%ld,%ld,%ld,%d,\n",self.FirstName.text,self.Surname.text,self.PayPeriod.text,(long)GrossIncome,(long)IncomTax,(long)netIncome,incomeSuper];
    self.InputResult.text = inputData;
    //enable the button
    [self.saveBtn setEnabled:YES];
}


-(void)callAlert:(NSString *)alertMsg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Input Error" message:alertMsg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)save:(id)sender {
    //create and check file path
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *employeeSalaries = [docPath stringByAppendingPathComponent:@"EmployeeSalaries.csv"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:employeeSalaries])
    {
        [[NSFileManager defaultManager] createFileAtPath:employeeSalaries contents:nil attributes:nil];
        NSLog(@"file created at: %@",employeeSalaries);
    }
    //update file
    NSFileHandle *handler = [NSFileHandle fileHandleForUpdatingAtPath:employeeSalaries];
    [handler seekToEndOfFile];
    [handler writeData:[self.InputResult.text dataUsingEncoding:NSUTF8StringEncoding]];
    [handler closeFile];
    //clear the textfield
    [self clearTextFieldAndLabel];
    //disable button
    [self.saveBtn setEnabled:NO];
}

- (void)clearTextFieldAndLabel
{
    self.FirstName.text = @"";
    self.Surname.text = @"";
    self.AnnualSalary.text = @"";
    self.SuperRate.text = @"";
    self.PayPeriod.text = @"";
    
    self.LabelGrossIncome.text = @"";
    self.LabelIncomeTax.text = @"";
    self.LabelNetIncome.text = @"";
    self.LabelSuper.text = @"";
    self.InputResult.text = @"";
    
}

//implemented method from UITextFieldDelegate to dismiss keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
