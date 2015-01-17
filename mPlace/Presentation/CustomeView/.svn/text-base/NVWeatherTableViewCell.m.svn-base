//
//  NVWeatherTableViewCell.m
//  mPlace
//
//  Created by hehe on 11/18/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVWeatherTableViewCell.h"

@implementation NVWeatherTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setObject:(NVThoiTiet*) obj{
    nameProvince.text = obj.we_displayName;
    temperature.text  = [NSString stringWithFormat:@"%@°C",[obj.we_temp substringToIndex:2]];
    mainStatus.text   = obj.we_nangmua;
    [imageStatus setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:obj.we_urlImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:nil]];
}

@end
