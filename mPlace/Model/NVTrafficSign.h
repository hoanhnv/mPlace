//
//  NVTrafficSign.h
//  mPlace
//
//  Created by MAC on 1/22/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVTrafficSign : NSObject

@property (nonatomic,strong) NSString* traficSingId;
@property (nonatomic,strong) NSString* disPlayNameTrafic;
@property (nonatomic,strong) NSString* disPlayNameAscii;
@property (nonatomic,strong) NSString* descriptionTrafic;
@property (nonatomic,strong) NSString* trafficCategoryId;
@property (nonatomic,strong) NSString* traffiSubcategory;
@property (nonatomic,strong) NSString* type;
@property (nonatomic,strong) NSString* status;
@property (nonatomic,strong) NSString* createDate;
@property (nonatomic,strong) NSString* warningCode;
@property (nonatomic,strong) NSString* viewCount;
@property (nonatomic,strong) NSString* likeCount;
@property (nonatomic,strong) NSString* urlIcon;
@property (nonatomic,strong) NSString* urlImage;
@property (nonatomic,strong) NSString* modifyDate;
@property (nonatomic,strong) NSString* createUserId;
@property (nonatomic,strong) NSString* modifyUserId;


+(NVTrafficSign *)initWithFrom:(NSDictionary *)dic;

- (void) updateTraficSing:(NSDictionary*) dic andTradic:(NVTrafficSign*) trafficSign;

@end
