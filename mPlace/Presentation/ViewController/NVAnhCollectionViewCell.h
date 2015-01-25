//
//  NVCustomCollectionViewCell.h
//  KRLCollectionViewGridLayoutDemo
//
//  Created by hoanhnv on 17/01/2015.
//  Copyright (c) 2015 Lundbergsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVImageDoatGiai.h"
@interface NVAnhCollectionViewCell : UICollectionViewCell{
    __weak IBOutlet UIImageView *imgTitle;
    __weak IBOutlet UILabel *lbTitle;
    __weak IBOutlet UILabel *lbPlace;
}

-(int)configCellWithObject:(NVImageDoatGiai*)obj;
+(CGSize)getCellSizeWithItem:(int)index;

@end
