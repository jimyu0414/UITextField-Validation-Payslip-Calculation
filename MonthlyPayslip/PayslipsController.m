//
//  PayslipsController.m
//  MonthlyPayslip
//
//  Created by yu on 19/02/2015.
//  Copyright (c) 2015 yu. All rights reserved.
//

#import "PayslipsController.h"

@interface PayslipsController ()

@end

@implementation PayslipsController

- (void)viewDidLoad {
    [super viewDidLoad];
    //init array
    self.Employees = [[NSMutableArray alloc] init];
    //move down table view
    [self.tableView setContentInset:UIEdgeInsetsMake(20,0,0,0)];
}

-(void)viewDidAppear:(BOOL)animated
{
    //clean array
    [self.Employees removeAllObjects];
    //load csv
    [self loadFile];
    //reload table view
    [self.tableView reloadData];
}

-(void)loadFile
{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *employeeSalaries = [docPath stringByAppendingPathComponent:@"EmployeeSalaries.csv"];
    //NSLog(@"%@",employeeSalaries);
    if ([[NSFileManager defaultManager] fileExistsAtPath:employeeSalaries]) {
        NSFileHandle *handler = [NSFileHandle fileHandleForReadingAtPath:employeeSalaries];
        NSString *results = [[NSString alloc] initWithData:[handler availableData] encoding:NSUTF8StringEncoding];
        [handler closeFile];
        
        NSArray *lines = [results componentsSeparatedByString:@"\n"];
        for (NSString *eachLine in lines) {
            if (![eachLine  isEqual: @""]) {
                Employee *newEmp = [[Employee alloc] init];
                NSArray *info = [eachLine componentsSeparatedByString:@","];
                newEmp.FirstName = [info objectAtIndex:0];
                newEmp.Surname = [info objectAtIndex:1];
                newEmp.payPeriod = [info objectAtIndex:2];
                newEmp.GrossIncome = [info objectAtIndex:3];
                newEmp.Tax = [info objectAtIndex:4];
                newEmp.NetIncome = [info objectAtIndex:5];
                newEmp.Super = [info objectAtIndex:6];
                [self.Employees addObject:newEmp];
                NSLog(@"add employee: %@",newEmp.FirstName);
            }
        }
    }
    NSLog(@"All %lu employees added",(unsigned long)[self.Employees count]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.Employees count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    NSString *firstname = [[self.Employees objectAtIndex:indexPath.row] FirstName];
    NSString *surname = [[self.Employees objectAtIndex:indexPath.row] Surname];
    NSString *period = [[self.Employees objectAtIndex:indexPath.row] payPeriod];
   [cell.textLabel setText:[NSString stringWithFormat:@"%@ %@",firstname,surname]];
    [cell.detailTextLabel setText:period];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
        return @"Employee Payment List";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *firstname = [[self.Employees objectAtIndex:indexPath.row] FirstName];
    NSString *grossincome = [[self.Employees objectAtIndex:indexPath.row] GrossIncome];
    NSString *tax = [[self.Employees objectAtIndex:indexPath.row] Tax];
    NSString *netincome = [[self.Employees objectAtIndex:indexPath.row] NetIncome];
    NSString *Super = [[self.Employees objectAtIndex:indexPath.row] Super];
    NSString *descritpion = [NSString stringWithFormat:@"Gross Income: %@\nTax: %@\nNet Income: %@\nSuper: %@",grossincome,tax,netincome,Super];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:firstname message:descritpion
        delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];

}

@end
