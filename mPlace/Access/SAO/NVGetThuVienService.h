//
//  NVGetThuVienService.h
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVTrafficLibrary.h"

@interface NVGetThuVienService : NSObject

-(void)getAllThuVien:(int)type withSubCate:(int)subCate withPageNumber:(int)page_number
        withPageSize:(int)pageSize withMonth:(int)month withYear:(int)year
          andSuccess:(completion)succes andFailure:(failCompletion)failure;

-(void)getThuVienById:(int)thuVienId andSuccess:(completion)succes
          andFailure:(failCompletion)failure;
-(void)getDanhMucThuVien:(completion)succes andFailure:(failCompletion)failure;
@end
