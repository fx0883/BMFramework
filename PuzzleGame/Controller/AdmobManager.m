//
//  AdmobManager.m
//  PuzzleGame
//
//  Created by fx on 14/10/27.
//  Copyright (c) 2014年 FS. All rights reserved.
//
#define MY_BANNER_UNIT_ID @"ca-app-pub-5934917937656240/2225227611" //@"a1531d79701df01"

#define MY_BANNER_INTERSTITIAL_ID @"ca-app-pub-5934917937656240/6039016012" //
#import "AdmobManager.h"

@implementation AdmobManager

DEF_SINGLETON(AdmobManager)


-(instancetype)initWithViewController:(UIViewController*)rootViewController
{
    self = [super init];
    if (self) {
        self.rootViewController = rootViewController;
        [self loadBannerView];
    }
    return self;
}

-(void)loadBannerView
{
    self.bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];
    
    
    
    // Replace this ad unit ID with your own ad unit ID.
    self.bannerView.adUnitID = MY_BANNER_UNIT_ID;
    self.bannerView.rootViewController =self.rootViewController;
    self.bannerView.delegate = self;
    
    GADRequest *request = [GADRequest request];
    // Requests test ads on devices you specify. Your test device ID is printed to the console when
    // an ad request is made.
    request.testDevices = @[ GAD_SIMULATOR_ID, @"MY_TEST_DEVICE_ID" ];
    [self.bannerView loadRequest:request];
    
}




@end
