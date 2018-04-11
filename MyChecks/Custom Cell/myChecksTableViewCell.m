//
//  myChecksTableViewCell.m
//  MyChecks
//
//  Created by Vijay on 10/04/18.
//  Copyright © 2018 sample. All rights reserved.
//

#import "myChecksTableViewCell.h"

@implementation myChecksTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.customView.layer.cornerRadius = 10.0f;
    self.customView.layer.masksToBounds = NO;
    self.customView.layer.shadowOffset = CGSizeMake(5.0f, 5.0f);
    self.customView.layer.shadowRadius = 5.0f;
    self.customView.layer.shadowOpacity = 0.4;
    
    self.brandImageView.layer.cornerRadius = 30.0f;
    self.brandImageView.layer.masksToBounds = YES;
    
}

- (void)setValueForCell:(MyChecksList*)checkList index:(NSInteger)index {

    self.brandImageView.image = [UIImage imageNamed:[checkList.productImageArray objectAtIndex:index]];
    self.brandNameLabel.text =  [checkList.productNameArray objectAtIndex:index];
    self.amountLabel.text =  [checkList.productPriceArray objectAtIndex:index];
    self.dateLabel.text =  [checkList.productDateArray objectAtIndex:index];
    self.statusLabel.text =  [checkList.productStatusArray objectAtIndex:index];
    self.statusImageView.image = [UIImage imageNamed:[checkList.productStatusImageArray objectAtIndex:index]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
