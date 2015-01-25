//
//  NVMusicCurent.m
//  mPlace
//
//  Created by MAC on 1/21/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVMusicCurent.h"

@implementation NVMusicCurent

+(NVMusicCurent *)initWithFrom:(NSDictionary *)dic {
    
    NVMusicCurent *musicCurent = [[NVMusicCurent alloc] init];
    musicCurent.musicId  = [[dic valueForKey:@"id"] integerValue];
    musicCurent.codeName = ![Ultility stringNullOrEmpty:[dic valueForKey:@"code_name"]]?[dic valueForKey:@"code_name"]:@"";
    musicCurent.disPlayName = ![Ultility stringNullOrEmpty:[dic valueForKey:@"display_name"]]?[dic valueForKey:@"display_name"]:@"";
    musicCurent.disPlayNameAscii = ![Ultility stringNullOrEmpty:[dic valueForKey:@"display_name_ascii"]]?[dic valueForKey:@"display_name_ascii"]:@"";
    musicCurent.actors = ![Ultility stringNullOrEmpty:[dic valueForKey:@"actors"]]?[dic valueForKey:@"actors"]:@"";
    musicCurent.director = ![Ultility stringNullOrEmpty:[dic valueForKey:@"director"]]?[dic valueForKey:@"director"]:@"";
    musicCurent.shortDesCription = ![Ultility stringNullOrEmpty:[dic valueForKey:@"short_description"]]?[dic valueForKey:@"short_description"]:@"";
    musicCurent.musicDesCription = ![Ultility stringNullOrEmpty:[dic valueForKey:@"description"]]?[dic valueForKey:@"description"]:@"";
    musicCurent.createDate = ![Ultility stringNullOrEmpty:[dic valueForKey:@"create_date"]]?[dic valueForKey:@"create_date"]:@"";
    musicCurent.imageUrl = ![Ultility stringNullOrEmpty:[dic valueForKey:@"image_url"]]?[dic valueForKey:@"image_url"]:@"";
    musicCurent.numberView = ![Ultility stringNullOrEmpty:[dic valueForKey:@"number_view"]]?[dic valueForKey:@"number_view"]:@"";
    musicCurent.videoUrl = ![Ultility stringNullOrEmpty:[dic valueForKey:@"video_url"]]?[dic valueForKey:@"video_url"]:@"";
    
    return musicCurent;
}

- (void) updateInfo:(NVMusicCurent*) musicCurent withData:(NSDictionary*) dic {
    musicCurent.videoUrl = ![Ultility stringNullOrEmpty:[dic valueForKey:@"video_url"]]?[dic valueForKey:@"video_url"]:@"";
}


@end
