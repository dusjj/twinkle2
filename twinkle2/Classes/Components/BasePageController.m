//
//  BasePageController.m
//  twinkle2
//
//  Created by Du Shaojiang on 17/2/4.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import "BasePageController.h"
#import "NavBarView.h"

@interface BasePageController ()
@end

@implementation BasePageController

- (NSArray *) getNavBarList {
	NSArray *bars = @[@"cancel", @"ok"];
	return bars;
}

- (void) createNavBar {
	NSArray *barList = [self getNavBarList];
	if (!barList) return;
	
	NSObject *bar = [barList count]>0 ? [barList objectAtIndex:0] : nil;
	if (bar) {
		UIBarButtonItem *barItem = [NavBarView createNavBarButtonItem:bar target:self action:@selector(onNavbarButtonItemClicked:)];
		[self.navigationItem setLeftBarButtonItem:barItem];
	}
	
	bar = [barList count]>1 ? [barList objectAtIndex:1] : nil;
	if (bar) {
		UIBarButtonItem *barItem = [NavBarView createNavBarButtonItem:bar target:self action:@selector(onNavbarButtonItemClicked:)];
		[self.navigationItem setRightBarButtonItem:barItem];
	}
}

- (void) onNavbarButtonItemClicked:(UIBarButtonItem *)_barButton {
	NavBarButtonItem *barButton = (NavBarButtonItem *)_barButton;
	NSObject *barId = barButton.identifier;
	TLog("Clicked: %@", barId);
	
	if ([@"cancel" isEqual:barId] || [@"back" isEqual:barId]) {
		[self.navigationController popViewControllerAnimated:YES];
		return;
	}
	
	SEL actSel = NSSelectorFromString([NSString stringWithFormat:@"OnClick_%@", barId]);
	if ([self respondsToSelector:actSel]) {
		IMP actImp = [self methodForSelector:actSel];
		if (actImp) actImp(self, actSel);
		return;
	}
	
	TError("no action to do:%@", barId);
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	static int n = 0;
	if (n%3==0)
		self.view.backgroundColor = [UIColor blackColor];
	else if (n%3==1)
		self.view.backgroundColor = [UIColor blueColor];
	else if (n%3==2)
		self.view.backgroundColor = [UIColor grayColor];
	n++;

	[self createNavBar];
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
