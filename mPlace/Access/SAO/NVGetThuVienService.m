//
//  NVGetThuVienService.m
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVGetThuVienService.h"
#import "NVTrafficLibrary.h"
#import "NVTrafficSubCategory.h"
@implementation NVGetThuVienService

-(void)getAllThuVien:(int)type withSubCate:(int)subCate withPageNumber:(int)page_number
        withPageSize:(int)pageSize withMonth:(int)month withYear:(int)year
          andSuccess:(completion)succes andFailure:(failCompletion)failure{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?type=%d&sub_id=%d&page_number=%d&page_size=%d&month=%d&year=%d",DOMAIN_MPLACE,SERVICE_GET_THUVIEN,type,subCate,page_number,pageSize,month,year]];
    NSLog(@"getAllYTuong error request with description : %@", [url relativeString]);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSArray * array = [json objectForKey:@"TrafficLibrary"];
        NSMutableArray * lstTrafficLibrary = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [lstTrafficLibrary addObject:[NVTrafficLibrary initWithFrom:dict]];
        }
        succes([lstTrafficLibrary copy]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getYTuongDoatGiai error request with description : %@", error);
        failure(error);
    }];

}
-(void)getThuVienById:(int)thuVienId andSuccess:(completion)succes andFailure:(failCompletion)failure{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%d",DOMAIN_MPLACE,SERVICE_GET_THUVIEN_BYID,thuVienId]];
    NSLog(@"getAllYTuong error request with description : %@", [url relativeString]);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSArray * array = [json objectForKey:@"TrafficLibrary"];
        NSMutableArray * lstTrafficDetail = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [lstTrafficDetail addObject:[NVTrafficLibrary initWithFrom:dict]];
        }
        succes([lstTrafficDetail copy]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getYTuongDoatGiai error request with description : %@", error);
        failure(error);
    }];

}
-(void)getDanhMucThuVien:(completion)succes andFailure:(failCompletion)failure{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,SERVICE_GET_DANHMUC_THUVIEN]];
    NSLog(@"getDanhMucThuVien error request with description : %@", [url relativeString]);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSArray * array = [json objectForKey:@"TrafficSubCategory"];
        NSMutableArray * lstTrafficDetail = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [lstTrafficDetail addObject:[NVTrafficSubCategory initWithFrom:dict]];
        }
        succes([lstTrafficDetail copy]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getDanhMucThuVien error request with description : %@", error);
        failure(error);
    }];

}
@end
