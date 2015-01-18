//
//  NVCustomCollectionViewCell.m
//  KRLCollectionViewGridLayoutDemo
//
//  Created by hoanhnv on 17/01/2015.
//  Copyright (c) 2015 Lundbergsoft. All rights reserved.
//

#import "NVAnhCollectionViewCell.h"

@implementation NVAnhCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
}
-(int)configCellWithObject:(int)index{
    float heightTemp = 0;
    imgTitle.image = [UIImage imageNamed:@"tin4_4.png"];
    heightTemp += imgTitle.frame.size.height;
    
    lbTitle.numberOfLines = 0; // allows label to have as many lines as needed
    if (index == 3) {
        lbTitle.text = @"working examples of table views with variable row heights due to table ";
    }
    else if(index == 6){
         lbTitle.text = @"working examples of table views with variable row heightsof table views with variable row heightsof table views with variable row heights";
    }
    else if(index == 5){
        lbTitle.text = @"working examples ";
    }
    else{
        lbTitle.text = @"Phòng tránh tai nạn giao thông";
    }
    [lbTitle sizeToFit];
    heightTemp += lbTitle.frame.size.height;
    lbPlace.text = @"Cau Giay - Ha Noi";
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
