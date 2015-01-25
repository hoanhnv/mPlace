//
//  NVTraficCategory.m
//  mPlace
//
//  Created by MAC on 1/20/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVTraficCategory.h"

@implementation NVTraficCategory

+(NVTraficCategory *)initWithFrom:(NSDictionary *)dic{
    NVTraficCategory* category = [[NVTraficCategory alloc]init];
    category.traficId = [dic valueForKey:@"id"];
    category.disPlayName = [dic valueForKey:@"display_name"];
    category.disPlayNameAscii = [dic valueForKey:@"display_name_ascii"];
    category.status  = [dic valueForKey:@"status"];
    category.categoryType = [dic valueForKey:@"category_type"];
    category.traficDescription = [dic valueForKey:@"description"];
    category.createDate      = [dic valueForKey:@"create_date"];
    category.modifyDate = [dic valueForKey:@"modifyDate"];
    category.modifyUserId    = [dic valueForKey:@"modify_user_id"];
    category.createUserId    = [dic valueForKey:@"create_user_id"];
    return category;
}

@end
