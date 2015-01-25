//
//  VodAsset.m
//  fdgdgdgdg
//
//  Created by Mydv on 1/19/15.
//  Copyright (c) 2015 Mydv. All rights reserved.
//

#import "NVVodImage.h"

@implementation NVVodImage
@synthesize picture;

+(NVVodImage *)initWithFrom:(NSDictionary *)dic{
    NVVodImage* vodImage = nil;
    vodImage = [[NVVodImage alloc]init];
    vodImage.picture = [dic objectForKey:@"picture"]?[[dic objectForKey:@"picture"]
                                                                stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    return vodImage;
}
@end
