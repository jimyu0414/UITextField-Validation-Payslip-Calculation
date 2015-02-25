//
//  CustmizeTableViewCell.m
//  MonthlyPayslip
//
//  Created by yu on 21/02/2015.
//  Copyright (c) 2015 yu. All rights reserved.
//

#import "CustmizeTableViewCell.h"

@implementation CustmizeTableViewCell
{
    UILabel *nameLabel;
    UILabel *payPeriodLabel;
    UILabel *grossIncomeLabel;
    UILabel *taxLabel;
    UILabel *netIncomeLabel;
    UILabel *superLabel;
    
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect nameLabelRectangle = CGRectMake(0,5, 70, 15);
        UILabel name = [[UILabel alloc] initWithFrame:nameLabelRectangle];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
