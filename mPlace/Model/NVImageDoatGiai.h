//
//  NVImage360.h
//  mPlace
//
//  Created by hoanhnv on 19/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVImageDoatGiai : NSObject
@property(nonatomic, readwrite) int iID;
@property(nonatomic, readwrite) int point;
@property(nonatomic, strong) NSString *titleDoatGiai;
@property(nonatomic, readwrite) int status;
@property(nonatomic, strong) NSString *content;
@property(nonatomic, strong) NSString *address;
@property(nonatomic, strong) NSString *created_at;
@property(nonatomic, strong) NSString *occurred_at;
@property(nonatomic, readwrite) int avg_point;
@property(nonatomic, strong) NSString *avatar_url;

+(NVImageDoatGiai*)initWithFrom:(NSDictionary*)dict;
- (NSDictionary *)presentationObject;
@end
