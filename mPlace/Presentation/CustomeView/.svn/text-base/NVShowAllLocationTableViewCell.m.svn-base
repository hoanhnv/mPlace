//
//  NVShowAllLocationTableViewCell.m
//  mPlace
//
//  Created by hehe on 9/30/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVShowAllLocationTableViewCell.h"

@implementation NVShowAllLocationTableViewCell
@synthesize delegate;
@synthesize diadiem1 = _diadiem1;
@synthesize diadiem2 = _diadiem2;
- (void)awakeFromNib
{
    // Initialization code
    imgThumb1.layer.cornerRadius = 5;
    imgThumb2.layer.cornerRadius = 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setObj1:(NVDiaDiem *)obj1{
    if(obj1){
        _diadiem1 = obj1;
        //[_img1 setImageWithURL:[NSURL URLWithString:[Ultility getImagePath:obj1.AnhKhacLink]]];
        [imgThumb1 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:_diadiem1.AnhKhacLink] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"vn_vedep.jpg"]];
        [lblName1 setText:obj1.TenDiaDiem];
        [imgCategory1 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:_diadiem1.AnhCategory] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"vn_vedep.jpg"]];
    }
}
- (void)setObj2:(NVDiaDiem *)obj2{
    if(obj2){
        _diadiem2 = obj2;
        [imgThumb2 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:_diadiem2.AnhKhacLink] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"vn_vedep.jpg"]];
        [imgCategory2 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:_diadiem2.AnhCategory] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"vn_vedep.jpg"]];
        [lblName2 setText:obj2.TenDiaDiem];
    }else{
        [imgThumb2 setImage:[UIImage imageNamed:@"vn_vedep.jpg"]];
        [imgThumb2 setHidden:YES];
        [btnChooseSecond setHidden:YES];
        [imgCategory2 setHidden:YES];
        [lblName2 setHidden:YES];
    }
}

- (IBAction)chooseLocation:(UIButton*)sender{
    switch (sender.tag) {
        case 0:
        {
            if ([delegate respondsToSelector:@selector(selectPlace:)] && _diadiem1) {
                [delegate selectPlace:_diadiem1];
            }
        }
            break;
        
        case 1:
        {
            if ([delegate respondsToSelector:@selector(selectPlace:)] && _diadiem2) {
                [delegate selectPlace:_diadiem2];
            }
        }
            break;
        default:
            break;
    }

}

@end
