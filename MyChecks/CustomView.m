//
//  customView.m
//  MyChecks
//
//  Created by Vijay on 11/04/18.
//  Copyright © 2018 sample. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(UIView*)applyshadowEffects:(UIView *)customView {
    
    customView.layer.masksToBounds = YES;
    customView.layer.cornerRadius = 5.0;
    customView.layer.shadowOffset = CGSizeMake(0.0, 1.0);
    customView.layer.shadowRadius = 5.0;
    customView.layer.shadowOpacity = 0.2;
    
    return customView;
}

-(UIView*)applyshadowEffectsForHeaderView:(UIView*)customView {
    
    customView.layer.masksToBounds = NO;
    customView.layer.cornerRadius = 5.0;
    customView.layer.shadowOffset = CGSizeMake(0.0, 1.0);
    customView.layer.shadowRadius = 5.0;
    customView.layer.shadowOpacity = 0.4;
    
    return customView;

}

- (UIView *)customSnapshoFromView:(UIView *)inputView {
    
    // Make an image from the input view.
    UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, NO, 0);
    [inputView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Create an image view.
    UIView *snapshot = [[UIImageView alloc] initWithImage:image];
    snapshot = [self applyshadowEffectsForHeaderView:snapshot];
    
    return snapshot;
}

-(CATransition*)transitionToShow_temp {
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.fillMode = kCAFillModeForwards;
    transition.duration = 0.65f;
    transition.subtype = kCATransitionFromTop;
    
    return transition;
}

-(CATransition*)transitionToShow {
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.fillMode = kCAFillModeForwards;
    transition.duration = 0.65f;
    transition.subtype = kCATransitionFromTop;
 
    return transition;
}

-(CATransition*)transitionToHide {
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.fillMode = kCAFillModeForwards;
    transition.duration = 0.65f;
    transition.subtype = kCATransitionFromBottom;
    
    return transition;
}

-(CGRect)myCheckHeaderViewInitialFrame:(UIView*)_snapChatHeaderView {
    
    CGRect frame = CGRectMake(0.0f, 0.0f-_snapChatHeaderView.frame.size.height, _snapChatHeaderView.frame.size.width, _snapChatHeaderView.frame.size.height);
    return frame;
    
}

-(CGRect)snapSHotViewInitialFrame:(UIView*)snapshot {
    
    CGRect frame = CGRectMake(0.0f, 90, snapshot.frame.size.width, snapshot.frame.size.height);
    return frame;
}

-(CGRect)myCheckHeaderViewShow:(UIView*)_snapChatHeaderView {
    
    CGRect frame = CGRectMake(0.0f, 0.0f, _snapChatHeaderView.frame.size.width, _snapChatHeaderView.frame.size.height);
    return frame;
}

-(CGRect)buttonContainerViewInitialFrame:(UIView*)_buttonContainerView height:(int)screenHeight width:(int)screenWidth {

    int xAxis = 0;
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
        xAxis = (screenWidth/3)+40;
    } else {
        xAxis = (screenWidth/3)-20;
    }

    CGRect frame = CGRectMake(xAxis, screenHeight+_buttonContainerView.frame.size.height, _buttonContainerView.frame.size.width, _buttonContainerView.frame.size.height);
    return frame;
}

-(CGRect)buttonContainerViewSetFrame:(UIView*)_buttonContainerView height:(int)screenHeight width:(int)screenWidth{
    
    int xAxis = 0;
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
        xAxis = (screenWidth/3+40);
    } else {
        xAxis = (screenWidth/3)-20;
    }
    
    CGRect frame = CGRectMake(xAxis, screenHeight-_buttonContainerView.frame.size.height, _buttonContainerView.frame.size.width, _buttonContainerView.frame.size.height);
    return frame;
    
}

-(CGRect)detailViewViewInitialFrame:(UIView*)_detailView yPosition:(int)Yaxis {
    
    CGRect frame = CGRectMake(0, Yaxis, _detailView.frame.size.width,0);
    return frame;
}

-(CGRect)detailViewViewSetFrame:(UIView*)_detailView yPosition:(int)Yaxis {
    
    CGRect frame = CGRectMake(0, Yaxis, _detailView.frame.size.width,_detailView.frame.size.height);
    return frame;
}



- (void)setTabBarVisible:(BOOL)visible animated:(BOOL)animated tabBarControl:(UITabBarController*)tabBarController view:(UIView *)currentView completion:(void (^)(BOOL))completion {
    
    // bail if the current state matches the desired state
    if ([self tabBarIsVisible:tabBarController view:currentView] == visible) return (completion)? completion(YES) : nil;
    
    // get a frame calculation ready
    CGRect frame = tabBarController.tabBar.frame;
    CGFloat height = frame.size.height;
    CGFloat offsetY = (visible)? -height : height;
    
    
    [UIView animateWithDuration:0.65f
                          delay:0.0f
         usingSpringWithDamping:0.65f
          initialSpringVelocity:0.12f
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
                            
                            tabBarController.tabBar.frame = CGRectOffset(frame, 0, offsetY);
                            
                        } completion:completion];
}

- (BOOL)tabBarIsVisible:(UITabBarController*)tabBarController view:(UIView *)currentView
{
    return tabBarController.tabBar.frame.origin.y < CGRectGetMaxY(currentView.frame);
}

@end
