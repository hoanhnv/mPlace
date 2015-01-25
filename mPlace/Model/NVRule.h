//
//  NVRule.h
//  mPlace
//
//  Created by hoanhnv on 23/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVRule : NSObject
@property (nonatomic, readwrite) int iID;
@property (nonatomic, strong) NSString *display_name;
@property (nonatomic, strong) NSString *display_name_ascii;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *create_date;
@end
