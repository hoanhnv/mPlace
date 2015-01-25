//
//  NVGetAmNhacService.m
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVGetAmNhacService.h"


@implementation NVGetAmNhacService



+ (void) getListMusic:(NSInteger)pageNumber andCompleSucces:(completion)success andFauil:(failCompletion)fail {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@page_number=%@",DOMAIN_MPLACE,SERVICE_GET_LIST_MUSIC,[NSNumber numberWithInteger:pageNumber]]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSArray * array = [json objectForKey:@"Music"];
        NSMutableArray * listMusic = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [listMusic addObject:[NVMusicCurent initWithFrom:dict]];
        } 
        success(listMusic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getYTuongDoatGiai error request with description : %@", error);
        fail(error);
    }];
}

+ (void) getMusicDetail:(NVMusicCurent*) musicObject  andCompleSucces:(completion) success andFauil:(failCompletion) fail {

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:SERVICE_GET_DETAIL_MUSIC,[NSNumber numberWithInteger:musicObject.musicId],[NSNumber numberWithFloat:[[[UIDevice currentDevice] systemVersion] floatValue]]]];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSDictionary * dictData = [json objectForKey:@"CurrentMusic"];
        NSArray      *array     = [json valueForKey:@"RandomMusic"];
        NSMutableArray *listMusci = [NSMutableArray array];
        if (![dictData isKindOfClass:[NSNull class]]) {
            [musicObject updateInfo:musicObject withData:dictData];
        }
        
        if (![array isKindOfClass:[NSNull class]]) {
            for (NSDictionary *dic in array) {
                [listMusci addObject:[NVMusicCurent initWithFrom:dic]];
            }
        } 
        success(listMusci);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getYTuongDoatGiai error request with description : %@", error);
        fail(error);
    }];
}

@end
