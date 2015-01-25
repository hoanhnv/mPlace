//
//  NVTrafficSubCategory.m
//  mPlace
//
//  Created by hoanhnv on 24/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVTrafficSubCategory.h"

@implementation NVTrafficSubCategory
@synthesize modifyDate,subcategory_type;
+ (NVTrafficSubCategory *)initWithFrom:(NSDictionary *)dic{
    NVTrafficSubCategory* scategory = [[NVTrafficSubCategory alloc]init];
    scategory.traficId = [dic valueForKey:@"id"];
    scategory.disPlayName = [dic valueForKey:@"display_name"];
    scategory.disPlayNameAscii = [dic valueForKey:@"display_name_ascii"];
    scategory.status  = [dic valueForKey:@"status"];
    scategory.subcategory_type = [dic valueForKey:@"subcategory_type"];
    scategory.traficDescription = [dic valueForKey:@"description"];
    scategory.createDate      = [dic valueForKey:@"create_date"];
    scategory.modifyDate = [dic valueForKey:@"modify_date"];
    scategory.modifyUserId    = [dic valueForKey:@"modify_user_id"];
    scategory.createUserId    = [dic valueForKey:@"create_user_id"];
    return scategory;
}
@end
