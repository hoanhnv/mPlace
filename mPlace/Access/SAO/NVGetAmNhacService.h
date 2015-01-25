//
//  NVGetAmNhacService.h
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVMusicCurent.h"

typedef void(^failCompletion)(NSError*err);
typedef void(^completion2Param)(id dataResponse);

@interface NVGetAmNhacService : NSObject


+ (void) getListMusic:(NSInteger)pageNumber andCompleSucces:(completion)success andFauil:(failCompletion)fail;

+ (void) getMusicDetail:(NVMusicCurent*) musicObject  andCompleSucces:(completion) success andFauil:(failCompletion) fail;


@end
