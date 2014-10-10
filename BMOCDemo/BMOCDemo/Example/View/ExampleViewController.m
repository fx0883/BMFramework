//
//  ExamleViewController.m
//  HaixinProject
//
//  Created by fx on 14-7-23.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import "ExampleViewController.h"
#import "WeatherResultModel.h"
//#import "MBProgressHUD.h"

#import <BMCoreFramework/MBProgressHUD.h>
#import <BMCoreFramework/BMDownloadFileInfo.h>
#import <BMCoreFramework/BMDownloadManager.h>
#import <BMCoreFramework/BMUtilDefine.h>
#import <BMCoreFramework/MBProgressHUD+AFNetworking.h>
//#import "BMDownloadFileInfo.h"
//#import "BMDownloadManager.h"
//#import "BMUtilDefine.h"

@interface ExampleViewController ()
{
    MBProgressHUD* progressTest;
    BMDownloadFileInfo *_curDownloadFileInfo;
    __weak NSURLSessionTask* _task;
}

@end

@implementation ExampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(id)initWithCityCode:(NSString*)strCityCode
{
    self = [super init];
    if (self) {
        _cityCodeStr=strCityCode;
           }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadWeather];
    
}

-(id)init
{
    self = [super init];
    if (self) {
        [self initNotification];
    }
    return self;
}

-(void)loadWeather
{

    if (!_task) {
        [_task cancel];
    }
    
    //实例化一个传入传出参数
    BMBaseParam* baseparam=[BMBaseParam new];

    //参数
    baseparam.paramString=self.cityCodeStr;
    
    [baseparam.paramDic setObject:@"id" forKey:@"234"];
    
    __weak ExampleViewController *weakSelf=self;
    baseparam.withresultobjectblock=^(int intError,NSString* strMsg,id obj)
    {
        if (intError == 0)
        {
            //服务器返回数据
            WeatherResultModel *weatherresultmodel = (WeatherResultModel*)obj;
            if (weatherresultmodel) {
                [weakSelf refreshExampleVC:weatherresultmodel];
            }
        }
        else
        {
            NSLog(@"获取数据失败");
        }
    };
    NSMutableDictionary* dicParam=[NSMutableDictionary createParamDic];
    [dicParam setActionID:DEF_ACTIONID_EAMPLE strcmd:DEF_CMD_GETWEATHER];
    [dicParam setParam:baseparam];
    
    [SharedControl excute:dicParam];
    progressTest = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    progressTest.labelText = @"加载中...";
    progressTest.mode = MBProgressHUDModeIndeterminate;//可以显示不同风格的进度；
    
   _task = (NSURLSessionTask*)baseparam.paramObject;
    
    [progressTest setAnimatingWithStateOfTask:_task];
    
    //[task cancel];
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

-(void)refreshExampleVC:(WeatherResultModel*) weatherresultmodel
{
    _cityLb.text=weatherresultmodel.weatherinfo.city;
    _tempLb.text = @(weatherresultmodel.weatherinfo.temp).stringValue;

    _wdLb.text=weatherresultmodel.weatherinfo.WD;
     _wsLb.text=weatherresultmodel.weatherinfo.WS;
     _wseLb.text=weatherresultmodel.weatherinfo.WSE;
    _sdLb.text=weatherresultmodel.weatherinfo.SD;
     _timeLb.text=weatherresultmodel.weatherinfo.time;
    
}
- (IBAction)pauseDownload:(id)sender {
    [self pauseDownloadfile];
}
- (IBAction)startDownload:(id)sender {
    [self startDownloadfile];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    
    
    if (_task && _task.state == NSURLSessionTaskStateRunning) {
        [_task cancel];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
