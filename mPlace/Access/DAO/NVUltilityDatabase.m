//
//  NVUltilityDatabase.m
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import "NVUltilityDatabase.h"
#import "FMDatabaseQueue.h"
#import "FMDatabase.h"

@implementation NVUltilityDatabase

+ (void)truncateDatabase{
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:[Ultility getDataBasePath]];
    [queue inDatabase:^(FMDatabase *db) {
        
        //db = [FMDatabase databaseWithPath:[Ultility getDataBasePath]];
        //if([db open]){
            [db executeUpdate:@"DELETE FROM TinTuc"];
            [db executeUpdate:@"DELETE FROM DiaDiem"];
        //}
        
        //[db close];
    }];
}

@end
