//
//  myChecksTableViewCell.h
//  MyChecks
//
//  Created by Vijay on 10/04/18.
//  Copyright © 2018 sample. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyChecksList.h"

@interface myChecksTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *customView;
@property (strong, nonatomic) IBOutlet UIImageView *brandImageView;
@property (strong, nonatomic) IBOutlet UIImageView *statusImageView;
@property (strong, nonatomic) IBOutlet UILabel *amountLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UILabel *brandNameLabel;


- (void)setValueForCell:(MyChecksList*)checkList index:(NSInteger)index;

@end
