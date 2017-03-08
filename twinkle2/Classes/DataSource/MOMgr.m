//
//  MOMgr.m
//  twinkle2
//
//  Created by Du Shaojiang on 17/2/5.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import "MOMgr.h"

@implementation MOMgr
static MOMgr *s_instance;

+ (MOMgr *) sharedInstance
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		s_instance = [[MOMgr alloc] init];
	});
	return s_instance;
}

- (instancetype) init {
	if (self = [super init]) {
		self.agtCache = [[NSMutableDictionary alloc]init];
		self.epCache = [[NSMutableDictionary alloc]init];
		self.ioCache = [[NSMutableDictionary alloc]init];
		
		_moIdList = [[NSMutableArray alloc]init];
		
		[self loadAllDatas];
	}
	return self;
}

- (void) setMOIdListOrder: (NSArray *) moIdList {
	_moIdList = [NSMutableArray arrayWithArray:moIdList];
}

- (NSArray *) getMOIdListInOrder {
	return _moIdList;
}

- (NSArray *) loadFakeAgts {
	NSMutableArray *ret = [[NSMutableArray alloc] init];
	
	NSMutableDictionary *agtData = [[NSMutableDictionary alloc] init];
	[agtData setObject:@"lm/m2m/7504552/ep/A3MAAABPADIQRzUwNTE5Mw" forKey:@"id"];
	[agtData setObject:@"Smart Station" forKey:@"name"];
	[agtData setObject:@"1.0.37p5" forKey:@"version"];
	[agtData setObject:@"A3MAAABPADIQRzUwNTE5Mw_%d" forKey:@"uuid"];
	[ret addObject:agtData];
	
	return ret;
}
- (NSArray *) loadFakeEps {
	NSMutableArray *ret = [[NSMutableArray alloc] init];
	
	for (int i=1; i<3; i++) {
		NSMutableDictionary *epData = [[NSMutableDictionary alloc] init];
		[epData setObject:[NSString stringWithFormat:@"lm/m2m/7504552/ep/A3MAAABPADIQRzUwNTE5Mw/ep/%x", 0x2710+i] forKey:@"id"];
		[epData setObject:[NSString stringWithFormat:@"Motion %x", 0x2710+i] forKey:@"name"];
		[epData setObject:@"1" forKey:@"version"];
		[epData setObject:[NSString stringWithFormat:@"A8cAAAAlAE8NRzUwMTU4OQ_%d", i] forKey:@"uuid"];
		[epData setObject:@"D:13" forKey:@"icon"];
		[ret addObject:epData];
	}
	return ret;
}
- (NSArray *) loadFakeIos {
	NSMutableArray *ret = [[NSMutableArray alloc] init];
	
	for (int i=1; i<3; i++) {
		NSMutableDictionary *ioData = [[NSMutableDictionary alloc] init];
		[ioData setObject:[NSString stringWithFormat:@"lm/m2m/7504552/ep/A3MAAABPADIQRzUwNTE5Mw/ep/%x/m/M", 0x2710+i] forKey:@"id"];
		[ioData setObject:[NSString stringWithFormat:@"IO Motion %x", 0x2710+i] forKey:@"name"];
		[ret addObject:ioData];
	}
	return ret;
}

- (BOOL) loadAllDatas
{
	[self.agtCache removeAllObjects];
	[self.epCache removeAllObjects];
	[self.ioCache removeAllObjects];
	
	NSArray *agtDatas = [self loadFakeAgts];
	for (int i=0; i<[agtDatas count]; i++) {
		Agt *agt = [[Agt alloc] initWithData:[agtDatas objectAtIndex:i]];
		[self.agtCache setObject:agt forKey:agt.fullId];
	}
	
	NSArray *epDatas = [self loadFakeEps];
	for (int i=0; i<[epDatas count]; i++) {
		Ep *ep = [[Ep alloc] initWithData:[epDatas objectAtIndex:i]];
		[self.epCache setObject:ep forKey:ep.fullId];
	}
	
	NSArray *ioDatas = [self loadFakeIos];
	for (int i=0; i<[ioDatas count]; i++) {
		Io *io = [[Io alloc] initWithData:[ioDatas objectAtIndex:i]];
		[self.ioCache setObject:io forKey:io.fullId];
	}
	
	NSMutableArray *moIdlist = [[NSMutableArray alloc] init];
	[self.agtCache enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
		[moIdlist addObject:((CommonMo*)obj).fullId];
	}];
	[self.epCache enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
		[moIdlist addObject:((CommonMo*)obj).fullId];
	}];
	[self.ioCache enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
		[moIdlist addObject:((CommonMo*)obj).fullId];
	}];
	self->_moIdList = moIdlist;

	return YES;
}

- (CommonMo *) getMOByFullID: (NSString *)fullId {
	if (!fullId) return nil;
	
	CommonMo *mo = [self.agtCache objectForKey:fullId];
	if (mo) return mo;
	
	mo = [self.epCache objectForKey:fullId];
	if (mo) return mo;

	mo = [self.ioCache objectForKey:fullId];
	return mo;
}

@end
