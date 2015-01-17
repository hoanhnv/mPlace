//
//  NVThuVienBO.h
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVThuVien.h"

@interface NVThuVienBO : NSObject

+(void)allThuVien:(void(^)(id listThuVien))completion withFailed:(void(^)(NSError *error))failed;

+(NVThuVien*)detailThuVien:(int)thuvienId;

@end
