//
//  WidgetViewController.m
//  twinkle2
//
//  Created by Du Shaojiang on 17/1/12.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import "WidgetViewController.h"
//#import "BlankPageController.h"
#import "MOMgr.h"

@interface WidgetViewController ()

@end

@implementation WidgetViewController

- (void)OnClick_Add {
//	BlankPageController *nc = [[BlankPageController alloc] init];
//	[self pushViewController:nc animated:YES];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.navigationItem.leftBarButtonItem =	[[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(onClickMenu)];
	self.navigationItem.rightBarButtonItem =	[[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(onClickAdd)];
	
//	UIView *rootView = self.rootCtrl.view;
//	_tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 10, 200, 200)];
////	_tableView.backgroundColor = [UIColor blackColor];
//	
//	_tableView.dataSource = self;
//	_tableView.delegate = self;
//	[self.rootCtrl.view addSubview: _tableView];
}

- (void)onClickMenu {
	TLog("click menu");
}
- (void)onClickAdd {
	TLog("click add");
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (NSArray *) getNavBarList {
	NSArray *bars = @[@"Menu", @"Add"];
	return bars;
}

#pragma mark - TableView

//- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//	NSArray *moIdList = [[MOMgr sharedInstance] getMOIdListInOrder];
//	return moIdList.count;
//}
//
//- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//	static NSString *CellIdAgt = @"cellagt";
//	
//	UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellIdAgt];
//	if (!cell) {
//		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdAgt];
//	}
//	cell.backgroundColor = (indexPath.row%2==0)?[UIColor redColor]:[UIColor blueColor];
//	
//	NSArray *moIdList = [[MOMgr sharedInstance] getMOIdListInOrder];
//	CommonMo *mo = [[MOMgr sharedInstance] getMOByFullID: [moIdList objectAtIndex:[indexPath row]]];
//	cell.textLabel.text = mo ? mo.name : @"unknown";
//	cell.textLabel.textColor = [UIColor brownColor];
//
//	return cell;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//	[_tableView deselectRowAtIndexPath:indexPath animated:YES];
//}
//
//- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//	return 100;
//}
//
//- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
//	return UITableViewCellEditingStyleNone;
//}
//
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
//	NSMutableArray *moIdList = [NSMutableArray arrayWithArray:[[MOMgr sharedInstance] getMOIdListInOrder]];
//	CommonMo *mo = [moIdList objectAtIndex:sourceIndexPath.row];
//	[moIdList removeObjectAtIndex:sourceIndexPath.row];
//	[moIdList insertObject:mo atIndex:destinationIndexPath.row];
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//	return nil;
//	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
////	view.backgroundColor = [UIColor whiteColor];
//	return view;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//	return nil;
//	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
////	view.backgroundColor = [UIColor whiteColor];
//	return view;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
