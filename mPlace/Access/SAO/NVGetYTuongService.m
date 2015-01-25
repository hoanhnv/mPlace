//
//  NVGetYTuongService.m
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVGetYTuongService.h"

@implementation NVGetYTuongService
-(void)getAllYTuong:(int)type withPageNumber:(int)page_number withPageSize:(int)pageSize withMonth:(int)month withYear:(int)year andSuccess:(completion)succes
         andFailure:(failCompletion)failure{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@type=%d&page_number=%d&page_size=%d&month=%d&year=%d",DOMAIN_MPLACE,SERVICE_GET_ALLYTUONG,type,page_number,pageSize,month,year]];
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
        NSArray * array = [json objectForKey:@"Ideas"];
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
-(void)getYtuongById:(int)ytuongId andSuccess:(completion)succes andFailure:(failCompletion)failure{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%d",DOMAIN_MPLACE,SERVICE_GET_YTUONG_BYID,ytuongId]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSArray * array = [json objectForKey:@"Ideas"];
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
@end
