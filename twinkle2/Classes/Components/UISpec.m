//
//  UISpec.m
//  twinkle2
//
//  Created by Du Shaojiang on 17/3/3.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import "UISpec.h"

@implementation UISpec

+ (instancetype)instance {
	static dispatch_once_t onceToken;
	static UISpec *s_inst = nil;
	dispatch_once(&onceToken, ^{
		s_inst = [[UISpec alloc] init];
	});
	return s_inst;
}

- (float)statusBarHeight {
	CGRect rect = [[UIApplication sharedApplication]statusBarFrame];
	return rect.size.height;
}

- (float)statusBarWidth {
	CGRect rect = [[UIApplication sharedApplication]statusBarFrame];
	return rect.size.width;
}

- (float)navigatorBarHeight {
	return 44;
}

- (float)navigatorBarWidth {
	return [self statusBarWidth];
}

- (CGSize)screenSize {
	CGRect re = [ UIScreen mainScreen ].bounds;
	return re.size;
}

- (CGSize)frameSize {
	CGSize sz = [self screenSize];
	sz.height -= self.statusBarHeight+self.navigatorBarHeight;
	return sz;
}

@end
