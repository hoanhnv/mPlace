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
    tmp.iID = [[dict objectForKey:@"id"]intValue];
    obj.TenDiaDiem    = [dic objectForKey:@"displayName"]?[[dic objectForKey:@"displayName"]
                                                           stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    obj.DiaChi  = [dic objectForKey:@"address"]?[[dic objectForKey:@"address"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    obj.Latitube = [dic objectForKey:@"latitude"]?[dic objectForKey:@"latitude"]:@"";
    obj.Longtitube = [dic objectForKey:@"longitude"]?[dic objectForKey:@"longitude"]:@"";
    obj.GioiThieu  = [dic objectForKey:@"introduction"]?[[dic objectForKey:@"introduction"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]:@"";
    obj.Description = [dic objectForKey:@"description"]?[[dic objectForKey:@"description"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ]:@"";
    NSArray * imagelink = [dic objectForKey:@"locationImages"];
    NSMutableArray * _arr = [[NSMutableArray alloc] init];
    for(NSDictionary * dict in imagelink){
        [_arr addObject:[[dict objectForKey:@"url"] stringByReplacingOccurrencesOfString:@" " withString:@"%20"]];
    }
    obj.listImages = [_arr copy];
    imagelink.count > 0 ? [obj setAnhKhacLink:[[[[imagelink objectAtIndex:0] objectForKey:@"url"] stringByReplacingOccurrencesOfString:@" " withString:@"%20"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]: [obj setAnhKhacLink:nil];
    obj.Distance = [NSString stringWithFormat:@"%.1f",arc4random() % 11 * 0.1];
    
    // loc anh category
    NSArray * arr = [dic objectForKey:@"locationCategoryMappings"];
    NSMutableArray * listImage = [[NSMutableArray alloc] init];
    for(NSDictionary * aDic in arr){
        if([[[aDic objectForKey:@"locationCategory"] objectForKey:@"type"] isEqualToNumber:@1]){
            [listImage addObject:[[aDic objectForKey:@"locationCategory"] objectForKey:@"imageUrl"]];
        }
    }
    

    return tmp;
}

@end
