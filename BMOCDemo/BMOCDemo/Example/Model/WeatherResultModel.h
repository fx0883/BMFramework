//
//  WeatherResultModel.h
//  HaixinProject
//
//  Created by fx on 14-7-23.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherModel.h"
@interface WeatherResultModel : JSONModel

@property (nonatomic,strong) WeatherModel *weatherinfo;

@end
