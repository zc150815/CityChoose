//
//  ZCCityModel.m
//  城市选择
//
//  Created by Ning Xie on 16/5/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ZCCityModel.h"

@implementation ZCCityModel

-(instancetype)initCityWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)cityWithDict:(NSDictionary *)dict
{
    return [[self alloc]initCityWithDict:dict];
}
@end
