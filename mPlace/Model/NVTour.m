//
//  NVTour.m
//  mPlace
//
//  Created by hoanhnv on 10/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVTour.h"

@implementation NVTour

+(NVTour *)initWithFrom:(NSDictionary *)dic{
    NVTour* category = [[NVTour alloc]init];
    category.tourId = [[dic valueForKey:@"id"] integerValue];
    
    category.codeName = ![Ultility stringNullOrEmpty:[dic valueForKey:@"code_name"]]?[dic valueForKey:@"code_name"]:@"";
    category.disPlayName = ![Ultility stringNullOrEmpty:[dic valueForKey:@"display_name"]]?[dic valueForKey:@"display_name"]:@"";
    category.original_title  = ![Ultility stringNullOrEmpty:[dic valueForKey:@"original_title"]]?[dic valueForKey:@"original_title"]:@"";
    category.tags = ![Ultility stringNullOrEmpty:[dic valueForKey:@"tags"]]?[dic valueForKey:@"tags"]:@"";
    category.actors = ![Ultility stringNullOrEmpty:[dic valueForKey:@"actors"]]?[dic valueForKey:@"actors"]:@"";
    category.director      = ![Ultility stringNullOrEmpty:[dic valueForKey:@"director"]]?[dic valueForKey:@"director"]:@"";
    category.release_date    = ![Ultility stringNullOrEmpty:[dic valueForKey:@"release_date"]]?[dic valueForKey:@"release_date"]:@"";
    category.short_description    = ![Ultility stringNullOrEmpty:[dic valueForKey:@"short_description"]]?[dic valueForKey:@"short_description"]:@"";
    category.descriptionTour    = ![Ultility stringNullOrEmpty:[dic valueForKey:@"description"]]?[dic valueForKey:@"description"]:@"";
    category.contentTour    = ![Ultility stringNullOrEmpty:[dic valueForKey:@"content"]]?[dic valueForKey:@"content"]:@"";
    return category;
} 

@end
