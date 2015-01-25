//
//  NVTour.h
//  mPlace
//
//  Created by hoanhnv on 10/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVTour : NSObject

@property (nonatomic,assign) NSInteger tourId;
@property (nonatomic,strong) NSString *codeName;
@property (nonatomic,strong) NSString *disPlayName;
@property (nonatomic,strong) NSString *original_title;
@property (nonatomic,strong) NSString *tags;
@property (nonatomic,strong) NSString *actors;
@property (nonatomic,strong) NSString *director;
@property (nonatomic,strong) NSString *release_date;
@property (nonatomic,strong) NSString *short_description;
@property (nonatomic,strong) NSString *descriptionTour;
@property (nonatomic,strong) NSString *contentTour;


+(NVTour *)initWithFrom:(NSDictionary *)dic;


@end
