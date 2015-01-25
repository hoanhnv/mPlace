//
//  NVThuVienCollectionViewCell.h
//  mPlace
//
//  Created by hoanhnv on 20/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVTrafficLibrary.h"

@interface NVThuVienCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbDate;

-(void)configCellWithObject:(NVTrafficLibrary*)obj;

@end
