//
//  NVUltilityService.m
//  mPlace
//
//  Created by hehe on 11/17/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVUltilityService.h"
#import "NVGetUltilityService.h"

@implementation NVUltilityService

+ (void)allCategorySuccessful:(void(^)(NSArray *listCategory))sucBlock
                      andFail:(void(^)(NSError *error))failBlock{
    NVGetUltilityService * service = [[NVGetUltilityService alloc] init];
    [service allCategorySuccessful:^(NSArray *listCategory) {
        sucBlock(listCategory);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];
}

+ (void)allWeatherSuccessful:(void(^)(NSArray *listWeather))sucBlock
                     andFail:(void(^)(NSError *error))failBlock{
    NVGetUltilityService * service = [[NVGetUltilityService alloc] init];
    [service allWeatherSuccessful:^(NSArray *listWeather) {
        sucBlock(listWeather);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];
}

@end
