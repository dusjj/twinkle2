//
//  MainViewController.m
//  twinkle2
//
//  Created by Du Shaojiang on 17/1/13.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import "MainViewController.h"

#import "WidgetViewController.h"
#import "AIViewController.h"
#import "DiscoverViewController.h"
#import "MessageViewController.h"

@interface MainViewController ()
@end

@implementation MainViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
}

- (void)initUI
{
	WidgetViewController *widgetVC = [[WidgetViewController alloc]init];
	_widgetVC = widgetVC;
	widgetVC.view.backgroundColor = [UIColor redColor];
	UINavigationController *widgetNavVC = [[UINavigationController alloc] initWithRootViewController:widgetVC];
	widgetNavVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home"
																												 image:[[UIImage imageNamed:@"documentsIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
																								 selectedImage:[[UIImage imageNamed:@"documentsSelectedIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

	AIViewController *aiVC = [[AIViewController alloc]init];
	_aiVC = aiVC;
	aiVC.view.backgroundColor = [UIColor blueColor];
	UINavigationController *aiNavVC = [[UINavigationController alloc] initWithRootViewController:aiVC];
	aiNavVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"AI"
																										 image:[[UIImage imageNamed:@"userIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
																						 selectedImage:[[UIImage imageNamed:@"userSelectedIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
	
//	DiscoverViewController *discoverVC = [[DiscoverViewController alloc]init];
//	_discoverVC = discoverVC;
//	UINavigationController *discoverNavVC = [[UINavigationController alloc] initWithRootViewController:_discoverVC];
////	discctrl.tabBarItem.title = @"Discover";
////	discctrl.tabBarItem.badgeValue = @"3";
//////	discctrl.view.backgroundColor = [UIColor yellowColor];
////	[self addChildViewController:discctrl];
//
//	MessageViewController *msgVC = [[MessageViewController alloc]init];
//	_msgVC = msgVC;
//	UINavigationController *msgNavVC = [[UINavigationController alloc] initWithRootViewController:msgVC];
	
	UITabBarController *tabBarView = [[UITabBarController alloc] init];
	_tabBarView = tabBarView;
	tabBarView.viewControllers = @[widgetNavVC, aiNavVC]; //, discoverNavVC, msgNavVC];
	
	[self pushViewController:tabBarView animated:NO];
	self.navigationBar.hidden = YES;
//	msgctrl.tabBarItem.title = @"Discover";
//	msgctrl.tabBarItem.badgeValue = @"3";
////	msgctrl.view.backgroundColor = [UIColor greenColor];
//	[self addChildViewController:msgctrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
