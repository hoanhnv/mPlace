//
//  NVRule.m
//  mPlace
//
//  Created by hoanhnv on 23/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVRule.h"

@implementation NVRule
@synthesize iID;
@synthesize display_name;
@synthesize display_name_ascii;
@synthesize content;
@synthesize create_date;
@synthesize status;


+(NVRule *)initWithFrom:(NSDictionary *)dic{
    NVRule *ruleObj = [[NVRule alloc]init];
    return ruleObj;
}
@end
