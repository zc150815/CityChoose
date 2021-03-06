//
//  ZCCityModel.h
//  城市选择
//
//  Created by Ning Xie on 16/5/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCCityModel : NSObject

@property (strong, nonatomic) NSArray *cities;
@property (copy, nonatomic) NSString *name;

-(instancetype)initCityWithDict:(NSDictionary *)dict;

+(instancetype)cityWithDict:(NSDictionary *)dict;

@end
