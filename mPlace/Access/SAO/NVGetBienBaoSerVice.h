//
//  NVGetBienBaoSerVice.h
//  mPlace
//
//  Created by MAC on 1/22/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVTrafficSign.h"

typedef void(^failCompletion)(NSError*err);
typedef void(^completion2Param)(id dataResponse);
@interface NVGetBienBaoSerVice : NSObject
+ (void) getListBienBao:(NSInteger) pageNumber andType:(NSInteger) type  andComple:(completion)success andFauil:(failCompletion)fail;

+ (void) getTraficSingDetail:(NVTrafficSign*) traficSIng  andComple:(completion)success andFauil:(failCompletion)fail;
+(void)getDanhmucBienBao:(completion)success andFailure:(failCompletion)failure;
@end
