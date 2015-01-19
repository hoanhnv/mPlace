//
//  NVGetHome360Service.h
//  mPlace
//
//  Created by hoanhnv on 19/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^failCompletion)(NSError*err);
typedef void(^compeletion)(id dataResponse);

@interface NVGetHome360Service : NSObject

-(void)getAnhDoatGiai:(NSString*)page_number withPageSize:(NSString*)pageSize
           andSuccess:(compeletion)succes andFail:(failCompletion)fail;
-(void)getYTuongDoatGiai:(NSString*)page_number withPageSize:(NSString*)pageSize
              andSuccess:(compeletion)succes andFail:(failCompletion)fail;
-(void)getRandomImage:(NSString*)page_number withPageSize:(NSString*)pageSize
           andSuccess:(compeletion)succes andFail:(failCompletion)fail;

@end
