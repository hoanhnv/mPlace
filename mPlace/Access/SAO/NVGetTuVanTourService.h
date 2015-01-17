//
//  NVGetTuVanTourService.h
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVGetTuVanTourService : NSObject
-(void)allTours:(void(^)(id listTour))completion:(void(^)(NSError *error))withFailed;
@end
