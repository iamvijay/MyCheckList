//
//  FirstViewController.m
//  MyChecks
//
//  Created by Vijay on 10/04/18.
//  Copyright © 2018 sample. All rights reserved.
//

#import "FirstViewController.h"
#import "myChecksTableViewCell.h"
#import "MyCheckDetailTableViewCell.h"


const CGFloat kDefaultAnimateDuration = 0.65f;
const CGFloat kDefaultAnimateDelay = 0.0f;
const CGFloat kDefaultSpringDamping = 0.65f;
const CGFloat kDefaultSpringVelocity = 0.12f;
const CGFloat kDefaultInitialRotationDegree = 360.0f;


static UIView       *snapshot = nil;
static NSIndexPath  *sourceIndexPath = nil;
static CGRect       snapChatFrame;

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
{
     CustomView *customView;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Initialize custom view
    customView = [[CustomView alloc]init];
    
    //Header View initial frame
    self.myCheckHeaderView = [customView applyshadowEffectsForHeaderView:self.myCheckHeaderView];
    
    //Register nib custom class cell
    [self.myChecksTableViewController registerNib:[UINib nibWithNibName:@"MyChecksTableViewCell" bundle:nil] forCellReuseIdentifier:@"myChecks"];
    
    //Button Conatiner initial frame
    self.buttonContainerView.frame = [customView buttonContainerViewInitialFrame:self.buttonContainerView height:self.view.frame.size.height width:self.view.frame.size.width];
    
    //Snap view header inital frame
    self.snapChatHeaderView.frame = [customView myCheckHeaderViewInitialFrame:_snapChatHeaderView];
    
    //Detail checkList initial frame
    self.detailCheckListView.frame = [customView detailViewViewInitialFrame:self.detailCheckListView yPosition:self.myCheckHeaderView.frame.size.height];
    self.detailCheckListView.alpha = 0.f;
    
    //Detai tableview nib registeration
    [self.myCheckDetailTableView registerNib:[UINib nibWithNibName:@"MyCheckDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"myChecksdetail"];
 
    CALayer *TopBorder = [CALayer layer];
    TopBorder.frame = CGRectMake(0.0f, 103.0f, self.view.frame.size.width, 0.50f);
    TopBorder.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.detailCheckListView.layer addSublayer:TopBorder];

}



#pragma mark - TableviewViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return tableView==self.myChecksTableViewController? 5 :2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(tableView==self.myChecksTableViewController) {
        static NSString *cellIdentifier = @"myChecks";
        myChecksTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
        if(!customCell) {
            customCell = [[myChecksTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
    
        //Setting table value
        MyChecksList *checkList = [MyChecksList new];
        [customCell setValueForCell:checkList index:indexPath.row];
    
        //Hide or Show Clicked index
        if(indexPath==sourceIndexPath) {
            [customCell.customView setHidden:YES];
        } else {
            [customCell.customView setHidden:NO];
        }

        return customCell;
    } else {
        
        static NSString *cellIdentifier = @"myChecksdetail";
        MyCheckDetailTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if(!customCell) {
            customCell = [[MyCheckDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        return customCell;
    }
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    myChecksTableViewCell *customCell = [tableView cellForRowAtIndexPath:indexPath];
    customCell.backgroundColor = [UIColor clearColor];
    snapshot = [customView customSnapshoFromView:customCell];
    snapshot.tag = 1002;
    sourceIndexPath = indexPath;
   
    snapChatFrame = CGRectMake(0.0f, (customCell.frame.origin.y+self.myChecksTableViewController.frame.origin.y)-self.myChecksTableViewController.contentOffset.y, snapshot.frame.size.width, snapshot.frame.size.height);
    
    [self viewHideorShow:YES];
}



#pragma mark - Check Tabbar Visibilty

- (BOOL)tabBarIsVisible {
    return self.tabBarController.tabBar.frame.origin.y < CGRectGetMaxY(self.view.frame);
}

#pragma mark - RemoveSnapshotView

-(void)removeSnapView {
    
    UIView *tempView  = [self.view viewWithTag:1002];
    if(tempView){
        [tempView removeFromSuperview];
    }
}

#pragma mark - goBackHome

- (IBAction)goBack:(id)sender {
    [self viewHideorShow:NO];
}

#pragma mark - Animation Code Part

-(void)viewHideorShow:(BOOL)isShow {
    
    if(isShow) {
        
        snapshot.frame = snapChatFrame;
        self.snapChatHeaderView.frame = [customView myCheckHeaderViewInitialFrame:_snapChatHeaderView];
        [self.view addSubview:snapshot];
        
    } else {
        
        snapshot.frame = [customView snapSHotViewInitialFrame:snapshot];
        self.snapChatHeaderView.frame = [self->customView myCheckHeaderViewShow:self.snapChatHeaderView];
    }
    
    [UIView animateWithDuration:kDefaultAnimateDuration
            delay:kDefaultAnimateDelay
            options:UIViewAnimationOptionBeginFromCurrentState
            animations:^{
                            
                if(isShow) {

                        [self.myChecksTableViewController reloadData];
                        self.myChecksTableViewController.alpha = 0.0f;
                    
                        CATransition *layer_table_top = [self->customView transitionToShow];
                        [self.myChecksTableViewController.layer addAnimation:layer_table_top forKey:@"UITableViewReloadDataAnimationKey"];
                    
                        snapshot.frame = [self->customView snapSHotViewInitialFrame:snapshot];
                        self.snapChatHeaderView.frame = [self->customView myCheckHeaderViewShow:self.snapChatHeaderView];
                        [self->customView setTabBarVisible:![self tabBarIsVisible] animated:YES tabBarControl:self.tabBarController     view:self.view completion:nil];
                    

                } else {
                    
                        self.detailCheckListView.frame = [self->customView detailViewViewInitialFrame:self.detailCheckListView yPosition:self.myCheckHeaderView.frame.size.height];
                        self.detailCheckListView.alpha = 0.f;
                    
                        [snapshot setFrame:snapChatFrame];
                        self.myChecksTableViewController.alpha = 1.0f;
                        [self.myChecksTableViewController reloadData];
                    
                        CATransition *layer_table_bottom = [self->customView transitionToHide];
                        [self.myChecksTableViewController.layer addAnimation:layer_table_bottom forKey:@"UITableViewReloadDataAnimationKey"];
                    
                        self.snapChatHeaderView.frame = [self->customView myCheckHeaderViewInitialFrame:self.snapChatHeaderView];
                        self.buttonContainerView.frame = [self->customView buttonContainerViewInitialFrame:self.buttonContainerView height:self.view.frame.size.height width:self.view.frame.size.width];
                        }
                }
     
                completion:^(BOOL completed){
                    if(!isShow) {
                                [self removeSnapView];
                                sourceIndexPath = nil;
                                [self.myChecksTableViewController reloadData];
                                [self->customView setTabBarVisible:![self tabBarIsVisible] animated:YES tabBarControl:self.tabBarController view:self.view completion:nil];
                    } else {
                        
                        [UIView animateWithDuration:0.5f
                                              delay:kDefaultAnimateDelay
                                            options:UIViewAnimationOptionBeginFromCurrentState
                                         animations:^{
                                             self.detailCheckListView.alpha = 1.f;
                                             self.detailCheckListView.frame = [self->customView detailViewViewSetFrame:self.detailCheckListView yPosition:snapshot.frame.origin.y+snapshot.frame.size.height-20];
                                             
                                         
                                            self.buttonContainerView.frame = [self->customView buttonContainerViewSetFrame:self.buttonContainerView height:self.view.frame.size.height width:self.view.frame.size.width];
                                             
                                         } completion:nil];
                        
                     
                        
                    }
                 }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
