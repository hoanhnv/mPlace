//
//  NVGetChargingBusiness.m
//  mPlace
//
//  Created by hehe on 12/10/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVGetChargingBusiness.h"
#import "NVGetCharging.h"


@implementation NVGetChargingBusiness


+ (void)getPayService:(void(^)(BOOL suc))sucBlock
              andFail:(void(^)(NSError *error))failBlock{
    NVGetCharging * charging = [[NVGetCharging alloc] init];
    [charging getPayService:^(BOOL suc) {
        sucBlock(YES);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];

}
+ (void)getCancelService:(void(^)(BOOL suc))sucBlock
                 andFail:(void(^)(NSError *error))failBlock{
    NVGetCharging * charging = [[NVGetCharging alloc] init];
    [charging getCancelService:^(BOOL suc) {
        sucBlock(YES);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];

}
+ (void)getAccount:(void(^)(BOOL suc))sucBlock
           andFail:(void(^)(NSError *error))failBlock{
    NVGetCharging * charging = [[NVGetCharging alloc] init];
    [charging getAccount:^(BOOL suc) {
        sucBlock(YES);
    } andFail:^(NSError *error) {
        failBlock(error);
    }];
}

@end
