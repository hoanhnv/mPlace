//
//  Music.h
//  fdgdgdgdg
//
//  Created by Mydv on 1/19/15.
//  Copyright (c) 2015 Mydv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVVodAsset.h"
#import "NVVodImage.h"

@interface NVMusic : NSObject
@property (nonatomic, readwrite) int numberView;
@property (nonatomic, readwrite) int pages;
@property (nonatomic, strong) NVVodAsset *vodAsset;
@property (nonatomic, strong) NVVodImage *vodImage;

@end
