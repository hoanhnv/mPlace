//
//  NVImage360.m
//  mPlace
//
//  Created by hoanhnv on 19/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVImageDoatGiai.h"

@implementation NVImageDoatGiai
@synthesize iID;
@synthesize content;
@synthesize address;
@synthesize avatar_url;
@synthesize avg_point;
@synthesize created_at;
@synthesize occurred_at;

-(NSDictionary *)presentationObject{
//    return [NSDictionary dictionaryWithObjectsAndKeys:
//            self.url, @"url",
//            self.id_source, @"id_source",
//            self.priority, @"priority",
//            self.channel, @"channel",
//            nil];
    return nil;

}
+(NVImageDoatGiai *)initWithFrom:(NSDictionary *)dict{
    NVImageDoatGiai* tmp = nil;
    tmp = [[NVImageDoatGiai alloc]init];
    tmp.titleDoatGiai = [dict objectForKey:@"title"];
    tmp.iID = [dict objectForKey:@"id"]?[[dict objectForKey:@"id"]intValue]:0;
    tmp.content = [dict objectForKey:@"content"]?[[dict objectForKey:@"content"]
                                                           stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    tmp.address  = [dict objectForKey:@"address"]?[[dict objectForKey:@"address"]
                                                   stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    tmp.avg_point = [dict objectForKey:@"avg_point"]?[[dict objectForKey:@"avg_point"]intValue ]:0;
    tmp.created_at = [dict objectForKey:@"created_at"]?[dict objectForKey:@"created_at"]:@"";
    tmp.occurred_at  = [dict objectForKey:@"occurred_at"]?[dict objectForKey:@"occurred_at"]:@"" ;
    tmp.avatar_url = [dict objectForKey:@"avatar_url"]?[dict objectForKey:@"avatar_url"]:@"";
    return tmp;
}

@end
