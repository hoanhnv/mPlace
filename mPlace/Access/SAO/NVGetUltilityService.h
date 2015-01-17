//
//  NVGetUltilityService.h
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVCategory.h"
#import "NVThoiTiet.h"

@interface NVGetUltilityService : NSObject

+ (void)truncateDatabase;
- (void)allCategorySuccessful:(void(^)(NSArray *listCategory))sucBlock
                 andFail:(void(^)(NSError *error))failBlock;
- (void)allWeatherSuccessful:(void(^)(NSArray *listWeather))sucBlock
                      andFail:(void(^)(NSError *error))failBlock;
@end
