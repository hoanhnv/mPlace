//
//  NVMusicCurent.h
//  mPlace
//
//  Created by MAC on 1/21/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NVMusicCurent : NSObject

@property (nonatomic,assign) NSInteger musicId;
@property (nonatomic,strong) NSString *codeName;
@property (nonatomic,strong) NSString *disPlayName;
@property (nonatomic,strong) NSString *disPlayNameAscii;
@property (nonatomic,strong) NSString *actors;
@property (nonatomic,strong) NSString *director;
@property (nonatomic,strong) NSString *shortDesCription;
@property (nonatomic,strong) NSString *musicDesCription;
@property (nonatomic,strong) NSString *createDate;
@property (nonatomic,strong) NSString *imageUrl;
@property (nonatomic,strong) NSString *numberView;
@property (nonatomic,strong) NSString *videoUrl;

+(NVMusicCurent *)initWithFrom:(NSDictionary *)dic;

- (void) updateInfo:(NVMusicCurent*) musicCurent withData:(NSDictionary*) dic;

@end
