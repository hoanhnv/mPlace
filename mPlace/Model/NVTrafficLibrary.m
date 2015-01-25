//
//  TrafficLibrary.m
//  fdgdgdgdg
//
//  Created by Mydv on 1/19/15.
//  Copyright (c) 2015 Mydv. All rights reserved.
//

#import "NVTrafficLibrary.h"

@implementation NVTrafficLibrary
@synthesize iID;
@synthesize display_name;
@synthesize display_name_ascii;
@synthesize content;
@synthesize view_count;
@synthesize like_count;
@synthesize comment_count;
@synthesize create_date;
@synthesize create_user_id;
@synthesize modify_date;
@synthesize modify_user_id;
@synthesize release_date;
@synthesize traffic_category_id;
@synthesize traffic_subcategory_id;
@synthesize status;

+(NVTrafficLibrary *)initWithFrom:(NSDictionary *)dic{
    NVTrafficLibrary* trafficLibrary = nil;
    trafficLibrary = [[NVTrafficLibrary alloc]init];
    trafficLibrary.iID = [[dic objectForKey:@"id"] intValue];
    trafficLibrary.display_name = [dic objectForKey:@"display_name"]?[[dic objectForKey:@"display_name"]
                                                                      stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    trafficLibrary.display_name_ascii = [dic objectForKey:@"display_name_ascii"]?[[dic objectForKey:@"display_name_ascii"]
                                                                      stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    
    trafficLibrary.content = [dic objectForKey:@"content"]?[[dic objectForKey:@"content"]
                                                            stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    trafficLibrary.view_count = [dic objectForKey:@"view_count"]?[[dic objectForKey:@"view_count"]
                                                                                  stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    trafficLibrary.like_count = [dic objectForKey:@"like_count"]?[[dic objectForKey:@"like_count"]
                                                                                  stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    trafficLibrary.comment_count = [dic objectForKey:@"comment_count"]?[[dic objectForKey:@"comment_count"]
                                                                        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    trafficLibrary.create_date = [dic objectForKey:@"create_date"]?[[dic objectForKey:@"create_date"]
                                                                        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    trafficLibrary.create_user_id = [dic objectForKey:@"create_user_id"]?[[dic objectForKey:@"create_user_id"]
                                                                        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    trafficLibrary.modify_date = [dic objectForKey:@"modify_date"]?[[dic objectForKey:@"modify_date"]
                                                                        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    trafficLibrary.modify_user_id = [dic objectForKey:@"modify_user_id"]?[[dic objectForKey:@"modify_user_id"]
                                                                          stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    trafficLibrary.release_date = [dic objectForKey:@"release_date"]?[[dic objectForKey:@"release_date"]
                                                                          stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    trafficLibrary.traffic_category_id = [dic objectForKey:@"traffic_category_id"]?[[dic objectForKey:@"traffic_category_id"]
                                                                          stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    trafficLibrary.traffic_subcategory_id = [dic objectForKey:@"traffic_subcategory_id"]?[[dic objectForKey:@"traffic_subcategory_id"]
                                                                          stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    trafficLibrary.status = [dic objectForKey:@"status"]?[[dic objectForKey:@"status"]
                                                                          stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    
    return trafficLibrary;
}
@end
