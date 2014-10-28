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
#import "AdmobManager.h"
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
    self.bannerView = [AdmobManager sharedInstance].bannerView;
    
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



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [AdmobManager sharedInstance].curControlView = self;
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [AdmobManager sharedInstance].curControlView = nil;
}


-(void)startInterstitialView
{
    [[AdmobManager sharedInstance] startInterstitialView];
}

@end
