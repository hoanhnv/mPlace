//
//  NVBienBaoCollectionViewCell.h
//  mPlace
//
//  Created by MAC on 1/22/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NVBienBaoCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UILabel *numberLable;
@property (weak, nonatomic) IBOutlet UIImageView *bienbaoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleBienBao;


- (void) setCellWithData:(id) data;

@end
