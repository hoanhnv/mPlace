//
//  VodAsset.h
//  fdgdgdgdg
//
//  Created by Mydv on 1/19/15.
//  Copyright (c) 2015 Mydv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVVodImage : NSObject
@property (nonatomic, strong) NSString *picture;

+(NVVodImage *)initWithFrom:(NSDictionary *)dic;
@end
