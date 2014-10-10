//
//  DownloadViewController.m
//  BMFrameworkDemo
//
//  Created by fx on 14-9-11.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import "DownloadViewController.h"


#import <BMCoreFramework/BMDownloadFileInfo.h>
#import <BMCoreFramework/BMDownloadManager.h>
#import <BMCoreFramework/BMUtilDefine.h>

@interface DownloadViewController ()
{
    BMDownloadFileInfo *_curDownloadFileInfo;
}
@property (weak, nonatomic) IBOutlet UILabel *percentageLb;
@end

@implementation DownloadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initNotification];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)handleNotification:(NSNotification *)notification
{
    BMBaseParam *baseparam = notification.object;
    BMDownloadFileInfo *downloadfileinfo = baseparam.paramObject;
    
    float p= (float)[downloadfileinfo.curSize longLongValue]/[downloadfileinfo.fileSize longLongValue];
    
    NSString *strMsg =[NSString stringWithFormat:@"%f",p];
    _percentageLb.text =strMsg;
}

-(void)pauseDownloadfile
{
    [SharedBMDownloadManager pauseDownload:_curDownloadFileInfo];
    
}

-(void)startDownloadfile
{
    [SharedBMDownloadManager startDownload:_curDownloadFileInfo];
}

-(void)initNotification
{
    [self observeNotification:DEF_NOTIFICATION_DOWNLOADFILE];
}

- (IBAction)btnDownload:(id)sender
{
    BMBaseParam* baseparam=[BMBaseParam new];
    
    _curDownloadFileInfo = [BMDownloadFileInfo new];
    _curDownloadFileInfo.sourceUrlString = @"http://media.animusic2.com.s3.amazonaws.com/Animusic-ResonantChamber480p.mov";
    _curDownloadFileInfo.name = @"ResonantChamber480p";
    
    baseparam.paramObject =_curDownloadFileInfo;
    [SharedBMDownloadManager downloadFileInfoWithBaseParam:baseparam];
    
}


- (IBAction)pauseDownload:(id)sender {
    [self pauseDownloadfile];
}
- (IBAction)startDownload:(id)sender {
    [self startDownloadfile];
}


@end
