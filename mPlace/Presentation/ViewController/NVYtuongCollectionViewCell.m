//
//  NVYtuongCollectionViewCell.m
//  KRLCollectionViewGridLayoutDemo
//
//  Created by hoanhnv on 17/01/2015.
//  Copyright (c) 2015 Lundbergsoft. All rights reserved.
//

#import "NVYtuongCollectionViewCell.h"


@implementation NVYtuongCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
}
-(void)configCellWithObject:(NVIdeasAward*)obj{
    self.lbTitle.text = obj.title;
    self.lbDescription.text = obj.content;
}

@end
