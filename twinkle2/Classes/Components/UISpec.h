//
//  UISpec.h
//  twinkle2
//
//  Created by Du Shaojiang on 17/3/3.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UISpec : NSObject

+ (instancetype) instance;
@property(nonatomic, readonly) float statusBarHeight;  // 状态栏高度
@property(nonatomic, readonly) float statusBarWidth;  // 状态栏宽度
@property(nonatomic, readonly) float navigatorBarHeight;  // 导航栏宽度
@property(nonatomic, readonly) float navigatorBarWidth;  // 导航栏宽度
@property(nonatomic, readonly) CGSize screenSize; // 全屏幕尺寸
@property(nonatomic, readonly) CGSize frameSize; // 应用的视窗尺寸

@end
