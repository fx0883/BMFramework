//
//  AFAppAPIClient.h
//  HaixinProject
//
//  Created by fx on 14-8-15.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AFHTTPRequestOperationManager;

@interface AFAppAPIClient : NSObject

+(void)setBaseUrl:(NSString*)urlString;
+(AFHTTPRequestOperationManager*)sharedHttpManager;
@end
