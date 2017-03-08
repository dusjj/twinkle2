//
//  NavBarView.h
//  twinkle2
//
//  Created by Du Shaojiang on 17/2/4.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavBarButtonItem.h"

@interface NavBarView : UINavigationBar

+ (NavBarButtonItem *) createNavBarButtonItem: (NSObject *)bar target:(id)target action:(SEL)action;

@end
