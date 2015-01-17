//
//  NVGetCharging.m
//  mPlace
//
//  Created by hehe on 12/9/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVGetCharging.h"

@implementation NVGetCharging


- (id)init{
    self = [super init];
    if(self){
        param = [NSDictionary dictionaryWithObjectsAndKeys:@"84936478266",@"t3st_numb3r", nil];
    }
    
    return self;
}

- (void)getPayService:(void(^)(BOOL suc))sucBlock
              andFail:(void(^)(NSError *error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_PAY]);
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_PAY] parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // NSLog(@"JSON: %@", responseObject);
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        sucBlock(YES);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];
}

- (void)getCancelService:(void(^)(BOOL suc))sucBlock
                 andFail:(void(^)(NSError *error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_CANCEL]);
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_CANCEL] parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // NSLog(@"JSON: %@", responseObject);
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        //NSArray * array = [dictionary objectForKey:@"lstArticles"];
       // NSMutableArray * listTintuc = [[NSMutableArray alloc] init];
        sucBlock(YES);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];
}

- (void)getAccount:(void(^)(BOOL suc))sucBlock
           andFail:(void(^)(NSError *error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_ACCOUNT]);
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_ACCOUNT] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // NSLog(@"JSON: %@", responseObject);
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"aaa = %@",stringData);
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        //NSDictionary * dictionary = [parser objectWithString:stringData];
        //NSArray * array = [dictionary objectForKey:@"lstArticles"];
        sucBlock(YES);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];
}



@end
