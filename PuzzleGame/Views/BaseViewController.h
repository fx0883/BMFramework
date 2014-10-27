//
//  BaseViewController.h
//  TestBannerOC
//
//  Created by fx on 14/10/27.
//  Copyright (c) 2014年 FS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GADBannerView;
@interface BaseViewController : UIViewController

@property(nonatomic, strong) GADBannerView *bannerView;
-(void)startAnimateBannerView;
@end
