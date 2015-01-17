//
//  NVImage.h
//  mPlace
//
//  Created by hehe on 9/30/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVImage : NSObject


@property(nonatomic, strong) NSString * authorCapture;
@property(nonatomic, strong) NSString * createDate;
@property(nonatomic, strong) NSString * createUserId;
@property(nonatomic, strong) NSString * description;

@property(nonatomic, strong) NSNumber * fileSize;
@property(nonatomic, strong) NSString * format;
@property(nonatomic, strong) NSNumber * height;
@property(nonatomic, strong) NSString * idImage;

@property(nonatomic, strong) NSString * imageSizeType;
@property(nonatomic, strong) NSString * imageType;
@property(nonatomic, strong) NSString * location;
@property(nonatomic, strong) NSString * locationStream;

@property(nonatomic, strong) NSString * orientation;
@property(nonatomic, strong) NSString * path;
@property(nonatomic, strong) NSNumber * status;
@property(nonatomic, strong) NSString * thumbURL;

@property(nonatomic, strong) NSString * timeCapture;
@property(nonatomic, strong) NSString * title;
@property(nonatomic, strong) NSString * url;
@property(nonatomic, strong) NSNumber * width;

@end
