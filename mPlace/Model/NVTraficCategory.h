//
//  NVTraficCategory.h
//  mPlace
//
//  Created by MAC on 1/20/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVTraficCategory : NSObject

@property (nonatomic,strong) NSString *traficId;
@property (nonatomic,strong) NSString *disPlayName;
@property (nonatomic,strong) NSString *disPlayNameAscii;
@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSString *categoryType;
@property (nonatomic,strong) NSString *traficDescription;
@property (nonatomic,strong) NSString *createDate;
@property (nonatomic,strong) NSString *modifyUserId;
@property (nonatomic,strong) NSString *modifyDate;
@property (nonatomic,strong) NSString *createUserId;

+ (NVTraficCategory *)initWithFrom:(NSDictionary *)dic;


@end
