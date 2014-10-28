//
//  ShareSDKManager.h
//  PuzzleGame
//
//  Created by fx on 14/10/28.
//  Copyright (c) 2014年 FS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGViewDelegate.h"

@interface ShareSDKManager : NSObject
/*!
 *  单例宏的调用
 */
AS_SINGLETON(ShareSDKManager)

-(void)customShareMenuClickHandler:(UIButton *)sender;
-(void)registSDKkey;
/**
 *	@brief
 *
 *	@param 	sender 	事件对象
 */
- (void)noneUIShareAllButtonClickHandler:(id)sender;
@property (nonatomic,readonly) AGViewDelegate *viewDelegate;
@end
