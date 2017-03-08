//
//  NavBarView.m
//  twinkle2
//
//  Created by Du Shaojiang on 17/2/4.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import "NavBarView.h"
#import "NavBarButtonItem.h"

@implementation NavBarView

static NSMutableDictionary *s_navBarDefines;

+ (void) initialize {
	if (s_navBarDefines) return;
	s_navBarDefines = [NSMutableDictionary dictionaryWithCapacity:20];
	[s_navBarDefines setObject:[NSNumber numberWithLong:UIBarButtonSystemItemDone] forKey:@"ok"];
	[s_navBarDefines setObject:[NSNumber numberWithLong:UIBarButtonSystemItemCancel] forKey:@"cancel"];
	[s_navBarDefines setObject:[NSNumber numberWithLong:UIBarButtonSystemItemSave] forKey:@"save"];
	[s_navBarDefines setObject:[NSNumber numberWithLong:UIBarButtonSystemItemAdd] forKey:@"add"];
	[s_navBarDefines setObject:[NSNumber numberWithLong:UIBarButtonSystemItemSearch] forKey:@"search"];
	[s_navBarDefines setObject:[NSNumber numberWithLong:UIBarButtonSystemItemRefresh] forKey:@"refresh"];
	[s_navBarDefines setObject:[NSNumber numberWithLong:UIBarButtonSystemItemDone] forKey:@"back"];
	/*
	 [s_navBarDefines setObject: forKey:@"signup"];
	 [s_navBarDefines setObject:[NSNumber numberWithLong:] forKey:@"login"];
	 [s_navBarDefines setObject:[NSNumber numberWithLong:] forKey:@"list"];
	 [s_navBarDefines setObject:[NSNumber numberWithLong:] forKey:@"more"];
	 [s_navBarDefines setObject:[NSNumber numberWithLong:] forKey:@"clear"];
	 [s_navBarDefines setObject:[NSNumber numberWithLong:] forKey:@"next"];
	 [s_navBarDefines setObject:[NSNumber numberWithLong:] forKey:@"filter"];
	 [s_navBarDefines setObject:[NSNumber numberWithLong:] forKey:@"message"];
	 */
}

+ (NavBarButtonItem *) createNavBarButtonItem: (NSObject *)bar target:(nullable id)target action:(nullable SEL)action
{
	NavBarButtonItem *btnItem = nil;
	if ([bar isKindOfClass:[NSNumber class]]) {
		btnItem = [[NavBarButtonItem alloc] initWithBarButtonSystemItem:((NSNumber *)bar).intValue target:target action:action];
	} else if ([bar isKindOfClass:[NSString class]]) {
		NSObject *barDefItem = [s_navBarDefines objectForKey:bar];
		if (barDefItem) {
			if ([barDefItem isKindOfClass:[NSNumber class]]) {
				// system button.
				btnItem = [[NavBarButtonItem alloc] initWithBarButtonSystemItem:((NSNumber *)barDefItem).intValue target:target action:action];
			} else if ([barDefItem isKindOfClass:[NSString class]]) {
				// image resource in bundle.
				UIImage *img = [UIImage imageNamed:(NSString *)barDefItem];
				if (!img)
					img = [UIImage imageWithContentsOfFile:(NSString *)barDefItem];
				if (img)
					btnItem = [[NavBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:target action:action];
				else
					TError("failed to load button image:%@", barDefItem);
			}
		} else {
			btnItem = [[NavBarButtonItem alloc]initWithTitle:(NSString *)bar style:UIBarButtonItemStylePlain target:target action:action];
		}
	}
	if (btnItem) {
		btnItem.identifier = bar;
	}
	return btnItem;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
