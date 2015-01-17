//
//  NVWeatherTableViewCell.h
//  mPlace
//
//  Created by hehe on 11/18/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVThoiTiet.h"

@interface NVWeatherTableViewCell : UITableViewCell{

    IBOutlet UILabel * nameProvince;
    IBOutlet UILabel * temperature;
    IBOutlet UILabel * mainStatus;
    IBOutlet UIImageView * imageStatus;
}

- (void)setObject:(NVThoiTiet*) obj;

@end
