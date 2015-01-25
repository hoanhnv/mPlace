//
//  NVHome360BO.h
//  mPlace
//
//  Created by hoanhnv on 19/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVGetHome360Service.h"

@interface NVHome360BO : NSObject

-(void)getAnhDoatGiai:(completion)succes andFailure:(failCompletion)failure;
-(void)getYTuongDoatGiai:(completion)succes andFailure:(failCompletion)failure;
-(void)getRandomImage:(completion)succes andFailure:(failCompletion)failure;

@end
