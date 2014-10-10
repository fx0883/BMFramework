//
//  WeatherBaseClass.m
//
//  Created by fx  on 14-9-30
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "WeatherBaseClass.h"
#import "WeatherWeatherinfo.h"


#define kWeatherBaseClassWeatherinfo  @"weatherinfo"


@interface WeatherBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeatherBaseClass

@synthesize weatherinfo = _weatherinfo;


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
            self.weatherinfo = [WeatherWeatherinfo modelObjectWithDictionary:[dict objectForKey:kWeatherBaseClassWeatherinfo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.weatherinfo dictionaryRepresentation] forKey:kWeatherBaseClassWeatherinfo];

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

    self.weatherinfo = [aDecoder decodeObjectForKey:kWeatherBaseClassWeatherinfo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_weatherinfo forKey:kWeatherBaseClassWeatherinfo];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeatherBaseClass *copy = [[WeatherBaseClass alloc] init];
    
    if (copy) {

        copy.weatherinfo = [self.weatherinfo copyWithZone:zone];
    }
    
    return copy;
}


@end
