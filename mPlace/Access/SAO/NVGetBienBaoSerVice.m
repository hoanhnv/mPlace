//
//  NVGetBienBaoSerVice.m
//  mPlace
//
//  Created by MAC on 1/22/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVGetBienBaoSerVice.h"
#import "NVTrafficSign.h"


@implementation NVGetBienBaoSerVice


+ (void) getListBienBao:(NSInteger) pageNumber andType:(NSInteger) type  andComple:(completion)success andFauil:(failCompletion)fail {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger month = [components month];
    NSInteger year = [components year];
    NSURL *url = [NSURL URLWithString:SERVICE_GET_LIST_WARNING];
    NSDictionary *params = @{@"page_size": [NSNumber numberWithInteger:20],
                             @"type":[NSNumber numberWithInteger:type],
                             @"month":[NSNumber numberWithInteger:month],
                             @"year":[NSNumber numberWithInteger:year],
                             @"sub_id":@"",
                             @"category_type":[NSNumber numberWithInteger:1],
                             @"page_number":[NSNumber numberWithInteger:pageNumber]};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSArray * array = [json objectForKey:@"TrafficSign"];
        NSMutableArray * listTrafficSign = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [listTrafficSign addObject:[NVTrafficSign initWithFrom:dict]];
        }
        success(listTrafficSign);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getYTuongDoatGiai error request with description : %@", error);
        fail(error);
    }];
}

+ (void) getTraficSingDetail:(NVTrafficSign*) traficSIng  andComple:(completion)success andFauil:(failCompletion)fail {

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:SERVICE_GET_TRAFICSING_DETAIL,traficSIng.traficSingId]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSArray * array = [json objectForKey:@"TrafficSign"];
        NSMutableArray * listTrafficSign = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [listTrafficSign addObject:[NVTrafficSign initWithFrom:dict]];
        }
        success(listTrafficSign);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getYTuongDoatGiai error request with description : %@", error);
        fail(error);
    }];
}

+(void)getDanhmucBienBao:(completion)success andFailure:(failCompletion)failure {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,SERVICE_GET_DANHMUC_BIENBAO]];
    NSLog(@"getDanhmucBienBao error request with description : %@", [url relativeString]);
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
           // [lstTrafficDetail addObject:[NVTrafficSubCategory initWithFrom:dict]];
        }
        success([lstTrafficDetail copy]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getDanhmucBienBao error request with description : %@", error);
        failure(error);
    }];

}




@end
