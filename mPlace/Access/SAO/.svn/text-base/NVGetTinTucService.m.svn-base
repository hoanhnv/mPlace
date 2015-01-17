//
//  NVGetTinTucService.m
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import "NVGetTinTucService.h"
#import "NVTygia.h"
@implementation NVGetTinTucService{

    NVTintucDatabase * database;
    //NSOperationQueue *operationQueue;
}


- (id)init{
    self = [super init];
    if(self){
        database = [[NVTintucDatabase alloc] init];
        
    }
    
    return self;
}

-(void)allNewsSuccessfulwithID:(NSNumber *)idCate :(void(^)(NSArray *listNewsObject))sucBlock
                 andFail:(void(^)(NSError *error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_ALL_NEWS(idCate)]);
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_ALL_NEWS(idCate)] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       // NSLog(@"JSON: %@", responseObject);
    
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        NSArray * array = [dictionary objectForKey:@"lstArticles"];
        NSMutableArray * listTintuc = [[NSMutableArray alloc] init];
        for(NSDictionary * dic in array){
            //NSLog(@"%@",dic);
            [listTintuc addObject:[self _parserObject:dic]];
        }
        [database insertTinTucIntoDatabase:[listTintuc copy]];
        sucBlock([listTintuc copy]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];

}

-(void)first10NewsSuccessfulwithID:(NSNumber*)idCate :(void(^)(NSArray *listNewsObject))sucBlock
                 andFail:(void(^)(NSError *error))failBlock{
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
//    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
//    //NSLog(@"aaa cate = %@",[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_10_NEWS(idCate)]);
//    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_10_NEWS(idCate)] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        // NSLog(@"JSON: %@", responseObject);
//        
//        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        SBJsonParser *parser = [[SBJsonParser alloc] init];
//        NSDictionary * dictionary = [parser objectWithString:stringData];
//        NSArray * array = [dictionary objectForKey:@"lstArticles"];
//        NSMutableArray * listTintuc = [[NSMutableArray alloc] init];
//        for(NSDictionary * dic in array){
//            //NSLog(@"%@",dic);
//            [listTintuc addObject:[self _parserObject:dic]];
//        }
//        [database insertTinTucIntoDatabase:[listTintuc copy]];
//        sucBlock([listTintuc copy]);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error tu tang DAO: %@", error);
//        failBlock(error);
//    }];

    
    // Create a http operation
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_10_NEWS(idCate)]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    //[httpClient registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        NSArray * array = [dictionary objectForKey:@"lstArticles"];
        NSMutableArray * listTintuc = [[NSMutableArray alloc] init];
        for(NSDictionary * dic in array){
            //NSLog(@"%@",dic);
            [listTintuc addObject:[self _parserObject:dic]];
        }
        [database insertTinTucIntoDatabase:[listTintuc copy]];
        sucBlock([listTintuc copy]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    // Add the operation to a queue
    // It will start once added
    [[[Ultility shareInstant] operationQueue] addOperation:operation];
    
    
}

-(void)allNewsCategory:(void(^)(NSArray *listNewsObject))sucBlock
               andFail:(void(^)(NSError *error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_CATEGORIES_NEWS] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // NSLog(@"JSON: %@", responseObject);
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        NSArray * array = [dictionary objectForKey:@"lstArticlesCatJson"];
        NSMutableArray * listTintucCate = [[NSMutableArray alloc] init];
        for(NSDictionary * dic in array){
            //NSLog(@"%@",dic);
            [listTintucCate addObject:[self _parseTinTucCategory:dic]];
        }
        
        sucBlock([listTintucCate copy]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];

}

-(void)allExchangeSuccessful:(void(^)(NSArray *listCurrencyObject))sucBlock
                     andFail:(void(^)(NSError *error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_CURRENCY] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // NSLog(@"JSON: %@", responseObject);
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        NSArray * array = [dictionary objectForKey:@"keyExchangerates"];
        NSMutableArray * listCurrency = [[NSMutableArray alloc] init];
        for(NSDictionary * dic in array){
            //NSLog(@"%@",dic);
            [listCurrency addObject:[self _parserTyGia:dic]];
        }
        //[database insertTinTucIntoDatabase:[listTintuc copy]];
        sucBlock([listCurrency copy]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];

}

-(NVNewsObject*)_parserObject:(NSDictionary *) dic{
    NVNewsObject * obj = [[NVNewsObject alloc] init];
    obj.IDTintuc = [dic objectForKey:@"id"]?[dic objectForKey:@"id"]:@"";
    obj.title    = [dic objectForKey:@"displayName"]?[[dic objectForKey:@"displayName"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    obj.content  = [dic objectForKey:@"content"]?[[dic objectForKey:@"content"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    obj.createDate = [dic objectForKey:@"createDate"]?[dic objectForKey:@"createDate"]:@"";
    obj.createDate = [obj.createDate stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    
    NSArray * imagelink = [dic objectForKey:@"articlesImages"];
    if(imagelink.count>0)
    imagelink.count > 0 ? [obj setLinkImage:[[imagelink objectAtIndex:0] objectForKey:@"url"]]: [obj setLinkImage:nil];
    return obj;

}

- (NVTygia *) _parserTyGia:(NSDictionary *) dic{
    NVTygia * obj = [[NVTygia alloc] init];
    obj.currencyCode = [dic objectForKey:@"currencycode"]?[dic objectForKey:@"currencycode"]:@"";
    obj.currencyName = [dic objectForKey:@"currencyname"]?[dic objectForKey:@"currencyname"]:@"";
    obj.exchangeBuy = [dic objectForKey:@"buy"]?[dic objectForKey:@"buy"]:@"0";
    obj.exchangeSell = [dic objectForKey:@"sell"]?[dic objectForKey:@"sell"]:@"0";
    obj.exchangeTransfer = [dic objectForKey:@"transfer"]?[dic objectForKey:@"transfer"]:@"0";
    
    return obj;
}

- (NVTinTucCategory *) _parseTinTucCategory:(NSDictionary*) dic{
    NVTinTucCategory * obj = [[NVTinTucCategory alloc] init];
    obj.categoryName = [dic objectForKey:@"codeName"];
    obj.categoryID = [dic objectForKey:@"id"];
    
    return obj;
}

@end
