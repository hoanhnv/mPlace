//
//  NVDiaDiemBusiness.h
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVDiaDiem.h"
#import "NVCity.h"
#import "NVCategory.h"

@interface NVDiaDiemBusiness : NSObject


+ (void)allLocationSuccessful:(void(^)(NSArray *listLocationObj))sucBlock
                  andFail:(void(^)(NSError *error))failBlock;
+ (void)allDiaDiemFromServiceFollowCategoryID:(void(^)(NSArray * listLocationBookMark))sucBlock andFail:(void(^)(NSError * error))failBlock;

+ (void)allDiaDiemFromDBSuccessful:(void(^)(NSArray *listLocationObj))sucBlock
                           andFail:(void(^)(NSError *error))failBlock;
+ (void)allBookmarkFromDB:(void(^)(NSArray * listLocationBookMark))sucBlock andFail:(void(^)(NSError * error))failBlock;
+ (void)allHotLocationSuccessful:(void(^)(NSArray *listHotObject))sucBlock
                         andFail:(void(^)(NSError *error))failBlock;
+ (void)allLocationNearSuccessful:(void(^)(NSArray *listLocationObject))sucBlock
                          andFail:(void(^)(NSError *error))failBlock;
+ (void)allDiaDiemFromSearch:(NSString *)keyword withCity:(NVCity*) aCity and:(NVCategory*)aCategory :(void(^)(NSArray * listLocationBookMark))sucBlock andFail:(void(^)(NSError * error))failBlock;
+ (void)allCitySuccessful:(void(^)(NSArray *listCityObject))sucBlock
                  andFail:(void(^)(NSError *error))failBlock;
+ (BOOL)insertBookMark:(NVDiaDiem *)nvDiadiem;
+ (BOOL)DeleteBookMarkWithDiaDiem:(NVDiaDiem *)nvDiadiem;
+ (BOOL)checkBookmark:(NVDiaDiem*) nvDiadiem;
+ (NVDiaDiem*) getDiaDiemFromDBWithID:(NSNumber*)idDiaDiem;
+ (NSArray*) sortArrayFollowName:(NSArray *) inputArr;
+ (NSArray*) sortArrayFollowDistance:(NSArray *) inputArr;
@end
