//
//  Music.m
//  fdgdgdgdg
//
//  Created by Mydv on 1/19/15.
//  Copyright (c) 2015 Mydv. All rights reserved.
//

#import "NVMusic.h"

@implementation NVMusic
@synthesize numberView;
@synthesize pages;
@synthesize vodAsset;
@synthesize vodImage;


+(NVMusic *)initWithFrom:(NSDictionary *)dic {
    NVMusic* music = nil;
    NSDictionary *dicVoidAsset;
    NSDictionary *dicVoidPicture;
    music = [[NVMusic alloc]init];
    music.numberView = [[dic objectForKey:@"numberView"] intValue];
    music.pages = [[dic objectForKey:@"pages"] intValue];
    
    dicVoidAsset = [dic objectForKey:@"VodAsset"];
    music.vodAsset = [NVVodAsset initWithFrom:dicVoidAsset];
    
    dicVoidPicture = [dic objectForKey:@"VodImage"];
    music.vodImage = [NVVodImage initWithFrom:dicVoidPicture];
   
    return music;
}

@end
