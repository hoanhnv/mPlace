//
//  NVTuVanTourBO.h
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVTour.h"
@interface NVTuVanTourBO : NSObject

+(void)allTours:(void(^)(id listTour))completion withFailed:(void(^)(NSError *error))failed;

+(NVTour*)detailTour:(int)tourId;

@end
