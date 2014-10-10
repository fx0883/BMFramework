//
//  ExampleAction.swift
//  BMSwiftDemo
//
//  Created by fx on 14-9-28.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

import Foundation



public class ExampleAction: NSObject
{
    let api_getweather = "data/sk/"
    
    
    public func testFunc()
    {
        println("good");
    }
    
    //获取天气函数
    public func getWeather(baseParam:BMBaseParam)
    {
        let strCityCode:String = baseParam.paramString;
    
        let strurl: String = "\(api_getweather)"+"\(strCityCode)"+".html"
        
        let any:AnyObject?=nil;

        //调用服务器api
        baseParam.paramObject = AFAppDotNetAPIClient.sharedClient().GET(strurl, parameters: nil, success: { (task:NSURLSessionDataTask!, responseObject:
            AnyObject!) -> Void in
                println("\(responseObject)")
            
            let dic:NSDictionary = responseObject as NSDictionary
            
            let weatherbaseclass:WeatherBaseClass =
                WeatherBaseClass.modelObjectWithDictionary(dic)
            
                baseParam.withresultobjectblock(0,"1",weatherbaseclass)
            
            }, failure: { (task:NSURLSessionDataTask!, error:NSError!) -> Void in
            
                baseParam.withresultobjectblock(0,"1",any)
                println("\(error)")
        })
        

    }

}