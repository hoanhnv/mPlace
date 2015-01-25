//
//  NV ImagesWarning.m
//  mPlace
//
//  Created by hoanhnv on 24/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVImagesWarning.h"

@implementation NVImagesWarning
+(NVImagesWarning *)initWithFrom:(NSDictionary *)dict{
    NVImagesWarning* tmp = nil;
    tmp = [[NVImagesWarning alloc]init];
    tmp.iID = [dict objectForKey:@"id"]?[[dict objectForKey:@"id"]intValue]:0;
    tmp.content = [dict objectForKey:@"content"]?[[dict objectForKey:@"content"]
                                                  stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    tmp.address  = [dict objectForKey:@"address"]?[[dict objectForKey:@"address"]
                                                   stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    tmp.point = [dict objectForKey:@"point"]?[[dict objectForKey:@"point"]intValue ]:0;
    tmp.created_at = [dict objectForKey:@"created_at"]?[dict objectForKey:@"created_at"]:@"";
    tmp.occurred_at  = [dict objectForKey:@"occurred_at"]?[dict objectForKey:@"occurred_at"]:@"" ;
    tmp.avatar_url = [dict objectForKey:@"avatar_url"]?[dict objectForKey:@"avatar_url"]:@"";
    tmp.subscriber_id = [dict objectForKey:@"subscriber_id"]?[dict objectForKey:@"subscriber_id"]:@"";
    tmp.images = [dict objectForKey:@"images"]?[dict objectForKey:@"images"]:nil;
    return tmp;
}

@end
