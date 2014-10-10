//
//  WeatherWeatherinfo.m
//
//  Created by fx  on 14-9-30
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "WeatherWeatherinfo.h"


NSString *const kWeatherWeatherinfoTemp = @"temp";
NSString *const kWeatherWeatherinfoTime = @"time";
NSString *const kWeatherWeatherinfoWD = @"WD";
NSString *const kWeatherWeatherinfoQy = @"qy";
NSString *const kWeatherWeatherinfoIsRadar = @"isRadar";
NSString *const kWeatherWeatherinfoCityid = @"cityid";
NSString *const kWeatherWeatherinfoCity = @"city";
NSString *const kWeatherWeatherinfoWS = @"WS";
NSString *const kWeatherWeatherinfoWSE = @"WSE";
NSString *const kWeatherWeatherinfoRadar = @"Radar";
NSString *const kWeatherWeatherinfoNjd = @"njd";
NSString *const kWeatherWeatherinfoSD = @"SD";


@interface WeatherWeatherinfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherWeatherinfo

@synthesize temp = _temp;
@synthesize time = _time;
@synthesize wD = _wD;
@synthesize qy = _qy;
@synthesize isRadar = _isRadar;
@synthesize cityid = _cityid;
@synthesize city = _city;
@synthesize wS = _wS;
@synthesize wSE = _wSE;
@synthesize radar = _radar;
@synthesize njd = _njd;
@synthesize sD = _sD;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.temp = [self objectOrNilForKey:kWeatherWeatherinfoTemp fromDictionary:dict];
            self.time = [self objectOrNilForKey:kWeatherWeatherinfoTime fromDictionary:dict];
            self.wD = [self objectOrNilForKey:kWeatherWeatherinfoWD fromDictionary:dict];
            self.qy = [self objectOrNilForKey:kWeatherWeatherinfoQy fromDictionary:dict];
            self.isRadar = [self objectOrNilForKey:kWeatherWeatherinfoIsRadar fromDictionary:dict];
            self.cityid = [self objectOrNilForKey:kWeatherWeatherinfoCityid fromDictionary:dict];
            self.city = [self objectOrNilForKey:kWeatherWeatherinfoCity fromDictionary:dict];
            self.wS = [self objectOrNilForKey:kWeatherWeatherinfoWS fromDictionary:dict];
            self.wSE = [self objectOrNilForKey:kWeatherWeatherinfoWSE fromDictionary:dict];
            self.radar = [self objectOrNilForKey:kWeatherWeatherinfoRadar fromDictionary:dict];
            self.njd = [self objectOrNilForKey:kWeatherWeatherinfoNjd fromDictionary:dict];
            self.sD = [self objectOrNilForKey:kWeatherWeatherinfoSD fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.temp forKey:kWeatherWeatherinfoTemp];
    [mutableDict setValue:self.time forKey:kWeatherWeatherinfoTime];
    [mutableDict setValue:self.wD forKey:kWeatherWeatherinfoWD];
    [mutableDict setValue:self.qy forKey:kWeatherWeatherinfoQy];
    [mutableDict setValue:self.isRadar forKey:kWeatherWeatherinfoIsRadar];
    [mutableDict setValue:self.cityid forKey:kWeatherWeatherinfoCityid];
    [mutableDict setValue:self.city forKey:kWeatherWeatherinfoCity];
    [mutableDict setValue:self.wS forKey:kWeatherWeatherinfoWS];
    [mutableDict setValue:self.wSE forKey:kWeatherWeatherinfoWSE];
    [mutableDict setValue:self.radar forKey:kWeatherWeatherinfoRadar];
    [mutableDict setValue:self.njd forKey:kWeatherWeatherinfoNjd];
    [mutableDict setValue:self.sD forKey:kWeatherWeatherinfoSD];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.temp = [aDecoder decodeObjectForKey:kWeatherWeatherinfoTemp];
    self.time = [aDecoder decodeObjectForKey:kWeatherWeatherinfoTime];
    self.wD = [aDecoder decodeObjectForKey:kWeatherWeatherinfoWD];
    self.qy = [aDecoder decodeObjectForKey:kWeatherWeatherinfoQy];
    self.isRadar = [aDecoder decodeObjectForKey:kWeatherWeatherinfoIsRadar];
    self.cityid = [aDecoder decodeObjectForKey:kWeatherWeatherinfoCityid];
    self.city = [aDecoder decodeObjectForKey:kWeatherWeatherinfoCity];
    self.wS = [aDecoder decodeObjectForKey:kWeatherWeatherinfoWS];
    self.wSE = [aDecoder decodeObjectForKey:kWeatherWeatherinfoWSE];
    self.radar = [aDecoder decodeObjectForKey:kWeatherWeatherinfoRadar];
    self.njd = [aDecoder decodeObjectForKey:kWeatherWeatherinfoNjd];
    self.sD = [aDecoder decodeObjectForKey:kWeatherWeatherinfoSD];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_temp forKey:kWeatherWeatherinfoTemp];
    [aCoder encodeObject:_time forKey:kWeatherWeatherinfoTime];
    [aCoder encodeObject:_wD forKey:kWeatherWeatherinfoWD];
    [aCoder encodeObject:_qy forKey:kWeatherWeatherinfoQy];
    [aCoder encodeObject:_isRadar forKey:kWeatherWeatherinfoIsRadar];
    [aCoder encodeObject:_cityid forKey:kWeatherWeatherinfoCityid];
    [aCoder encodeObject:_city forKey:kWeatherWeatherinfoCity];
    [aCoder encodeObject:_wS forKey:kWeatherWeatherinfoWS];
    [aCoder encodeObject:_wSE forKey:kWeatherWeatherinfoWSE];
    [aCoder encodeObject:_radar forKey:kWeatherWeatherinfoRadar];
    [aCoder encodeObject:_njd forKey:kWeatherWeatherinfoNjd];
    [aCoder encodeObject:_sD forKey:kWeatherWeatherinfoSD];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherWeatherinfo *copy = [[WeatherWeatherinfo alloc] init];
    
    if (copy) {

        copy.temp = [self.temp copyWithZone:zone];
        copy.time = [self.time copyWithZone:zone];
        copy.wD = [self.wD copyWithZone:zone];
        copy.qy = [self.qy copyWithZone:zone];
        copy.isRadar = [self.isRadar copyWithZone:zone];
        copy.cityid = [self.cityid copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
        copy.wS = [self.wS copyWithZone:zone];
        copy.wSE = [self.wSE copyWithZone:zone];
        copy.radar = [self.radar copyWithZone:zone];
        copy.njd = [self.njd copyWithZone:zone];
        copy.sD = [self.sD copyWithZone:zone];
    }
    
    return copy;
}


@end
