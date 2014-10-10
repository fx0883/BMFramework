//
//  BMBaseViewController+AFNetworking.h
//  BMUtilFramework
//
//  Created by fx on 14-8-19.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import <BMCoreFramework/BMCoreFramework.h>

@interface BMBaseViewController (AFNetworking)

-(void)addPullToRefresh:(UIScrollView*)scrollview;

/**
 *  结束刷新
 *
 *  @param scrollview 需要刷新的scrollview
 */
-(void)endPullToRefresh:(UIScrollView*)scrollview;
/**
 *  加载下拉刷新
 *
 *  @param scrollview 需要刷新的scrollview
 */
-(void)addPullToTopRefresh:(UIScrollView*)scrollview;

/**
 *  加载上拉刷新
 *
 *  @param scrollview 需要刷新的scrollview
 */
-(void)addPullToBottomRefresh:(UIScrollView*)scrollview;

/**
 *  下拉刷新的回调
 */
-(void)insertRowAtTop;
/**
 *  上拉刷新的回调
 */
-(void)insertRowAtBottom;


@end
