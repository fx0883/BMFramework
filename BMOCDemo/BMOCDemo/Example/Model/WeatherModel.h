//
//  WeatherModel.h
//  HaixinProject
//
//  Created by fx on 14-7-23.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModel : JSONModel

@property (nonatomic,strong) NSString *city;
@property (nonatomic,strong) NSString *cityid;
@property (readwrite) NSInteger temp;
@property (nonatomic,strong) NSString *WD;
@property (nonatomic,strong) NSString *WS;
@property (nonatomic,strong) NSString *WSE;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *SD;


@end
