//
//  NVTinTucTableViewCell.m
//  mPlace
//
//  Created by hehe on 11/7/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVTinTucTableViewCell.h"

@implementation NVTinTucTableViewCell
@synthesize delegate;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setObj1:(NVNewsObject *)obj1{
    if(obj1){
        _tintuc1 = obj1;
        //[_img1 setImageWithURL:[NSURL URLWithString:[Ultility getImagePath:obj1.AnhKhacLink]]];
        [imgThumb1 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:_tintuc1.linkImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"vn_vedep.jpg"]];
        [lblName1 setText:obj1.title];
        
    }
}
- (void)setObj2:(NVNewsObject *)obj2{
    if(obj2){
        _tintuc2 = obj2;
        [imgThumb2 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:_tintuc2.linkImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"vn_vedep.jpg"]];
        [lblName2 setText:obj2.title];
    }else{
        [imgThumb2 setImage:[UIImage imageNamed:@"vn_vedep.jpg"]];
        [btnChooseSecond setHidden:YES];
        [imgCategory2 setHidden:YES];
        [lblName2 setHidden:YES];
        [imgThumb2 setHidden:YES];
    }
}

- (IBAction)chooseLocation:(UIButton*)sender{
    switch (sender.tag) {
        case 0:
        {
            if ([delegate respondsToSelector:@selector(selectNews:)] && _tintuc1) {
                [delegate selectNews:_tintuc1];
            }
        }
            break;
            
        case 1:
        {
            if ([delegate respondsToSelector:@selector(selectNews:)] && _tintuc2) {
                [delegate selectNews:_tintuc2];
            }
        }
            break;
        default:
            break;
    }
}

@end
