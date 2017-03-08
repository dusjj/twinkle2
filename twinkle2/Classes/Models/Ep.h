//
//  Ep.h
//  twinkle2
//
//  Created by Du Shaojiang on 17/2/6.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import "CommonMo.h"
#import "Agt.h"

@interface Ep : CommonMo

@property (nonatomic) int state;

- (instancetype) initWithData:(NSDictionary *)data;

@end
