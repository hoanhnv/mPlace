//
//  NVGetDiaDiemService.h
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVDiaDiem.h"
#import "NVCity.h"

@interface NVGetDiaDiemService : NSObject

-(void)allLocationSuccessful:(void(^)(NSArray *listLocationObject))sucBlock
                 andFail:(void(^)(NSError *error))failBlock;
-(void)allLocationFollowCategorySuccessful:(void(^)(NSArray *listLocationObject))sucBlock andFail:(void(^)(NSError *error))failBlock;
-(void)allHotLocationSuccessful:(void(^)(NSArray *listHotObject))sucBlock
                        andFail:(void(^)(NSError *error))failBlock;
-(void)allLocationNearSuccessful:(void(^)(NSArray *listLocationObject))sucBlock
                         andFail:(void(^)(NSError *error))failBlock;
- (void)allDiaDiemFromSearch:(NSString *)keyword withCity:(NVCity*) aCity and:(NVCategory*)aCategory :(void(^)(NSArray * listLocationBookMark))sucBlock andFail:(void(^)(NSError * error))failBlock;
- (void)allCitySuccessful:(void(^)(NSArray *listCityObject))sucBlock
                         andFail:(void(^)(NSError *error))failBlock;
@end
