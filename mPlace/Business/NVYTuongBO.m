//
//  NVYTuongBO.m
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVYTuongBO.h"
#import "NVGetYTuongService.h"
@implementation NVYTuongBO
-(void)getAllYTuong:(int)type withPageNumber:(int)page_number withMonth:(int)month withYear:(int)year
         andSuccess:(completion)succes andFailure:(failCompletion)failure{
    NVGetYTuongService *service = [[NVGetYTuongService alloc]init];
    [service getAllYTuong:type withPageNumber:page_number withPageSize:20 withMonth:month
                 withYear:year andSuccess:succes andFailure:failure];
}
-(void)getYtuongById:(int)ytuongId andSuccess:(completion)succes
          andFailure:(failCompletion)failure{
    NVGetYTuongService *service = [[NVGetYTuongService alloc]init];
    [service getYtuongById:ytuongId andSuccess:succes andFailure:failure];
}

@end
