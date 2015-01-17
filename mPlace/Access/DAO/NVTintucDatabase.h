//
//  NVTintucDatabase.h
//  AppDuLich
//
//  Created by hehe on 7/18/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVTintucDatabase : NSObject

- (BOOL) insertTinTucIntoDatabase:(NSArray*) arrDiadiem;
- (BOOL) deleteAllDataInDatabase;
- (NSArray*) getAllTinTucInDatabase;
-(void)allTintucFromDBSuccessful:(void(^)(NSArray *listLocationObject))sucBlock
                         andFail:(void(^)(NSError *error))failBlock;
@end
