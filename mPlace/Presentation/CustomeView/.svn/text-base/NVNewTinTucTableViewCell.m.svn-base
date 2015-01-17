//
//  NVNewTinTucTableViewCell.m
//  mPlace
//
//  Created by hehe on 11/18/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVNewTinTucTableViewCell.h"

@implementation NVNewTinTucTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setObject:(NVNewsObject*) obj{
    [_imgAvatar setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:obj.linkImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"vn_vedep.jpg"]];
    [_txtView setText:obj.title];
    [_txtView setFont:[UIFont boldSystemFontOfSize:16.0f]];
    
    
    [_lblCreateDate setText:obj.createDate];
    
}

@end
