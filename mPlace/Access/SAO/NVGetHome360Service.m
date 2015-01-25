//
//  NVGetHome360Service.m
//  mPlace
//
//  Created by hoanhnv on 19/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVGetHome360Service.h"
#import "NVImageDoatGiai.h"
#import "NVImageRandom.h"
#import "NVIdeasAward.h"
#import "NVTraficCategory.h"
#define TIME_OUT_REQUEST 20;

@implementation NVGetHome360Service
-(void)getRandomImage:(NSString *)page_number withPageSize:(NSString *)pageSize
           andSuccess:(completion)succes andFailure:(failCompletion)failure{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,SERVICE_GET_ANH_RANDOM]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSArray * array = [json objectForKey:@"traffic"];
        NSMutableArray * lstImage = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [lstImage addObject:[NVImageRandom initWithFrom:dict]];
        }
        succes([lstImage copy]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getRandomImage error request with description : %@", error);
        failure(error);
    }];


}
-(void)getAnhDoatGiai:(NSString *)page_number withPageSize:(NSString *)pageSize
           andSuccess:(completion)succes andFailure:(failCompletion)failure{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,SERVICE_GET_ANH_DOAT_GIAI]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSArray * array = [json objectForKey:@"imageAward"];
        NSMutableArray * lstImage = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [lstImage addObject:[NVImageDoatGiai initWithFrom:dict]];
        }
        succes([lstImage copy]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"getAnhDoatGiai error request with description : %@", error);
        failure(error);
    }];
}
-(void)getYTuongDoatGiai:(NSString *)page_number withPageSize:(NSString *)pageSize
              andSuccess:(completion)succes andFailure:(failCompletion)failure{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,SERVICE_GET_YTUONG_DPAT_GIAI]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSArray * array = [json objectForKey:@"ideasAward"];
        NSMutableArray * lstIdeas = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [lstIdeas addObject:[NVIdeasAward initWithFrom:dict]];
        }
        succes([lstIdeas copy]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getYTuongDoatGiai error request with description : %@", error);
        failure(error);
    }];
}
-(void)getRule:(completion)succes
    andFailure:(failCompletion)failure{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,SERVICE_GET_RULE]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        succes([json valueForKey:@"Rule"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getRule error request with description : %@", error);
        failure(error);
    }];

}


+ (void) getListTraficCategory:(NSInteger) pageNumber andSuccess:(completion) succes andFail:(failCompletion) failure {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@page_size=20&page_number=%@",DOMAIN_MPLACE,SERVICE_GET_LIST_TRAFIC,[NSNumber numberWithInteger:pageNumber]]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSArray * array = [json objectForKey:@"TrafficCategory"];
        NSMutableArray * listTrafic = [[NSMutableArray alloc] init];
        if (array && ![array isKindOfClass:[NSNull class]]) {
            for(NSDictionary * dict in array){
                [listTrafic addObject:[NVTraficCategory initWithFrom:dict]];
            }
        }
        succes(listTrafic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getYTuongDoatGiai error request with description : %@", error);
        failure(error);
    }];
    
}

+ (void) posListComment:(NSDictionary*) params andComple:(completion) comple andfail:(failCompletion) fauil {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *path = [NSString stringWithFormat:@"%@/api/UpIdeas",DOMAIN_MPLACE];
    [manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        
        comple(json);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fauil(error);
    }];
    
//    Ý tưởng cảu bạn đã được đăng thành công, Chúng tôi sẽ duyệt bài của bạn sớm nhất, Trân trọng cảm ơn!
}

@end
