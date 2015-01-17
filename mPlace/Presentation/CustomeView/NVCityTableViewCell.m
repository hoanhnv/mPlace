//
//  NVCityTableViewCell.m
//  mPlace
//
//  Created by hehe on 11/10/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVCityTableViewCell.h"

@implementation NVCityTableViewCell
@synthesize delegate;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setObj1:(NVCity *)obj1{
    if(obj1){
        _city1 = obj1;
        //[_img1 setImageWithURL:[NSURL URLWithString:[Ultility getImagePath:obj1.AnhKhacLink]]];
        [UIView transitionWithView:imgThumb1
                          duration:0.9f
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        animations:^{
                           [imgThumb1 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePathCity:_city1.linkImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"vn_vedep.jpg"]];
                        } completion:NULL];
        
        [lblName1 setText:obj1.nameCity];
        
    }
}
- (void)setObj2:(NVCity *)obj2{
    if(obj2){
        _city2 = obj2;
        [UIView transitionWithView:imgThumb2
                          duration:0.9f
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        animations:^{
                            [imgThumb2 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePathCity:_city2.linkImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] placeholderImage:[UIImage imageNamed:@"vn_vedep.jpg"]];
                        } completion:NULL];
        
        [lblName2 setText:obj2.nameCity];
    }else{
        [imgThumb2 setImage:[UIImage imageNamed:@"vn_vedep.jpg"]];
        [btnChooseSecond setHidden:YES];
        [imgThumb2 setHidden:YES];
        [lblName2 setHidden:YES];
    }
}

- (IBAction)chooseLocation:(UIButton*)sender{
    switch (sender.tag) {
        case 0:
        {
            if ([delegate respondsToSelector:@selector(selectCity:)] && _city1) {
                [delegate selectCity:_city1];
            }
        }
            break;
            
        case 1:
        {
            if ([delegate respondsToSelector:@selector(selectCity:)] && _city2) {
                [delegate selectCity:_city2];
            }
        }
            break;
        default:
            break;
    }
    
}

@end
