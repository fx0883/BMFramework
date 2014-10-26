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

-(void)getSoap:(BMBaseParam*)baseParam
{
//    NSString *strSoapMsg=@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
//    "<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
//    "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">"
//    "<soap12:Body>"
//    "<getRegionProvince xmlns=\"http://WebXml.com.cn/\" />"
//    "</soap12:Body>"
//    "</soap12:Envelope>";
    
//    <?xml version="1.0" encoding="utf-8"?>
//    <soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
//    xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/soap/envelope/">
//    <soap12:Body>
//    <getRegionCountry xmlns="http://WebXml.com.cn/" >
//    </getRegionCountry>
//    </soap12:Body>
//    </soap12:Envelope>
    
    NSString *strSoapMsg=@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    
    "<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:"
    
    
    "xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">"
    "<soap12:Body>"
    "<getRegionCountry xmlns=\"http://WebXml.com.cn/\" />"
    "</soap12:Body>"
    "</soap12:Envelope>";
    
    
//    <?xml version="1.0" encoding="utf-8"?>
//    <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:
//    xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
//    <soap:Body>
//    <getRegionCountry xmlns="http://WebXml.com.cn/" >
//    </getRegionCountry><
//    /soap:Body>
//    </soap:Envelope>
    
    NSString *soapMsg = [NSString stringWithFormat:
                         
                         @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                         
                         "<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/"
                         
                         "XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">"
                         "<soap12:Body>"
                         
                         "<OnLogin xmlns=\"http://tempuri.org/\">"
                         
                         "<phone>%@</phone>"
                         
                         "<passWord>%@</passWord>"
                         
                         "</OnLogin>"
                         
                         "</soap12:Body>"
                         
                         "</soap12:Envelope>",@"123456",@"123"];
    
    NSString *strUrl = @"WebServices/WeatherWS.asmx";
    
    NSString *strMethod = @"POST";
    
    
    
//    +(NSMutableURLRequest*)createUrlRequest:(NSString*)strSoapMsg
//method:(NSString*)strMethod
//urlString:(NSString*)strUrl;
    
   //NSMutableURLRequest *request = [AFAppSoapClient createUrlRequest:strSoapMsg method:strMethod urlString:strUrl];
    
    NSMutableURLRequest *request = [AFAppSoapClient createUrlRequest2:nil invokemethod:@"getRegionCountry" urlString:strUrl];
    AFHTTPRequestOperationManager *manager=[AFAppSoapClient sharedSoapManager];
    
    AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        if ([responseObject isKindOfClass:[NSXMLParser class]]) {
//            NSXMLParser *parser = (NSXMLParser *)responseObject;
//            //            NSDictionary *dict = [XMLReader dictionaryForNSXMLParser:parser];
//            //            NSLog(@"JSON: %@ : %@", responseObject,dict);
//        }
        
        NSMutableData *data = responseObject;
        
        NSLog(@"soap succeed! = %@", responseObject);
        //        NSLog(@"wo cao shuju shi = %@", [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding]);
        
        
        NSString *xmlStr =  [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
        
        NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLString:xmlStr];
        NSLog(@"dictionary: %@", xmlDoc);
        
        if (baseParam.withresultobjectblock) {
            baseParam.withresultobjectblock(0, nil,xmlStr);
        }

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSString *response = [[NSString alloc] initWithData:(NSData *)[operation responseObject] encoding:NSUTF8StringEncoding];
        NSLog(@"error = %@, %@, %@", operation, error, response);
    }];
    
    [manager.operationQueue addOperation:operation];

    
}


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
