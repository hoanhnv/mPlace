//
//  NVGetDiaDiemService.m
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import "NVGetDiaDiemService.h"
#import "NVDiaDiemDatabase.h"

#define TIME_OUT 30

@implementation NVGetDiaDiemService{
    NVDiaDiemDatabase * database;
}

- (id)init{
    self = [super init];
    if(self){
        database = [[NVDiaDiemDatabase alloc] init];
    }
    
    return self;
}

// Day la service get 100 dia diem voi id la @"1"
-(void)allLocationSuccessful:(void(^)(NSArray *listLocationObject))sucBlock
                     andFail:(void(^)(NSError *error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = TIME_OUT;
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_ALL_DIA_DIEM] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        if(stringData == nil) return;
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        NSArray * array = [dictionary objectForKey:@"lstLocation"];
        NSMutableArray * listLocations = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [listLocations addObject:[self _parserObject:dict]];
        }
//        [[Ultility shareInstant] setFirst10Locations:[self _loadFirst10Location:[listLocations copy]]];
        //[[Ultility shareInstant] first10Locations] = [self _loadFirst10Location:[listLocations copy]];
        [database insertDiaDiemIntoDatabase:[listLocations copy]];
        sucBlock([listLocations copy]);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];

}

-(void)allHotLocationSuccessful:(void(^)(NSArray *listHotObject))sucBlock
                                   andFail:(void(^)(NSError *error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = TIME_OUT;
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_HOT]);
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_HOT] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        if(stringData == nil) return;
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        NSArray * array = [dictionary objectForKey:@"lstLocationHonor"];
        NSMutableArray * listLocations = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [listLocations addObject:[self _parserObject:dict]];
        }
        [database insertDiaDiemIntoDatabase:[listLocations copy]];
        sucBlock([listLocations copy]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];
}

-(void)allLocationFollowCategorySuccessful:(void(^)(NSArray *listLocationObject))sucBlock
                     andFail:(void(^)(NSError *error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = TIME_OUT;
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_ALL_LOCATION([[Ultility shareInstant] categoryID],[[Ultility shareInstant] pageNumberAllLocation])]);
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_ALL_LOCATION([[Ultility shareInstant] categoryID],[[Ultility shareInstant] pageNumberAllLocation])] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        if(stringData == nil) return;
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        NSArray * array = [dictionary objectForKey:@"lstLocation"];
        NSMutableArray * listLocations = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [listLocations addObject:[self _parserObject:dict]];
        }
        [database insertDiaDiemIntoDatabase:[listLocations copy]];
        sucBlock([listLocations copy]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];
    
}

- (void)allDiaDiemFromSearch:(NSString *)keyword withCity:(NVCity*) aCity and:(NVCategory*)aCategory :(void(^)(NSArray * listLocationBookMark))sucBlock andFail:(void(^)(NSError * error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = TIME_OUT;
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_SEARCH_LOCATION([keyword stringByReplacingOccurrencesOfString:@" " withString:@"%20"],aCity.idCity,aCategory.idCategory,[[Ultility shareInstant] pageNumberAllLocation])]);
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_SEARCH_LOCATION([keyword stringByReplacingOccurrencesOfString:@" " withString:@"%20"],aCity?aCity.idCity:@0,aCategory?aCategory.idCategory:@0,[[Ultility shareInstant] pageNumberAllLocation])] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        if(stringData == nil) return;
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        NSArray * array = [dictionary objectForKey:@"lstLocationSearch"];
        NSMutableArray * listLocations = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [listLocations addObject:[self _parserObject:dict]];
        }

        sucBlock([listLocations copy]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];
}

-(void)allLocationNearSuccessful:(void(^)(NSArray *listLocationObject))sucBlock
                                   andFail:(void(^)(NSError *error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = TIME_OUT;
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_NEAR_LOCATION([[Ultility shareInstant] idNowLocatoin],@1)]);
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_NEAR_LOCATION([[Ultility shareInstant] idNowLocatoin],@1)] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        if(stringData == nil) return;
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        NSArray * array = [dictionary objectForKey:@"lstRelatedLocation"];
        NSMutableArray * listLocations = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [listLocations addObject:[self _parserObject:dict]];
        }
        //[database insertDiaDiemIntoDatabase:[listLocations copy]];
        sucBlock([listLocations copy]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];
    
}

-(void)allCitySuccessful:(void(^)(NSArray *listCityObject))sucBlock
                 andFail:(void(^)(NSError *error))failBlock{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  =   [AFHTTPRequestSerializer serializer];
    manager.responseSerializer =   [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = TIME_OUT;
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_ALL_CITY]);
    [manager GET:[NSString stringWithFormat:@"%@%@",SERVERDEFAULT,SERVICE_GET_ALL_CITY] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *stringData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        if(stringData == nil) return;
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        NSDictionary * dictionary = [parser objectWithString:stringData];
        NSArray * array = [dictionary objectForKey:@"lstLocationCat"];
        NSMutableArray * listLocations = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            
            
            [listLocations addObject:[self _parserObjectCity:dict]];
        }
        
        sucBlock([listLocations copy]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error tu tang DAO: %@", error);
        failBlock(error);
    }];
}

-(NVDiaDiem*)_parserObject:(NSDictionary *) dic{
    NVDiaDiem * obj = [[NVDiaDiem alloc] init];
    obj.IDdiadiem = [dic objectForKey:@"id"];
    obj.TenDiaDiem    = [dic objectForKey:@"displayName"]?[[dic objectForKey:@"displayName"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    obj.DiaChi  = [dic objectForKey:@"address"]?[[dic objectForKey:@"address"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    obj.Latitube = [dic objectForKey:@"latitude"]?[dic objectForKey:@"latitude"]:@"";
    obj.Longtitube = [dic objectForKey:@"longitude"]?[dic objectForKey:@"longitude"]:@"";
    obj.GioiThieu  = [dic objectForKey:@"introduction"]?[[dic objectForKey:@"introduction"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    obj.Description = [dic objectForKey:@"description"]?[[dic objectForKey:@"description"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ]:@"";
    NSArray * imagelink = [dic objectForKey:@"locationImages"];
    NSMutableArray * _arr = [[NSMutableArray alloc] init];
    for(NSDictionary * dict in imagelink){
        [_arr addObject:[[dict objectForKey:@"url"] stringByReplacingOccurrencesOfString:@" " withString:@"%20"]];
    }
    obj.listImages = [_arr copy];
    imagelink.count > 0 ? [obj setAnhKhacLink:[[[[imagelink objectAtIndex:0] objectForKey:@"url"] stringByReplacingOccurrencesOfString:@" " withString:@"%20"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]: [obj setAnhKhacLink:nil];
    obj.Distance = [NSString stringWithFormat:@"%.1f",arc4random() % 11 * 0.1];
    
    // loc anh category
    NSArray * arr = [dic objectForKey:@"locationCategoryMappings"];
    NSMutableArray * listImage = [[NSMutableArray alloc] init];
    for(NSDictionary * aDic in arr){
        if([[[aDic objectForKey:@"locationCategory"] objectForKey:@"type"] isEqualToNumber:@1]){
            [listImage addObject:[[aDic objectForKey:@"locationCategory"] objectForKey:@"imageUrl"]];
        }
    }
    
    if(listImage.count > 0)
        obj.AnhCategory = [listImage objectAtIndex:0];
    
    //NSLog(@"dis = %@",obj.Distance);
    
//    NSLog(@"--------------------------");
//    NSLog(@"Dia chi: ---> %@",obj.DiaChi);
//    NSLog(@"Ten dia diem - %@ - ",obj.TenDiaDiem);
//    NSLog(@"introduction: - %@ ",obj.GioiThieu);
//    NSLog(@"descriptio: - %@",obj.Description);
//    NSLog(@"--------------------------");
    return obj;
}

-(NVCity*)_parserObjectCity:(NSDictionary *) dic{
    NVCity * obj = [[NVCity alloc] init];
    obj.idCity = [dic objectForKey:@"id"];
    obj.nameCity  = [dic objectForKey:@"displayName"]?[[dic objectForKey:@"displayName"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    obj.linkImage = [dic objectForKey:@"imageUrl"]? [[dic objectForKey:@"imageUrl"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    return obj;
}

- (NSArray*) _loadFirst10Location:(NSArray*) listLocations{
    if([listLocations count] > 10){
        NSMutableArray * arr = [[NSMutableArray alloc] init];
        for(int i = 0 ; i< 10; i++){
            [arr addObject:[listLocations objectAtIndex:i]];
        }
        return [arr copy];
    }
    
    return listLocations;
}

@end
