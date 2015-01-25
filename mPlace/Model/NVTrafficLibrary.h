//
//  TrafficLibrary.h
//  fdgdgdgdg
//
//  Created by Mydv on 1/19/15.
//  Copyright (c) 2015 Mydv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVTrafficLibrary : NSObject
@property (nonatomic, readwrite) int iID;
@property (nonatomic, strong) NSString *display_name;
@property (nonatomic, strong) NSString *display_name_ascii;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *view_count;
@property (nonatomic, strong) NSString *like_count;
@property (nonatomic, strong) NSString *comment_count;
@property (nonatomic, strong) NSString *create_date;
@property (nonatomic, strong) NSString *create_user_id;
@property (nonatomic, strong) NSString *modify_date;
@property (nonatomic, strong) NSString *modify_user_id;
@property (nonatomic, strong) NSString *release_date;
@property (nonatomic, strong) NSString *traffic_category_id;
@property (nonatomic, strong) NSString *traffic_subcategory_id;
@property (nonatomic, strong) NSString *status;

+(NVTrafficLibrary *)initWithFrom:(NSDictionary *)dic;

@end
