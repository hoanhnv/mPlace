//
//  NVGetHome360Service.m
//  mPlace
//
//  Created by hoanhnv on 19/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVGetHome360Service.h"
#import "NVImage360.h"
#define TIME_OUT_REQUEST 20;

@implementation NVGetHome360Service
-(void)getRandomImage:(NSString *)page_number withPageSize:(NSString *)pageSize
           andSuccess:(compeletion)succes andFail:(failCompletion)fail{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = TIME_OUT_REQUEST;
    [manager GET:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,SERVICE_GET_ANH_RANDOM] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        if(stringData == nil) return;
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        NSArray * array = [dictionary objectForKey:@"traffic"];
        NSMutableArray * lstImage = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [lstImage addObject:[NVImage360 initWithFrom:dict]];
        }
        succes([lstImage copy]);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"NVGetHome360Service error request with description : %@", error);
        fail(error);
    }];

}
-(void)getAnhDoatGiai:(NSString *)page_number withPageSize:(NSString *)pageSize
           andSuccess:(compeletion)succes andFail:(failCompletion)fail{
    
}
-(void)getYTuongDoatGiai:(NSString *)page_number withPageSize:(NSString *)pageSize
              andSuccess:(compeletion)succes andFail:(failCompletion)error{
    
}
@end
