//
//  BMDownloadFileInfo.h
//  BMUtilFramework
//
//  Created by fx on 14-8-26.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMDownloadFileInfo : NSObject
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSNumber * curSize;
@property (nonatomic, retain) NSDate * curTime;
@property (nonatomic, retain) NSNumber * downloadType;
@property (nonatomic, retain) NSString * duration;

@property (nonatomic, retain) NSNumber * fileSize;
@property (nonatomic, retain) NSString * imageURLString;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * sourceUrlString;

@property (nonatomic, retain) NSNumber * speed;
@property (nonatomic, retain) NSNumber * tryBeginTaskTimes;
@property (nonatomic, retain) NSDate * modifyDate;
@property (nonatomic, retain) NSString * localFolderPath;
@property (nonatomic, retain) NSString * localPath;
@end
