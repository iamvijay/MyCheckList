//
//  MyCheckDetailTableViewCell.m
//  MyChecks
//
//  Created by Vijay on 11/04/18.
//  Copyright © 2018 sample. All rights reserved.
//

#import "MyCheckDetailTableViewCell.h"

@implementation MyCheckDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
