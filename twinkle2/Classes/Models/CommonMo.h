//
//  CommonMo.h
//  twinkle2
//
//  Created by Du Shaojiang on 17/2/6.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonMo : NSObject

@property (nonatomic, retain) NSString *fullId;
@property (nonatomic, retain) NSString *category;
@property (nonatomic, retain) NSString *cls;
@property (nonatomic, retain) NSString *version;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *icon;

- (instancetype) initWithData: (NSDictionary *)data;
- (NSString *) toString;

@end
