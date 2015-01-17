//
//  NVTinTucService.m
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import "NVTinTucService.h"
#import "NVGetTinTucService.h"
#import "NVTintucDatabase.h"
@implementation NVTinTucService

+ (void)allNewsSuccessfulwithID:(NSNumber *)idCate :(void(^)(NSArray *listNewsObject))sucBlock
                        andFail:(void(^)(NSError *error))failBlock{
    NVGetTinTucService * service = [[NVGetTinTucService alloc] init];
    [service allNewsSuccessfulwithID:idCate :^(NSArray *listNewsObject) {
        sucBlock(listNewsObject);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];
}

+ (void)first10NewsSuccessful:(void(^)(NSArray *listNewsObject))sucBlock
                  andFail:(void(^)(NSError *error))failBlock{
  //  NVGetTinTucService * service = [[NVGetTinTucService alloc] init];
//    [service allNewsSuccessful:^(NSArray *listNewsObject) {
//        if(sucBlock)
//            sucBlock(listNewsObject);
//    } andFail:^(NSError *error) {
//        if(error) NSLog(@"loi get tu service %@",error);
//    }];
}

+ (void)allNewsCategory:(void(^)(NSArray *listNewsObject))sucBlock
                andFail:(void(^)(NSError *error))failBlock{
    NVGetTinTucService * service = [[NVGetTinTucService alloc] init];
    [service allNewsCategory:^(NSArray *listNewsObject) {
        sucBlock(listNewsObject);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];
}

+ (void)first10NewsSuccessfulwithID:(NSNumber*)idCate :(void(^)(NSArray *listNewsObject))sucBlock
                           andFail:(void(^)(NSError *error))failBlock{
    NVGetTinTucService * service = [[NVGetTinTucService alloc] init];
    [service first10NewsSuccessfulwithID:idCate :^(NSArray *listNewsObject) {
        if(sucBlock) sucBlock(listNewsObject);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];}

+ (void)allTintucFromDBSuccessful:(void(^)(NSArray *listLocationObject))sucBlock
                          andFail:(void(^)(NSError *error))failBlock{
    NVTintucDatabase * _database = [[NVTintucDatabase alloc] init];
    [_database allTintucFromDBSuccessful:^(NSArray *listLocationObject) {
        sucBlock(listLocationObject);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];
}

+ (void)allExchangeSuccessful:(void(^)(NSArray *listCurrencyObject))sucBlock
                      andFail:(void(^)(NSError *error))failBlock{
    NVGetTinTucService * service = [[NVGetTinTucService alloc] init];
    [service allExchangeSuccessful:^(NSArray *listCurrencyObject) {
        sucBlock(listCurrencyObject);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];
}

@end
