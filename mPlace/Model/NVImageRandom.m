//
//  NVImageRandom.m
//  mPlace
//
//  Created by hoanhnv on 19/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVImageRandom.h"

@implementation NVImageRandom

+(NVImageRandom *)initWithFrom:(NSDictionary *)dict{
    NVImageRandom* tmp = nil;
    tmp = [[NVImageRandom alloc]init];
    tmp.iID = [dict objectForKey:@"id"]?[[dict objectForKey:@"id"]intValue]:0;
    tmp.content = [dict objectForKey:@"content"]?[[dict objectForKey:@"content"]
                                                  stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    tmp.address  = [dict objectForKey:@"address"]?[[dict objectForKey:@"address"]
                                                   stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    tmp.point = [dict objectForKey:@"point"]?[[dict objectForKey:@"point"]intValue ]:0;
    tmp.created_at = [dict objectForKey:@"created_at"]?[dict objectForKey:@"created_at"]:@"";
    tmp.occurred_at  = [dict objectForKey:@"occurred_at"]?[dict objectForKey:@"occurred_at"]:@"" ;
    tmp.avatar_url = [dict objectForKey:@"avatar_url"]?[dict objectForKey:@"avatar_url"]:@"";
    return tmp;
}

-(NSString *)getUrlImage{
    return [NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,self.avatar_url];
}

@end
