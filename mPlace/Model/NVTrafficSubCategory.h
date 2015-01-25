//
//  NVTrafficSubCategory.h
//  mPlace
//
//  Created by hoanhnv on 24/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVTraficCategory.h"
@interface NVTrafficSubCategory :NVTraficCategory{
    
}
@property (nonatomic, strong)NSString *subcategory_type;
@property (nonatomic, strong)NSString *modify_date;
+ (NVTrafficSubCategory *)initWithFrom:(NSDictionary *)dic;
@end
