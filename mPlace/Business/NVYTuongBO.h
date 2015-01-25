//
//  NVYTuongBO.h
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVYTuongBO : NSObject
-(void)getAllYTuong:(int)type withPageNumber:(int)page_number withMonth:(int)month
           withYear:(int)year andSuccess:(completion)succes andFailure:(failCompletion)failure;
-(void)getYtuongById:(int)ytuongId andSuccess:(completion)succes
          andFailure:(failCompletion)failure;
@end
