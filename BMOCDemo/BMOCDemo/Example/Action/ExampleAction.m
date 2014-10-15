//
//  ExampleAction.m
//  HaixinProject
//
//  Created by fx on 14-7-23.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import "ExampleAction.h"
#import "WeatherResultModel.h"
//#import "AFHTTPRequestOperation.h"
//#import "AFHTTPRequestOperationManager.h"
//#import "AFAppAPIClient.h"
@implementation ExampleAction

//
//-(void)excute:(NSMutableDictionary*)dicparam
//{
//    NSString* strCmd=[dicparam getCmd];
//    
//     if ([strCmd isEqualToString:DEF_CMD_GETWEATHER])
//    {
//        id obj = [dicparam getParam];
//        if ([obj isKindOfClass:[BMBaseParam class]]) {
//            BMBaseParam* baseparam=(BMBaseParam*)obj;
//            [self getWeather:baseparam];
//        }
//        
//    }
////    else if ([strCmd isEqualToString:cmdGetPaiPaiDetail])
////    {
////        id obj = [dicparam getParam];
////        if ([obj isKindOfClass:[XSBaseParam class]]) {
////    /Users/fx/Desktop/BMFrameworkDemo/BMFrameworkDemo/Example/View/ExampleViewController.h        XSBaseParam* baseparam=(XSBaseParam*)obj;
////            [self getPaiPaiDetail:baseparam];
////        }
////        
////    }
//
//}


-(void)getWeather:(BMBaseParam*)baseParam
{
    NSString *strCityCode = baseParam.paramString;

    
    NSString* strurl=[NSString stringWithFormat:@"%@%@.html",DEF_API_GETWEATHER,strCityCode];
    
    baseParam.paramObject = [[AFAppDotNetAPIClient sharedClient] GET:strurl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject)
    {
        
        NSLog(@"%@",responseObject);
        
        NSError *eor=nil;
        WeatherResultModel *weatherresultmodel
            = [[WeatherResultModel alloc]initWithDictionary:responseObject error:&eor];
        if (baseParam.withresultobjectblock) {
            baseParam.withresultobjectblock(0, nil,weatherresultmodel);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (baseParam.withresultobjectblock) {
            baseParam.withresultobjectblock(error.code,@"网络错误",nil);
        }
        
    }];
    
    
  
    
//ios6 代码
    
//    NSString *strCityCode = baseParam.paramString;
//    
//
//    NSString* strurl=[NSString stringWithFormat:@"%@%@.html",DEF_API_GETWEATHER,strCityCode];
//    
//    baseParam.paramObject = [[AFAppAPIClient sharedHttpManager] GET:strurl parameters:nil
//                             
//                            success:^(AFHTTPRequestOperation *operation, id responseObject)
//                             {
//                                 
//                                 NSLog(@"%@",responseObject);
//                                 
//                                 NSError *eor=nil;
//                                 WeatherResultModel *weatherresultmodel
//                                 = [[WeatherResultModel alloc]initWithDictionary:responseObject error:&eor];
//                                 if (baseParam.withresultobjectblock) {
//                                     baseParam.withresultobjectblock(0, nil,weatherresultmodel);
//                                 }
//                                 
//                             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                                 if (baseParam.withresultobjectblock) {
//                                     baseParam.withresultobjectblock(error.code,@"网络错误",nil);
//                                 }
//                                 
//                             }];
    
}

@end
