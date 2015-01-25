//
//  NV ImagesWarning.h
//  mPlace
//
//  Created by hoanhnv on 24/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVImagesWarning : NSObject

@property(nonatomic, readwrite) int iID;
@property(nonatomic, readwrite) int point;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, readwrite) int status;
@property(nonatomic, strong) NSString *content;
@property(nonatomic, strong) NSString *address;
@property(nonatomic, strong) NSString *created_at;
@property(nonatomic, strong) NSString *occurred_at;
@property(nonatomic, strong) NSString* number_contact;
@property(nonatomic, strong) NSString *avatar_url;
@property (nonatomic, strong) NSString *latAddress;
@property (nonatomic, strong) NSString *longAddress;
@property(nonatomic, strong) NSString *subscriber_id;
@property(nonatomic, strong) NSArray *images;

+(NVImagesWarning*)initWithFrom:(NSDictionary*)dict;

@end
