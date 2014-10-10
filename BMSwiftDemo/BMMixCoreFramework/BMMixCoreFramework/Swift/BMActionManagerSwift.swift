//
//  ActionManager.swift
//  BMCoreFramework
//
//  Created by fx on 14-9-28.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

import Foundation

@objc public class BMActionManagerSwift: NSObject {
    
    
    
//    func excute
    var actionDic:NSMutableDictionary = NSMutableDictionary()
    
    
    
    class public func shareInstance()->BMActionManagerSwift{
        struct YRSingleton{
            static var predicate:dispatch_once_t = 0
            static var instance:BMActionManagerSwift? = nil
        }
        dispatch_once(&YRSingleton.predicate,{
            YRSingleton.instance=BMActionManagerSwift()
            }
        )
        return YRSingleton.instance!
    }
    
    
    
    
    
    
    
    public func excute(dicparam:NSMutableDictionary )
    {
        
            println("\(dicparam)")
    let strClassName:NSString = dicparam.getActionID();
             println("\(strClassName)")
    let strFunctionName:NSString = dicparam.getCmd();
////    NSString *strClassName = [dicparam getActionID];
////    NSString *strFunctionName = [dicparam getCmd];
//    
//    //判断Action是否被注册过，如果被注册过则直接使用
        var idObject:AnyObject?=nil;
////        idObject = [self.actionDic objectForKey:strClassName];
//        
        idObject = self.actionDic.objectForKey(strClassName);
//        
        println("\(idObject)")
        if (idObject==nil) {

            
                        idObject =  NSClassFromString("BMSwiftDemo.ExampleAction")

            }

        println("\(idObject)")
    
//        let sel:Selector = NSSelectorFromString(strFunctionName)
        
                let sel:Selector = NSSelectorFromString("testFunc")
             println("\(sel)")
//        if(idObject!.respondsToSelector(sel))
        
        
        println("\(idObject!.respondsToSelector(sel))")
        
        
        if(true)
        {

            let obj = dicparam.getParam();
            println("erew-==")
            
            var timer = NSTimer.scheduledTimerWithTimeInterval(0.0001,
                target: idObject!,
                selector: sel,
                userInfo: obj,
                repeats: false)
            
            

            
            
        }
        
        
        
//    }
//    
//    //将一个字符串方法转换成为SEL对象
//    SEL sel = NSSelectorFromString(strFunctionName);
//    //SEL sel = @selector(excute:);
//    //判断该对象是否有相应的方法
//    if ([idObject respondsToSelector:sel])
//    {
//    id obj = [dicparam getParam];
//    if ([obj isKindOfClass:[BMBaseParam class]])
//    {
//    //这里可以打印出log，可以根据配置来决定是否要打印log
//    
//    NSNumber *numberType = [SharedBMContext getContextDicForKey:DEFSHOWACTIONLOG];
//    BOOL bIsShow = [numberType boolValue];
//    if (bIsShow)
//    {
//    NSLog(@"Invoke Action ===> Date:%@ - Class:%@ - Function:%@",[NSDate date],strClassName,strFunctionName);
//    }
//    
//    SuppressPerformSelectorLeakWarning([idObject performSelector:sel withObject:obj]);//调用选择器方法
//    }
//    }
    }
    
}
