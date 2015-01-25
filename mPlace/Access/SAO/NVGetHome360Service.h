//
//  NVGetHome360Service.h
//  mPlace
//
//  Created by hoanhnv on 19/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^failCompletion)(NSError*err);
typedef void(^completion)(id dataResponse);
@interface NVGetHome360Service : NSObject

-(void)getAnhDoatGiai:(NSString*)page_number withPageSize:(NSString*)pageSize
           andSuccess:(completion)succes andFailure:(failCompletion)failure;
-(void)getYTuongDoatGiai:(NSString*)page_number withPageSize:(NSString*)pageSize
              andSuccess:(completion)succes andFailure:(failCompletion)failure;
-(void)getRandomImage:(NSString*)page_number withPageSize:(NSString*)pageSize
           andSuccess:(completion)succes andFailure:(failCompletion)failure;

-(void)getRule:(completion)succes
          andFailure:(failCompletion)failure;

+ (void) getListTraficCategory:(NSInteger) pageNumber andSuccess:(completion) succes andFail:(failCompletion) failure;

+ (void) posListComment:(NSDictionary*) params andComple:(completion) comple andfail:(failCompletion) fauil;

@end
