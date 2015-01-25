//
//  VodImage.h
//  fdgdgdgdg
//
//  Created by Mydv on 1/19/15.
//  Copyright (c) 2015 Mydv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVVodAsset : NSObject

@property (nonatomic, readwrite) int iID;
@property (nonatomic, strong) NSString *code_name;
@property (nonatomic, strong) NSString *display_name;
@property (nonatomic, strong) NSString *display_name_ascii;
@property (nonatomic, strong) NSString *original_title;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, strong) NSString *actors;
@property (nonatomic, strong) NSString *director;
@property (nonatomic, strong) NSString *release_date;
@property (nonatomic, strong) NSString *imdb_url;
@property (nonatomic, strong) NSString *imdb_rating;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *short_description;
@property (nonatomic, strong) NSString *view_count;
@property (nonatomic, strong) NSString *like_count;
@property (nonatomic, strong) NSString *dislike_count;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *rating_count;
@property (nonatomic, strong) NSString *comment_count;
@property (nonatomic, strong) NSString *favorite_count;
@property (nonatomic, strong) NSString *is_series;
@property (nonatomic, strong) NSString *episode_count;
@property (nonatomic, strong) NSString *duration;
@property (nonatomic, strong) NSString *is_multibitrate;
@property (nonatomic, strong) NSString *vod_stream_count;
@property (nonatomic, strong) NSString *is_free;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *price_download;
@property (nonatomic, strong) NSString *price_gift;
@property (nonatomic, strong) NSString *image_count;
@property (nonatomic, strong) NSString *expiry_date;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *create_date;
@property (nonatomic, strong) NSString *modify_date;
@property (nonatomic, strong) NSString *create_user_id;
@property (nonatomic, strong) NSString *modify_user_id;
@property (nonatomic, strong) NSString *honor;
@property (nonatomic, strong) NSString *min_app_version_platform_id;
@property (nonatomic, strong) NSString *content_provider_id;
@property (nonatomic, strong) NSString *using_duration;
@property (nonatomic, strong) NSString *approve_date;

+(NVVodAsset *)initWithFrom:(NSDictionary *)dic;
@end
