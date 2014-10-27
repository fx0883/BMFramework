//
//  AdmobManager.h
//  PuzzleGame
//
//  Created by fx on 14/10/27.
//  Copyright (c) 2014年 FS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BMCoreFramework/BMCoreFramework.h>
#import "GADBannerView.h"
#import "GADRequest.h"
@interface AdmobManager : NSObject<GADBannerViewDelegate>
/*!
 *  单例宏的调用
 */
AS_SINGLETON(AdmobManager)

@property(nonatomic, strong) GADBannerView *bannerView;
@property(nonatomic, weak) UIViewController *rootViewController;

@end
