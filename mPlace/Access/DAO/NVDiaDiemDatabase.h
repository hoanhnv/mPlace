//
//  NVDiaDiemDatabase.h
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabaseQueue.h"
#import "FMDatabase.h"


@interface NVDiaDiemDatabase : NSObject

- (BOOL) insertDiaDiemIntoDatabase:(NSArray*) arrDiadiem;
- (BOOL) deleteAllDataInDatabase;
- (NSArray*) getAllDiaDiemInDatabase;
//- (BOOL) insertDiaDiemIntoDatabase:(NSArray*) arrDiadiem;
-(void)allDiaDiemFromDBSuccessful:(void(^)(NSArray *listLocationObject))sucBlock
                          andFail:(void(^)(NSError *error))failBlock;
- (void)allBookmarkFromDB:(void(^)(NSArray * listLocationBookMark))sucBlock andFail:(void(^)(NSError * error))failBlock;
- (BOOL)insertBookMark:(NVDiaDiem *)nvDiadiem;
- (BOOL)DeleteBookMarkWithDiaDiem:(NVDiaDiem *)nvDiadiem;
- (BOOL)checkBookmark:(NVDiaDiem*) nvDiadiem;
- (NVDiaDiem*) getDiaDiemFromDBWithID:(NSNumber*)idDiaDiem;
@end
