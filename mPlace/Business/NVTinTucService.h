//
//  NVTinTucService.h
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVTinTucService : NSObject

+ (void)allNewsSuccessfulwithID:(NSNumber *)idCate :(void(^)(NSArray *listNewsObject))sucBlock
                        andFail:(void(^)(NSError *error))failBlock;
+ (void)allTintucFromDBSuccessful:(void(^)(NSArray *listLocationObject))sucBlock
                          andFail:(void(^)(NSError *error))failBlock;
+ (void)allExchangeSuccessful:(void(^)(NSArray *listCurrencyObject))sucBlock
                     andFail:(void(^)(NSError *error))failBlock;
+ (void)first10NewsSuccessfulwithID:(NSNumber*)idCate :(void(^)(NSArray *listNewsObject))sucBlock
                            andFail:(void(^)(NSError *error))failBlock;
+ (void)allNewsCategory:(void(^)(NSArray *listNewsObject))sucBlock
                 andFail:(void(^)(NSError *error))failBlock;
@end
