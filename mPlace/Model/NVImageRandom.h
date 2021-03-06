//
//  NVImageRandom.h
//  mPlace
//
//  Created by hoanhnv on 19/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVImageRandom : NSObject
@property(nonatomic, readwrite) int iID;
@property(nonatomic, readwrite) int subscriber_id;
@property(nonatomic, readwrite) int point;
@property (nonatomic, strong) NSString *latAddress;
@property (nonatomic, strong) NSString *longAddress;
@property (nonatomic, strong) NSString* number_contact;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, readwrite) int status;
@property(nonatomic, strong) NSString *content;
@property(nonatomic, strong) NSString *address;
@property(nonatomic, strong) NSString *created_at;
@property(nonatomic, strong) NSString *occurred_at;
@property(nonatomic, strong) NSString *avatar_url;

+(NVImageRandom *)initWithFrom:(NSDictionary *)dict;
-(NSString*)getUrlImage;
@end
