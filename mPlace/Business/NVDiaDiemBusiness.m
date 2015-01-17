//
//  NVDiaDiemBusiness.m
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import "NVDiaDiemBusiness.h"
#import "NVGetDiaDiemService.h"
#import "NVDiaDiemDatabase.h"
@implementation NVDiaDiemBusiness

+ (void)allLocationSuccessful:(void(^)(NSArray *listLocationObj))sucBlock
                      andFail:(void(^)(NSError *error))failBlock{
    NVGetDiaDiemService * _service = [[NVGetDiaDiemService alloc] init];
    [_service allLocationSuccessful:^(NSArray *listLocationObject) {
        sucBlock(listLocationObject);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];

}

+ (void)allDiaDiemFromDBSuccessful:(void(^)(NSArray *listLocationObj))sucBlock
                           andFail:(void(^)(NSError *error))failBlock{
    NVDiaDiemDatabase * databse = [[NVDiaDiemDatabase alloc] init];
    [databse allDiaDiemFromDBSuccessful:^(NSArray *listLocationObject) {
        sucBlock(listLocationObject);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];
}

+ (void)allBookmarkFromDB:(void(^)(NSArray * listLocationBookMark))sucBlock andFail:(void(^)(NSError * error))failBlock{
    NVDiaDiemDatabase * database = [[NVDiaDiemDatabase alloc] init];
    [database allBookmarkFromDB:^(NSArray *listLocationBookMark) {
        sucBlock(listLocationBookMark);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];
}

+ (void)allDiaDiemFromServiceFollowCategoryID:(void(^)(NSArray * listLocationBookMark))sucBlock andFail:(void(^)(NSError * error))failBlock{
    NVGetDiaDiemService * service = [[NVGetDiaDiemService alloc] init];
    [service allLocationFollowCategorySuccessful:^(NSArray *listLocationObject) {
        sucBlock(listLocationObject);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];
}

+ (void)allDiaDiemFromSearch:(NSString *)keyword withCity:(NVCity*) aCity and:(NVCategory*)aCategory :(void(^)(NSArray * listLocationBookMark))sucBlock andFail:(void(^)(NSError * error))failBlock{
    NVGetDiaDiemService * service = [[NVGetDiaDiemService alloc] init];
    [service allDiaDiemFromSearch:keyword withCity:aCity and:aCategory :^(NSArray *listLocationBookMark) {
        sucBlock(listLocationBookMark);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];
}

+ (void)allLocationNearSuccessful:(void(^)(NSArray *listLocationObject))sucBlock
                         andFail:(void(^)(NSError *error))failBlock{
    NVGetDiaDiemService * service = [[NVGetDiaDiemService alloc] init];
    [service allLocationNearSuccessful:^(NSArray *listLocationObject) {
        sucBlock(listLocationObject);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];
    
}

+ (void)allHotLocationSuccessful:(void(^)(NSArray *listHotObject))sucBlock
                         andFail:(void(^)(NSError *error))failBlock{
    NVGetDiaDiemService * service = [[NVGetDiaDiemService alloc] init];
    [service allHotLocationSuccessful:^(NSArray *listHotObject) {
        sucBlock(listHotObject);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];

}

+ (void)allCitySuccessful:(void(^)(NSArray *listCityObject))sucBlock
                         andFail:(void(^)(NSError *error))failBlock{
    NVGetDiaDiemService * service = [[NVGetDiaDiemService alloc] init];
    [service allCitySuccessful:^(NSArray *listCityObject) {
        sucBlock(listCityObject);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];
}

+ (BOOL)insertBookMark:(NVDiaDiem *)nvDiadiem{
    NVDiaDiemDatabase * database = [[NVDiaDiemDatabase alloc] init];
    [database insertBookMark:nvDiadiem];
    return YES;
}

+ (BOOL)DeleteBookMarkWithDiaDiem:(NVDiaDiem *)nvDiadiem{
    NVDiaDiemDatabase * database = [[NVDiaDiemDatabase alloc] init];
    [database DeleteBookMarkWithDiaDiem:nvDiadiem];
    return YES;
}

+ (BOOL)checkBookmark:(NVDiaDiem*) nvDiadiem{
    NVDiaDiemDatabase * database = [[NVDiaDiemDatabase alloc] init];
    return [database checkBookmark:nvDiadiem];
}

+ (NVDiaDiem*) getDiaDiemFromDBWithID:(NSNumber*)idDiaDiem{
    NVDiaDiemDatabase * database = [[NVDiaDiemDatabase alloc] init];
    return [database getDiaDiemFromDBWithID:idDiaDiem];
}

+ (NSArray*) sortArrayFollowDistance:(NSArray *) inputArr{
    
    NSArray *sortedArray;
    sortedArray = [inputArr sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSString *first = [(NVDiaDiem*)a Distance];
        NSString *second = [(NVDiaDiem*)b Distance];
        NSLog(@"%@ %@",first,second);
        return [first compare:second];
    }];
    
    return sortedArray;
}

+ (NSArray*) sortArrayFollowName:(NSArray *) inputArr{
    
    NSArray *sortedArray;
    sortedArray = [inputArr sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        NSString *first = [(NVDiaDiem*)a TenDiaDiem];
        NSString *second = [(NVDiaDiem*)b TenDiaDiem];
        return [first compare:second];
    }];
    
    return sortedArray;
}

@end
