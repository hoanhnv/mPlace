//
//  NVHome360BO.m
//  mPlace
//
//  Created by hoanhnv on 19/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVHome360BO.h"


@implementation NVHome360BO{
    NVGetHome360Service *service;
}
-(void)getRandomImage:(completion)succes andFailure:(failCompletion)failure{
    service = [[NVGetHome360Service alloc]init];
    [service getRandomImage:nil withPageSize:nil andSuccess:succes andFailure:failure];
}
-(void)getAnhDoatGiai:(completion)succes andFailure:(failCompletion)failure{
    service = [[NVGetHome360Service alloc]init];
    [service getAnhDoatGiai:nil withPageSize:nil andSuccess:succes andFailure:failure];
}
-(void)getYTuongDoatGiai:(completion)succes andFailure:(failCompletion)failure{
    service = [[NVGetHome360Service alloc]init];
    [service getYTuongDoatGiai:nil withPageSize:nil andSuccess:succes andFailure:failure];
}
@end
