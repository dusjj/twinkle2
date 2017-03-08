//
//  AIViewController.m
//  twinkle2
//
//  Created by Du Shaojiang on 17/1/12.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import "AIViewController.h"

@interface AIViewController ()

@end

@implementation AIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

	self.navigationItem.leftBarButtonItem =	[[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(onClickMenu)];
	self.navigationItem.rightBarButtonItem =	[[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(onClickAdd)];
//	aictrl.view.backgroundColor = [UIColor blueColor];
//	[self addChildViewController:aictrl];
}

- (void)onClickMenu {
	TLog("click menu");
}

- (void)onClickAdd {
	TLog("click add");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *) getNavBarList {
	NSArray *bars = @[@"Menu", @"Add"];
	return bars;
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
