//
//  AFAppSoapClient.h
//  BMCoreFramework
//
//  Created by fx on 14/10/24.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>



/*!
 *  AFHTTPRequestOperationManager
 */
@class AFHTTPRequestOperationManager;

@interface AFAppSoapClient : NSObject

+(NSMutableURLRequest*)createUrlRequest:(NSString*)strSoapMsg
                                 method:(NSString*)strMethod
                              urlString:(NSString*)strUrl;
+(AFHTTPRequestOperationManager*)sharedSoapManager;

+(NSMutableURLRequest*)createUrlRequest2:(NSDictionary*)dicParam
                           invokemethod:(NSString*)strMethod
                              urlString:(NSString*)strUrl;
@end
