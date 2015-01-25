//
//  NVMusicCollectionViewCell.h
//  mPlace
//
//  Created by MAC on 1/21/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NVMusicCollectionViewCell : UICollectionViewCell

- (void) setCellWitData:(id) data;
@property (weak, nonatomic) IBOutlet UILabel *titleMusicLable;
@property (weak, nonatomic) IBOutlet UILabel *numberViewLable;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@end
