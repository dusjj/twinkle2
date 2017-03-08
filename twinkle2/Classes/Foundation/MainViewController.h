//
//  MainViewController.h
//  twinkle2
//
//  Created by Du Shaojiang on 17/1/13.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WidgetViewController;
@class AIViewController;
@class DiscoverViewController;
@class MessageViewController;

@interface MainViewController : UINavigationController {
}

@property (nonatomic) UITabBarController *tabBarView;
@property (nonatomic) WidgetViewController *widgetVC;
@property (nonatomic) AIViewController *aiVC;
//@property (nonatomic) DiscoverViewController *discoverVC;
//@property (nonatomic) MessageViewController *msgVC;

- (void) initUI;

@end
