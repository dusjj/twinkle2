//
//  Ep.m
//  twinkle2
//
//  Created by Du Shaojiang on 17/2/6.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import "Ep.h"

@implementation Ep

- (Ep *)initWithData: (NSDictionary *) data {
	if (self = [super initWithData:data]) {
		self.state = [(NSNumber *)[data objectForKey:@"state"] intValue];
	}
	return self;
}

@end
