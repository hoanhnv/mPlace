//
//  IdeasAwardModel.h
//  fdgdgdgdg
//
//  Created by Mydv on 1/19/15.
//  Copyright (c) 2015 Mydv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVIdeasAward : NSObject

@property (nonatomic, readwrite) int iID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *title_ascii;
@property (nonatomic, strong) NSString *traffic_category_id;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *number_contact;
@property (nonatomic, strong) NSString *point;
@property (nonatomic, strong) NSString *subscriber_id;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *create_date;
@property (nonatomic, strong) NSString *approve_date;
@property (nonatomic, strong) NSString *approve_user_id;
@property (nonatomic, strong) NSString *modify_user_id;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *view_count;

+(NVIdeasAward *)initWithFrom:(NSDictionary *)dic;

@end
