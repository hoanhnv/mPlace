//
//  IdeasAwardModel.m
//  fdgdgdgdg
//
//  Created by Mydv on 1/19/15.
//  Copyright (c) 2015 Mydv. All rights reserved.
//

#import "NVIdeasAward.h"
#import "Ultility.h"


@implementation NVIdeasAward
@synthesize iID;
@synthesize title;
@synthesize title_ascii;
@synthesize traffic_category_id;
@synthesize content;
@synthesize name;
@synthesize number_contact;
@synthesize point;
@synthesize subscriber_id;
@synthesize status;
@synthesize create_date;
@synthesize approve_date;
@synthesize approve_user_id;
@synthesize modify_user_id;
@synthesize description;
@synthesize view_count;


+(NVIdeasAward *)initWithFrom:(NSDictionary *)dic {
    NVIdeasAward* ideasAward = nil;
    ideasAward = [[NVIdeasAward alloc]init];
    ideasAward.iID = [[dic objectForKey:@"id"] intValue];
    ideasAward.title =  ![Ultility stringNullOrEmpty:[dic objectForKey:@"title"]]?[dic objectForKey:@"title"]:@"";
    ideasAward.title_ascii = ![Ultility stringNullOrEmpty:[dic objectForKey:@"title_ascii"]]?[[dic objectForKey:@"title_ascii"]
                                                         stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    ideasAward.content = ![Ultility stringNullOrEmpty:[dic objectForKey:@"content"]]?[[dic objectForKey:@"content"]
                                                         stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    ideasAward.name = ![Ultility stringNullOrEmpty:[dic objectForKey:@"title_ascii"]]?[[dic objectForKey:@"title_ascii"]
                                                         stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    ideasAward.number_contact = ![Ultility stringNullOrEmpty:[dic objectForKey:@"number_contact"]]?[[dic objectForKey:@"number_contact"]
                                                         stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    ideasAward.point = ![Ultility stringNullOrEmpty:[dic objectForKey:@"point"]]?[[dic objectForKey:@"point"]
                                                               stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    ideasAward.subscriber_id = ![Ultility stringNullOrEmpty:[dic objectForKey:@"subscriber_id"]]?[[dic objectForKey:@"subscriber_id"]
                                                               stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    ideasAward.status = ![Ultility stringNullOrEmpty:[dic objectForKey:@"status"]]?[[dic objectForKey:@"status"]
                                                               stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    ideasAward.create_date = ![Ultility stringNullOrEmpty:[dic objectForKey:@"create_date"]]?[[dic objectForKey:@"create_date"]
                                                               stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    ideasAward.approve_date = ![Ultility stringNullOrEmpty:[dic objectForKey:@"approve_date"]]?[[dic objectForKey:@"approve_date"]
                                                               stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";    
    ideasAward.approve_user_id = ![Ultility stringNullOrEmpty:[dic objectForKey:@"approve_user_id"]]?[[dic objectForKey:@"approve_user_id"]
                                                           stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    ideasAward.modify_user_id = ![Ultility stringNullOrEmpty:[dic objectForKey:@"modify_user_id"]]?[[dic objectForKey:@"modify_user_id"]
                                                           stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    ideasAward.description = ![Ultility stringNullOrEmpty:[dic objectForKey:@"description"]]?[[dic objectForKey:@"description"]
                                                           stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    ideasAward.view_count = ![Ultility stringNullOrEmpty:[dic objectForKey:@"view_count"]]?[[dic objectForKey:@"view_count"]
                                                           stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";

    
    return ideasAward;
}

@end
