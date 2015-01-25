//
//  NVGetAnhCanhBaoService.h
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^failCompletion)(NSError*err);
typedef void(^completion)(id dataResponse);


@interface NVGetAnhCanhBaoService : NSObject


+ (void)getListImageWarning:(NSInteger) page_number withPageSize:(NSInteger) pageSize withMonth:(NSInteger) month withYear:(NSInteger) year
           andSuccess:(completion)succes andFailure:(failCompletion)failure;
+ (void) uploadAnhCanhBao:(NSMutableDictionary*) params andComple:(completion) comple andFailure:(failCompletion) failure ;
+ (void) anhCanhBaoChiTiet:(NSInteger)iID andComple:(completion) comple andFailure:(failCompletion) failure;
@end
