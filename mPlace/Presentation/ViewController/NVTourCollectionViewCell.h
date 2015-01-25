//
//  NVTourCollectionViewCell.h
//  mPlace
//
//  Created by MAC on 1/20/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NVTourCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *titleTour;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;



- (void) setCellData:(id) data;
@end
