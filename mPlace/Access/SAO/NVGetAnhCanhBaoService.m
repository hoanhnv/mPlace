//
//  NVGetAnhCanhBaoService.m
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVGetAnhCanhBaoService.h"
#import "NVImageDoatGiai.h"
#import "NVImagesWarning.h"

@implementation NVGetAnhCanhBaoService



+ (void) getListImageWarning:(NSInteger)page_number withPageSize:(NSInteger)pageSize withMonth:(NSInteger)month withYear:(NSInteger)year andSuccess:(completion)succes andFailure:(failCompletion)failure {
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,SERVICE_GET_LIST_IMAGE_WARNING]];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@page_size=%@&page_number=%@&month=%@&year=%@",DOMAIN_MPLACE,SERVICE_GET_LIST_IMAGE_WARNING,[NSNumber numberWithInteger:pageSize],[NSNumber numberWithInteger:page_number],[NSNumber numberWithInteger:month],[NSNumber numberWithInteger:year]]];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *listImage = [NSMutableArray array];
        
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSArray * array = [json objectForKey:@"ImagesWarning"];
        
        
        if (array && ![array isKindOfClass:[NSNull class]]) {
            for(NSDictionary * dict in array){ 
                [listImage addObject:[NVImageDoatGiai initWithFrom:dict]];
            }
        }
        NSLog(@"REQUEST SUCCESS: %@",operation.request.URL);
        succes(listImage);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"getRandomImage error request with description : %@", error);
        failure(error);
    }];
}
+ (void) uploadAnhCanhBao:(NSMutableDictionary*) params andComple:(completion) comple andFailure:(failCompletion) failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *path = [NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,SERVICE_UPLOAD_ANHCANHBAO];
    [manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        comple(json);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}
+ (void) anhCanhBaoChiTiet:(NSInteger)iID andComple:(completion) comple andFailure:(failCompletion) failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *path = [NSString stringWithFormat:@"%@%@%d",DOMAIN_MPLACE,SERVICE_ANHCANHBAO_CHITIET,iID];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json !=nil) {
            NSDictionary *dict = [json objectForKey:@"ImagesWarning"];
           NVImagesWarning *obj =[NVImagesWarning initWithFrom:dict];
            comple(obj);
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
