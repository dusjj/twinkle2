//
//  OAuthLoginViewController.m
//  twinkle2
//
//  Created by Du Shaojiang on 17/3/3.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import "OAuthLoginViewController.h"
#import "UISpec.h"
#import "AKTKit.h"

@interface OAuthLoginViewController () {
	UIWebView *_webAuth;
	UIButton *_btnRefresh;
}

@end

@implementation OAuthLoginViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
	self.view.backgroundColor = [UIColor greenColor];
	self.navigationItem.leftBarButtonItem = self.navigationItem.backBarButtonItem;
	
	const int NavBarOffset = 20+44;
	const int GapX=10, GapY=5;
	const int ButtonH=40;
	
	_webAuth = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
	[self.view addSubview:_webAuth];
	[_webAuth aktLayout:^(AKTLayoutShellAttribute *layout) {
		[layout addDynamicLayoutInCondition:^BOOL{
			return mAKT_Portrait;
		} andAttribute:^(AKTLayoutShellAttribute *layout) {
			layout.width.equalTo(akt_view(self.view)).offset(-GapX*2);
			layout.height.equalTo(akt_view(self.view)).multiple(0.8);
			layout.centerX.equalTo(akt_view(self.view));
			layout.top.equalTo(akt_view(self.view)).offset(NavBarOffset);
		}];
		[layout addDynamicLayoutInCondition:^BOOL{
			return !mAKT_Portrait;
		} andAttribute:^(AKTLayoutShellAttribute *layout) {
			layout.width.equalTo(self.view.akt_width).multiple(0.8);
			layout.height.equalTo(self.view.akt_height).offset(-NavBarOffset-GapY*2);
			layout.top.equalTo(akt_value(NavBarOffset));
			layout.left.equalTo(akt_view(self.view)).offset(GapX);
		}];
	}];
	
	NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
	[_webAuth loadRequest:req];
	
	_btnRefresh = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	_btnRefresh.frame = CGRectMake(0, 0, 0, 0);
	[_btnRefresh setTitle:@"Refresh" forState:UIControlStateNormal];
	
	_btnRefresh.titleLabel.tintColor = [UIColor blueColor];
	_btnRefresh.backgroundColor = [UIColor yellowColor];
	[self.view addSubview:_btnRefresh];
	[_btnRefresh addTarget:self action:@selector(onClickRefresh) forControlEvents:UIControlEventTouchUpInside];
	
	[_btnRefresh aktLayout:^(AKTLayoutShellAttribute *layout) {
		[layout addDynamicLayoutInCondition:^BOOL{
			return mAKT_Portrait;
		} andAttribute:^(AKTLayoutShellAttribute *layout) {
			layout.centerX.equalTo(akt_view(self.view));
			layout.width.equalTo(self.view.akt_width).multiple(0.7);
			layout.height.equalTo(akt_value(ButtonH));
			layout.bottom.equalTo(self.view.akt_bottom).offset(-10);
		}];
		[layout addDynamicLayoutInCondition:^BOOL{
			return !mAKT_Portrait;
		} andAttribute:^(AKTLayoutShellAttribute *layout) {
			layout.width.equalTo(self.view.akt_width).multiple(0.15);
			layout.height.equalTo(akt_value(ButtonH*2));
			layout.right.equalTo(akt_view(self.view)).offset(-GapX);
			layout.centerY.equalTo(akt_view(self.view));
		}];
	}];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)onClickRefresh {
	TLog("click refresh");
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
