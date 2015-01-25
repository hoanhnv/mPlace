//
//  NVThuVienCollectionViewCell.m
//  mPlace
//
//  Created by hoanhnv on 20/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVThuVienCollectionViewCell.h"

@implementation NVThuVienCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)configCellWithObject:(NVTrafficLibrary*)obj{
    self.lbTitle.text = obj.display_name;
    self.lbDate.text = obj.create_date;
}

@end
