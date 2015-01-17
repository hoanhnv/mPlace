//
//  NVTintucDatabase.m
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import "NVTintucDatabase.h"
#import "NVNewsObject.h"
#import "FMDatabaseQueue.h"
#import "FMDatabase.h"
@implementation NVTintucDatabase

- (id)init{
    self = [super init];
    if(self){
        
    }
    
    return self;
}

- (BOOL) insertTinTucIntoDatabase:(NSArray*) arrDiadiem{
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[Ultility getDataBasePath]];
    [queue inDatabase:^(FMDatabase *db) {
        for(NVNewsObject * obj in arrDiadiem){
            [db executeUpdate:@"INSERT INTO TinTuc VALUES (?,?,?,?,?,?)", obj.IDTintuc,obj.title,obj.content,obj.linkImage,obj.IDTintucServer,obj.linkChiTiet];
        }
        NSLog(@"insert tin tuc xong");
    }];
    
    return YES;
}

- (BOOL) deleteAllDataInDatabase{
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[Ultility getDataBasePath]];
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"DELETE FROM Tintuc"];
    }];
    return YES;
}

-(void)allTintucFromDBSuccessful:(void(^)(NSArray *listLocationObject))sucBlock
                         andFail:(void(^)(NSError *error))failBlock{
    FMDatabase * db = [FMDatabase databaseWithPath:[Ultility getDataBasePath]];
    if (![db open]) {
        NSError * error;
        NSLog(@"db not open");
        failBlock(error);
        return;
    }
    
    FMResultSet *s = [db executeQuery:@"SELECT * FROM Tintuc"];
    NSMutableArray * array = [[NSMutableArray alloc] init];
    while ([s next]) {
        NVNewsObject * tintuc = [[NVNewsObject alloc] init];
        tintuc.IDTintuc = [NSNumber numberWithInt:[s intForColumnIndex:0] ];
        tintuc.title    = [s stringForColumnIndex:1];
        tintuc.content  = [s stringForColumnIndex:2];
        tintuc.linkImage = [s stringForColumnIndex:3];
        tintuc.IDTintucServer = [s stringForColumnIndex:4];
        tintuc.linkChiTiet = [s stringForColumnIndex:5];
        [array addObject:tintuc];
    }
    sucBlock([array copy]);
    
    [db close];
}

- (NSArray*) getAllTinTucInDatabase{
    
    return nil;
}

@end
