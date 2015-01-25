//
//  vodAsset.m
//  fdgdgdgdg
//
//  Created by Mydv on 1/19/15.
//  Copyright (c) 2015 Mydv. All rights reserved.
//

#import "NVVodAsset.h"

@implementation NVVodAsset

@synthesize iID;
@synthesize code_name;
@synthesize display_name;
@synthesize display_name_ascii;
@synthesize original_title;
@synthesize tags;
@synthesize actors;
@synthesize director;
@synthesize release_date;
@synthesize imdb_url;
@synthesize imdb_rating;
@synthesize short_description;
@synthesize view_count;
@synthesize like_count;
@synthesize dislike_count;
@synthesize rating;
@synthesize rating_count;
@synthesize comment_count;
@synthesize favorite_count;
@synthesize is_series;
@synthesize episode_count;
@synthesize duration;
@synthesize is_multibitrate;
@synthesize vod_stream_count;
@synthesize is_free;
@synthesize price;
@synthesize price_download;
@synthesize price_gift;
@synthesize image_count;
@synthesize expiry_date;
@synthesize status;
@synthesize create_date;
@synthesize modify_date;
@synthesize create_user_id;
@synthesize modify_user_id;
@synthesize honor;
@synthesize min_app_version_platform_id;
@synthesize content_provider_id;
@synthesize using_duration;
@synthesize approve_date;

+(NVVodAsset *)initWithFrom:(NSDictionary *)dic{
    NVVodAsset* vodAsset = nil;
    vodAsset = [[NVVodAsset alloc]init];
    vodAsset.iID = [[dic objectForKey:@"id"] intValue];
    vodAsset.code_name = [dic objectForKey:@"code_name"]?[[dic objectForKey:@"code_name"]
                                                          stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.display_name = [dic objectForKey:@"display_name"]?[[dic objectForKey:@"display_name"]
                                                          stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.display_name_ascii = [dic objectForKey:@"display_name_ascii"]?[[dic objectForKey:@"display_name_ascii"]
                                                          stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.original_title = [dic objectForKey:@"original_title"]?[[dic objectForKey:@"original_title"]
                                                          stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.tags = [dic objectForKey:@"tags"]?[[dic objectForKey:@"tags"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.actors = [dic objectForKey:@"actors"]?[[dic objectForKey:@"actors"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.director = [dic objectForKey:@"director"]?[[dic objectForKey:@"director"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.release_date = [dic objectForKey:@"release_date"]?[[dic objectForKey:@"release_date"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.imdb_url = [dic objectForKey:@"imdb_url"]?[[dic objectForKey:@"imdb_url"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.imdb_rating = [dic objectForKey:@"imdb_rating"]?[[dic objectForKey:@"imdb_rating"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.short_description = [dic objectForKey:@"short_description"]?[[dic objectForKey:@"short_description"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.description = [dic objectForKey:@"description"]?[[dic objectForKey:@"description"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.view_count = [dic objectForKey:@"view_count"]?[[dic objectForKey:@"view_count"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.like_count = [dic objectForKey:@"like_count"]?[[dic objectForKey:@"like_count"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.dislike_count = [dic objectForKey:@"dislike_count"]?[[dic objectForKey:@"dislike_count"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.rating = [dic objectForKey:@"rating"]?[[dic objectForKey:@"rating"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.rating_count = [dic objectForKey:@"rating_count"]?[[dic objectForKey:@"rating_count"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.comment_count = [dic objectForKey:@"comment_count"]?[[dic objectForKey:@"comment_count"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.comment_count = [dic objectForKey:@"comment_count"]?[[dic objectForKey:@"comment_count"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.is_series = [dic objectForKey:@"is_series"]?[[dic objectForKey:@"is_series"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.episode_count = [dic objectForKey:@"episode_count"]?[[dic objectForKey:@"episode_count"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.duration = [dic objectForKey:@"duration"]?[[dic objectForKey:@"duration"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.is_multibitrate = [dic objectForKey:@"is_multibitrate"]?[[dic objectForKey:@"is_multibitrate"]
                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    
    vodAsset.vod_stream_count = [dic objectForKey:@"vod_stream_count"]?[[dic objectForKey:@"vod_stream_count"]
                                                        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    
    vodAsset.is_free = [dic objectForKey:@"is_free"]?[[dic objectForKey:@"is_free"]
                                                        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.price = [dic objectForKey:@"price"]?[[dic objectForKey:@"price"]
                                                        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.price_download = [dic objectForKey:@"price_download"]?[[dic objectForKey:@"price_download"]
                                                        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.price_gift = [dic objectForKey:@"price_gift"]?[[dic objectForKey:@"price_gift"]
                                                            stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.image_count = [dic objectForKey:@"image_count"]?[[dic objectForKey:@"image_count"]                                                                                                                                                                                         stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.expiry_date = [dic objectForKey:@"expiry_date"]?[[dic objectForKey:@"expiry_date"]
                                                        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.status = [dic objectForKey:@"status"]?[[dic objectForKey:@"status"]
                                                        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.create_date = [dic objectForKey:@"create_date"]?[[dic objectForKey:@"create_date"]
                                                        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.modify_date = [dic objectForKey:@"modify_date"]?[[dic objectForKey:@"modify_date"]
                                                        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.create_user_id = [dic objectForKey:@"create_user_id"]?[[dic objectForKey:@"create_user_id"]
                                                        stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.modify_user_id = [dic objectForKey:@"modify_user_id"]?[[dic objectForKey:@"modify_user_id"]
                                                                    stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.honor = [dic objectForKey:@"honor"]?[[dic objectForKey:@"honor"]
                                                                    stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.min_app_version_platform_id = [dic objectForKey:@"min_app_version_platform_id"]?[[dic objectForKey:@"min_app_version_platform_id"]
                                                                                              stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.content_provider_id = [dic objectForKey:@"content_provider_id"]?[[dic objectForKey:@"content_provider_id"]
                                                                                              stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.using_duration = [dic objectForKey:@"using_duration"]?[[dic objectForKey:@"using_duration"]
                                                                    stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    vodAsset.approve_date = [dic objectForKey:@"approve_date"]?[[dic objectForKey:@"approve_date"]
                                                                    stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    return vodAsset;
}

@end
