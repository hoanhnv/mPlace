//
//  NVGetUltilityService.m
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import "NVGetUltilityService.h"
#import "NVUltilityDatabase.h"
@implementation NVGetUltilityService

+ (void)truncateDatabase{
    [NVUltilityDatabase truncateDatabase];
}



- (void)allCategorySuccessful:(void(^)(NSArray *listCategory))sucBlock
                      andFail:(void(^)(NSError *error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_CATEGORIES] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // NSLog(@"JSON: %@", responseObject);
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        NSArray * array = [dictionary objectForKey:@"lstLocationCat"];
        NSMutableArray * listCurrency = [[NSMutableArray alloc] init];
        for(NSDictionary * dic in array){
            //NSLog(@"%@",dic);
            [listCurrency addObject:[self _parserObject:dic]];
        }
        //[database insertTinTucIntoDatabase:[listTintuc copy]];
        sucBlock([listCurrency copy]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];

}

- (void)allWeatherSuccessful:(void(^)(NSArray *listWeather))sucBlock
                     andFail:(void(^)(NSError *error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_WEATHER] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // NSLog(@"JSON: %@", responseObject);
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        NSArray * array = [dictionary objectForKey:@"lstProvinWeather"];
        NSMutableArray * listWeather = [[NSMutableArray alloc] init];
        for(NSDictionary * dic in array){
            //NSLog(@"%@",dic);
            [listWeather addObject:[self _parseWeather:dic]];
        }
        //[database insertTinTucIntoDatabase:[listTintuc copy]];
        sucBlock([listWeather copy]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];
}

- (NVThoiTiet*) _parseWeather:(NSDictionary*) dic{
    NVThoiTiet * obj = [[NVThoiTiet alloc] init];
    obj.we_IDThoiTiet = [dic objectForKey:@"id"]?[dic objectForKey:@"id"]:@"";
    obj.we_urlImage    = [dic objectForKey:@"urlimage"]?[[dic objectForKey:@"urlimage"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    obj.we_displayName  = [dic objectForKey:@"displayName"]?[dic objectForKey:@"displayName"] :@"";
    obj.we_temp = [dic objectForKey:@"temp"]?[dic objectForKey:@"temp"]:@"";
    obj.we_description = [dic objectForKey:@"description"]?[dic objectForKey:@"description"]:@"";
    obj.we_nangmua = [dic objectForKey:@"main"]?[dic objectForKey:@"main"]:@"";
    return obj;
}

- (NVCategory*)_parserObject:(NSDictionary *) dic{
    NVCategory * obj = [[NVCategory alloc] init];
    obj.idCategory = [dic objectForKey:@"id"]?[dic objectForKey:@"id"]:@"";
    obj.imageURL    = [dic objectForKey:@"imageUrl"]?[[dic objectForKey:@"imageUrl"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    obj.displayName  = [dic objectForKey:@"displayName"]?[[dic objectForKey:@"displayName"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    
    return obj;
    
}

@end
