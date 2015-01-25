//
//  NVGetTuVanTourService.h
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^failCompletion)(NSError*err);
typedef void(^completion)(id dataResponse);

@interface NVGetTuVanTourService : NSObject
+ (void) getListTour:(NSInteger) pageNumber andCompleSucces:(completion) success andFauil:(failCompletion) fail;

@end
