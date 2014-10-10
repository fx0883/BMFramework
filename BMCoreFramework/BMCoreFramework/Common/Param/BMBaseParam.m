//
//  XSBaseParam.m
//  Babylon
//
//  Created by fx on 14-3-1.
//  Copyright (c) 2014年 Yixue. All rights reserved.
//

#import "BMBaseParam.h"

@implementation BMBaseParam



-(id)init
{
    self=[super init];
    if (self) {
        [self initData];
    }
    return self;
}

-(void)initData
{
    self.paramArray=[NSMutableArray new];
    self.paramDic = [NSMutableDictionary new];
}

@end
