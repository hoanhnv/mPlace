//
//  NVGetCharging.h
//  mPlace
//
//  Created by hehe on 12/9/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVGetCharging : NSObject{

    NSDictionary * param;
}

- (void)getPayService:(void(^)(BOOL suc))sucBlock
              andFail:(void(^)(NSError *error))failBlock;
- (void)getCancelService:(void(^)(BOOL suc))sucBlock
                 andFail:(void(^)(NSError *error))failBlock;
- (void)getAccount:(void(^)(BOOL suc))sucBlock
           andFail:(void(^)(NSError *error))failBlock;
@end
