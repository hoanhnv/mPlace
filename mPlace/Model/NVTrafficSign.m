//
//  NVTrafficSign.m
//  mPlace
//
//  Created by MAC on 1/22/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVTrafficSign.h"

@implementation NVTrafficSign


+(NVTrafficSign *)initWithFrom:(NSDictionary *)dic {
    
    NVTrafficSign *trafficSign = [[NVTrafficSign alloc] init];
    trafficSign.traficSingId  = ![Ultility stringNullOrEmpty:[dic valueForKey:@"id"]]?[dic valueForKey:@"id"]:@"";
    trafficSign.disPlayNameTrafic = ![Ultility stringNullOrEmpty:[dic valueForKey:@"display_name"]]?[dic valueForKey:@"display_name"]:@"";
    trafficSign.disPlayNameAscii = ![Ultility stringNullOrEmpty:[dic valueForKey:@"display_name_ascii"]]?[dic valueForKey:@"display_name_ascii"]:@"";
    trafficSign.descriptionTrafic = ![Ultility stringNullOrEmpty:[dic valueForKey:@"description"]]?[dic valueForKey:@"description"]:@"";
    trafficSign.trafficCategoryId = ![Ultility stringNullOrEmpty:[dic valueForKey:@"traffic_category_id"]]?[dic valueForKey:@"traffic_category_id"]:@"";
    trafficSign.traffiSubcategory = ![Ultility stringNullOrEmpty:[dic valueForKey:@"traffic_subcategory_id"]]?[dic valueForKey:@"traffic_subcategory_id"]:@"";
    trafficSign.type = ![Ultility stringNullOrEmpty:[dic valueForKey:@"type"]]?[dic valueForKey:@"type"]:@"";
    trafficSign.status = ![Ultility stringNullOrEmpty:[dic valueForKey:@"status"]]?[dic valueForKey:@"status"]:@"";
    trafficSign.createDate = ![Ultility stringNullOrEmpty:[dic valueForKey:@"create_date"]]?[dic valueForKey:@"create_date"]:@"";
    trafficSign.warningCode = ![Ultility stringNullOrEmpty:[dic valueForKey:@"warning_code"]]?[dic valueForKey:@"warning_code"]:@"";
    trafficSign.viewCount = ![Ultility stringNullOrEmpty:[dic valueForKey:@"view_count"]]?[dic valueForKey:@"view_count"]:@"";
    trafficSign.likeCount = ![Ultility stringNullOrEmpty:[dic valueForKey:@"like_count"]]?[dic valueForKey:@"like_count"]:@"";
    
    trafficSign.urlIcon = ![Ultility stringNullOrEmpty:[dic valueForKey:@"url_icon"]]?[dic valueForKey:@"url_icon"]:@"";
    trafficSign.urlImage = ![Ultility stringNullOrEmpty:[dic valueForKey:@"url_image"]]?[dic valueForKey:@"url_image"]:@"";
    trafficSign.modifyDate = ![Ultility stringNullOrEmpty:[dic valueForKey:@"modify_date"]]?[dic valueForKey:@"modify_date"]:@"";
    trafficSign.createUserId = ![Ultility stringNullOrEmpty:[dic valueForKey:@"create_user_id"]]?[dic valueForKey:@"create_user_id"]:@"";
    trafficSign.modifyUserId = ![Ultility stringNullOrEmpty:[dic valueForKey:@"modify_user_id"]]?[dic valueForKey:@"modify_user_id"]:@"";
    
    return trafficSign;
}

- (void) updateTraficSing:(NSDictionary*) dic andTradic:(NVTrafficSign*) trafficSign {
    trafficSign.disPlayNameTrafic = ![Ultility stringNullOrEmpty:[dic valueForKey:@"display_name"]]?[dic valueForKey:@"display_name"]:@"";
    trafficSign.disPlayNameAscii = ![Ultility stringNullOrEmpty:[dic valueForKey:@"display_name_ascii"]]?[dic valueForKey:@"display_name_ascii"]:@"";
    trafficSign.descriptionTrafic = ![Ultility stringNullOrEmpty:[dic valueForKey:@"description"]]?[dic valueForKey:@"description"]:@"";
    trafficSign.trafficCategoryId = ![Ultility stringNullOrEmpty:[dic valueForKey:@"traffic_category_id"]]?[dic valueForKey:@"traffic_category_id"]:@"";
    trafficSign.traffiSubcategory = ![Ultility stringNullOrEmpty:[dic valueForKey:@"traffic_subcategory_id"]]?[dic valueForKey:@"traffic_subcategory_id"]:@"";
    trafficSign.type = ![Ultility stringNullOrEmpty:[dic valueForKey:@"type"]]?[dic valueForKey:@"type"]:@"";
    trafficSign.status = ![Ultility stringNullOrEmpty:[dic valueForKey:@"status"]]?[dic valueForKey:@"status"]:@"";
    trafficSign.createDate = ![Ultility stringNullOrEmpty:[dic valueForKey:@"create_date"]]?[dic valueForKey:@"create_date"]:@"";
    trafficSign.warningCode = ![Ultility stringNullOrEmpty:[dic valueForKey:@"warning_code"]]?[dic valueForKey:@"warning_code"]:@"";
    trafficSign.viewCount = ![Ultility stringNullOrEmpty:[dic valueForKey:@"view_count"]]?[dic valueForKey:@"view_count"]:@"";
    trafficSign.likeCount = ![Ultility stringNullOrEmpty:[dic valueForKey:@"like_count"]]?[dic valueForKey:@"like_count"]:@"";
    
    trafficSign.urlIcon = ![Ultility stringNullOrEmpty:[dic valueForKey:@"url_icon"]]?[dic valueForKey:@"url_icon"]:@"";
    trafficSign.urlImage = ![Ultility stringNullOrEmpty:[dic valueForKey:@"url_image"]]?[dic valueForKey:@"url_image"]:@"";
    trafficSign.modifyDate = ![Ultility stringNullOrEmpty:[dic valueForKey:@"modify_date"]]?[dic valueForKey:@"modify_date"]:@"";
    trafficSign.createUserId = ![Ultility stringNullOrEmpty:[dic valueForKey:@"create_user_id"]]?[dic valueForKey:@"create_user_id"]:@"";
    trafficSign.modifyUserId = ![Ultility stringNullOrEmpty:[dic valueForKey:@"modify_user_id"]]?[dic valueForKey:@"modify_user_id"]:@"";
}

@end
