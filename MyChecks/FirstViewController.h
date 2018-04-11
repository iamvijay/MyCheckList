//
//  FirstViewController.h
//  MyChecks
//
//  Created by Vijay on 10/04/18.
//  Copyright © 2018 sample. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyChecksList.h"
#import "CustomView.h"

@interface FirstViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *myChecksTableViewController;
@property (strong, nonatomic) IBOutlet UIView *myCheckHeaderView;
@property (strong, nonatomic) IBOutlet UIView *snapChatHeaderView;
- (IBAction)goBack:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *buttonContainerView;
@property (strong, nonatomic) IBOutlet UITableView *myCheckDetailTableView;
@property (strong, nonatomic) IBOutlet UIView *detailCheckListView;
@end

