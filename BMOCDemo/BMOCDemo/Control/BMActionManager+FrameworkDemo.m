//
//  BMActionManager+FrameworkDemo.m
//  BMFrameworkDemo
//
//  Created by fx on 14-8-21.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import "BMActionManager+FrameworkDemo.h"
#import "ExampleAction.h"

@implementation BMActionManager (FrameworkDemo)

-(void)registerAllAction
{
    [self registAction:DEF_ACTIONID_EAMPLE action:[ExampleAction new]];
}

@end
