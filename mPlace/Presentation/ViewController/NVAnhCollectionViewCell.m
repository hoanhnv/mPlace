//
//  NVCustomCollectionViewCell.m
//  KRLCollectionViewGridLayoutDemo
//
//  Created by hoanhnv on 17/01/2015.
//  Copyright (c) 2015 Lundbergsoft. All rights reserved.
//

#import "NVAnhCollectionViewCell.h"
#import "NVImageDoatGiai.h"
@implementation NVAnhCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
}
-(int)configCellWithObject:(NVImageDoatGiai*)obj{
    float heightTemp = 0;
    [imgTitle setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE, obj.avatar_url]]];
    heightTemp += imgTitle.frame.size.height;
    
    lbTitle.numberOfLines = 3; // allows label to have as many lines as needed
    lbTitle.text = obj.titleDoatGiai;
    //[lbTitle sizeToFit];
    heightTemp += lbTitle.frame.size.height;
    lbPlace.text = obj.address;
     CGRect fPlace = lbPlace.frame;
    fPlace.origin.y = CGRectGetMaxY(lbTitle.frame);
    lbPlace.frame = fPlace;
    heightTemp = CGRectGetMaxY(lbPlace.frame);
    return heightTemp>158?heightTemp:158;
}
+(CGSize)getCellSizeWithItem:(int)index{
    int widthCell =  145;
    int heightCell = 160;
    UILabel *lbTemp =[UILabel new];
    lbTemp.numberOfLines = 0; // allows label to have as many lines as needed
    if (index == 3) {
        lbTemp.text = @"working examples of table views with variable row heights due to table ";
    }
    else if(index == 6){
        lbTemp.text = @"working examples of table views with variable row heightsof table views with variable row heightsof table views with variable row heights";
    }
    else if(index == 5){
        lbTemp.text = @"working examples ";
    }
    else{
        lbTemp.text = @"Phòng tránh tai nạn giao thông";
    }
    heightCell = lbTemp.frame.size.height >33?heightCell +lbTemp.frame.size.height - 33:heightCell;
    return CGSizeMake(widthCell, heightCell);
    
}
-(void)layoutSubviews{
    //[self configCellWithObject:nil];
}
@end
