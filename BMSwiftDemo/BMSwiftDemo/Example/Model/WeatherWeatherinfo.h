//
//  WeatherWeatherinfo.h
//
//  Created by fx  on 14-9-30
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WeatherWeatherinfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *temp;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *wD;
@property (nonatomic, strong) NSString *qy;
@property (nonatomic, strong) NSString *isRadar;
@property (nonatomic, strong) NSString *cityid;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *wS;
@property (nonatomic, strong) NSString *wSE;
@property (nonatomic, strong) NSString *radar;
@property (nonatomic, strong) NSString *njd;
@property (nonatomic, strong) NSString *sD;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
