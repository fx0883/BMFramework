//
//  SoapInvokeViewController.m
//  BMOCDemo
//
//  Created by fx on 14/10/24.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import "SoapInvokeViewController.h"

@interface SoapInvokeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;

@end

@implementation SoapInvokeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testSoap];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)testSoap
{
    //实例化一个传入传出参数
    BMBaseParam* baseparam=[BMBaseParam new];
    
    //参数
//    baseparam.paramString=self.cityCodeStr;
    
    [baseparam.paramDic setObject:@"id" forKey:@"234"];
    
    __weak SoapInvokeViewController *weakSelf=self;
    baseparam.withresultobjectblock=^(int intError,NSString* strMsg,id obj)
    {
        if (intError == 0)
        {
            //服务器返回数据
//            WeatherResultModel *weatherresultmodel = (WeatherResultModel*)obj;
//            if (weatherresultmodel) {
//                [weakSelf refreshExampleVC:weatherresultmodel];
//            }
            
            self.msgLabel.text = (NSString*)obj;
        }
        else
        {
            NSLog(@"获取数据失败");
        }
    };
    NSMutableDictionary* dicParam=[NSMutableDictionary createParamDic];
    [dicParam setActionID:DEF_ACTIONID_EAMPLE strcmd:DEF_CMD_GETSOAP];
    [dicParam setParam:baseparam];
    
    [SharedControl excute:dicParam];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
