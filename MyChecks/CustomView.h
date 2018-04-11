//
//  customView.h
//  MyChecks
//
//  Created by Vijay on 11/04/18.
//  Copyright © 2018 sample. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"

@interface CustomView : UIView

-(UIView*)applyshadowEffects:(UIView*)customView;
-(UIView*)applyshadowEffectsForHeaderView:(UIView*)customView;
-(UIView *)customSnapshoFromView:(UIView *)inputView;

-(CATransition*)transitionToShow;
-(CATransition*)transitionToHide;
-(CGRect)myCheckHeaderViewInitialFrame:(UIView*)_snapChatHeaderView;
-(CGRect)snapSHotViewInitialFrame:(UIView*)snapshot;
-(CGRect)myCheckHeaderViewShow:(UIView*)_snapChatHeaderView;
-(CGRect)buttonContainerViewInitialFrame:(UIView*)_buttonContainerView height:(int)screenHeight width:(int)screenWidth;
-(CGRect)buttonContainerViewSetFrame:(UIView*)_buttonContainerView height:(int)screenHeight width:(int)screenWidth;
-(CGRect)detailViewViewInitialFrame:(UIView*)_detailView yPosition:(int)Yaxis;
-(CGRect)detailViewViewSetFrame:(UIView*)_detailView yPosition:(int)Yaxis;


- (void)setTabBarVisible:(BOOL)visible animated:(BOOL)animated tabBarControl:(UITabBarController*)tabBarController view:(UIView *)currentView completion:(void (^)(BOOL))completion;
    
@end
