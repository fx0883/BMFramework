//
//  BaseViewController.m
//  TestBannerOC
//
//  Created by fx on 14/10/27.
//  Copyright (c) 2014年 FS. All rights reserved.
//

#import "BaseViewController.h"
#import "GADBannerView.h"
#import "GADRequest.h"
@interface BaseViewController()<GADBannerViewDelegate>
{
    CGFloat _floatBannerHeight;
    CGFloat _floatBannerWidth;
    NSTimer *_timerForBannerView;
}

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadViewConfig];
    [self loadBanner];
}



-(void)loadViewConfig
{
    _floatBannerWidth = [UIScreen mainScreen].bounds.size.width;
    _floatBannerHeight = 50.0;
    
    
}

-(void)loadBanner
{
    self.bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];
    
    
    
    // Replace this ad unit ID with your own ad unit ID.
    self.bannerView.adUnitID = @"ca-app-pub-5934917937656240/2225227611";
    self.bannerView.rootViewController = self;
    self.bannerView.delegate = self;
    
    GADRequest *request = [GADRequest request];
    // Requests test ads on devices you specify. Your test device ID is printed to the console when
    // an ad request is made.
    request.testDevices = @[ GAD_SIMULATOR_ID, @"MY_TEST_DEVICE_ID" ];
    [self.bannerView loadRequest:request];
    
    [self.view addSubview:self.bannerView];
    
    [self.bannerView setFrame:CGRectMake(0, -_floatBannerHeight, _floatBannerWidth, _floatBannerHeight)];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [_timerForBannerView invalidate];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark- Ad Request Lifecycle Notifications

/// Called when an ad request loaded an ad. This is a good opportunity to add this view to the
/// hierarchy if it has not been added yet. If the ad was received as a part of the server-side auto
/// refreshing, you can examine the hasAutoRefreshed property of the view.
- (void)adViewDidReceiveAd:(GADBannerView *)view
{
    [self startAnimateBannerView];
}

-(void)startAnimateBannerView
{
    if (_timerForBannerView ==nil) {
            _timerForBannerView = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(removeAnimateBanner:) userInfo:nil repeats:NO];
    }

    [UIView animateWithDuration:0.5 animations:^()
     {
         [self.bannerView setFrame:CGRectMake(0, 0, _floatBannerWidth, _floatBannerHeight)];
     }];

}

-(void)removeAnimateBanner:(id)userinfo
{
    [UIView animateWithDuration:0.5 animations:^()
     {
         [self.bannerView setFrame:CGRectMake(0, -_floatBannerHeight, _floatBannerWidth, _floatBannerHeight)];
     }];
}
/// Called when an ad request failed. Normally this is because no network connection was available
/// or no ads were available (i.e. no fill). If the error was received as a part of the server-side
/// auto refreshing, you can examine the hasAutoRefreshed property of the view.
- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error
{
    
}

#pragma mark- Click-Time Lifecycle Notifications

/// Called just before presenting the user a full screen view, such as a browser, in response to
/// clicking on an ad. Use this opportunity to stop animations, time sensitive interactions, etc.
///
/// Normally the user looks at the ad, dismisses it, and control returns to your application by
/// calling adViewDidDismissScreen:. However if the user hits the Home button or clicks on an App
/// Store link your application will end. On iOS 4.0+ the next method called will be
/// applicationWillResignActive: of your UIViewController
/// (UIApplicationWillResignActiveNotification). Immediately after that adViewWillLeaveApplication:
/// is called.
- (void)adViewWillPresentScreen:(GADBannerView *)adView
{
    
}

/// Called just before dismissing a full screen view.
- (void)adViewWillDismissScreen:(GADBannerView *)adView
{
    
}

/// Called just after dismissing a full screen view. Use this opportunity to restart anything you
/// may have stopped as part of adViewWillPresentScreen:.
- (void)adViewDidDismissScreen:(GADBannerView *)adView
{
    
}

/// Called just before the application will background or terminate because the user clicked on an
/// ad that will launch another application (such as the App Store). The normal
/// UIApplicationDelegate methods, like applicationDidEnterBackground:, will be called immediately
/// before this.
- (void)adViewWillLeaveApplication:(GADBannerView *)adView
{
    
}


@end
