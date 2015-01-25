//
//  NVImageCollectionViewCell.h
//  mPlace
//
//  Created by MAC on 1/16/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NVImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgContent;
- (IBAction)onButtonTap:(id)sender;

@end
