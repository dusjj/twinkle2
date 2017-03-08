//
//  CommonMo.m
//  twinkle2
//
//  Created by Du Shaojiang on 17/2/6.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import "CommonMo.h"

@implementation CommonMo

- (instancetype) initWithData: (NSDictionary *)data {
	if (self = [super init]) {
		if (data) {
			self.name = [data objectForKey:@"name"];
			self.version = [data objectForKey:@"version"];
			self.fullId = [data objectForKey:@"id"];
		}
	}
	return self;
}

- (NSString *) toString {
	NSString *ret = [NSString stringWithFormat:@"fullId=%@,category=%@,cls=%@,version=%@,name=%@,icon=%@", _fullId, _category, _cls, _version, _name, _icon];
	return ret;
}

@end
