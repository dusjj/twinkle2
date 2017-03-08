//
//  MOMgr.h
//  twinkle2
//
//  Created by Du Shaojiang on 17/2/5.
//  Copyright © 2017年 Du Shaojiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "models.h"

@interface MOMgr : NSObject {
	NSMutableArray *_moIdList;
}

+ (MOMgr *) sharedInstance;
- (BOOL) loadAllDatas;
- (NSArray *) getMOIdListInOrder;
- (void) setMOIdListOrder: (NSArray *) moIdList;
- (CommonMo *) getMOByFullID: (NSString *)fullId;

@property (nonatomic, retain) NSMutableDictionary *agtCache;
@property (nonatomic, retain) NSMutableDictionary *epCache;
@property (nonatomic, retain) NSMutableDictionary *ioCache;


@end
