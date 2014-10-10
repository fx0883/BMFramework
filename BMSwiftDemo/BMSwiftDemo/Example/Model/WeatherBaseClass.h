//
//  WeatherBaseClass.h
//
//  Created by fx  on 14-9-30
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherWeatherinfo;

@interface WeatherBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) WeatherWeatherinfo *weatherinfo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
