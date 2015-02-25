# UITextField-Validation-Payslip-Calculation
Sample classes for UITextField validation and payslip,tax validation

Simply drag the TextfieldValidation.h and .m file in your project for the UITextfield vadliation for your own beautiful project remember to import the class and create as a new: 
- #import "TextfieldValidation.h"
- #import "PaySlipCalculator.h"
- TextfieldValidation *TextfieldValidator = [[TextfieldValidation alloc] init];

Drag PaySlipCalculator.h and .m file into your project folder if your project need a payslip and tax calculation

![Alt text](https://cloud.githubusercontent.com/assets/7435852/6366520/df7caa2c-bd1a-11e4-8487-c078481a4dae.png "Screen shot")




-----------------TextFieldValidation.m--------------

-(BOOL)textFieldNotFilled:(NSString *)text;

- Check if UITextField is filled.

-(BOOL)textFieldisNumeric:(NSString *)text;

- Check if UITextField is filled with a numeric string.

-(BOOL)textFieldNumberisNegative:(NSString *)text;

- Check if UITextField is filled with a negative float;

-(BOOL)textFieldNumberBetweenZeroToOne:(NSString *)text;
- Check if UITextfield is filled with a float between 0 - 1;




-----------------PaySlipCalculator.m--------------

-(NSInteger)getGrossIncom:(NSString *)text;

- Return int value for employee's gross income

-(NSInteger)calculateTax:(NSString *)text;

- Return int value for the tax calculation

Calculation description:

• pay period = per calendar month

• gross income = annual salary / 12 months

• income tax = based on the tax table provide below

• net income = gross income - income tax

• super = gross income x super rate


The following tax rates for 2012-13 apply from 1 July 2012.
> 
> Taxable income Tax on income
> 0 - $18,200 Nil

> $18,201 - $37,000 19c for each $1 over $18,200

> $37,001 - $80,000 $3,572 plus 32.5c for each $1 over $37,000

> $80,001 - $180,000 $17,547 plus 37c for each $1 over $80,000

> $180,001 and over $54,547 plus 45c for each $1 over $180,000


-------XCTest---

Drag PaySlipCalculatorTest.m and TextfieldValidation.m into your Tests folder if you want to do the unit testing and add custom unit testing methods for these two classes above

![Alt text](https://cloud.githubusercontent.com/assets/7435852/6366521/e222c0e0-bd1a-11e4-98b5-59536eccc58a.png "Screen shot")

-------Sample Interface---

![Alt text](https://cloud.githubusercontent.com/assets/7435852/6366522/e49517f6-bd1a-11e4-8b80-48f7f19b911c.png "Screen shot")


-------Some codes for creating, writting, retrieving scv files---

- For creating and writting file  Please find the codes in - (IBAction)save:(id)sender  method in InputPayslipController.m

- For retrieving file Please find the codes in -(void)loadFile method in PayslipsController.m 
