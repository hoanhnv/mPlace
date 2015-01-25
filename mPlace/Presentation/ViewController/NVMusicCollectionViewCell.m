//
//  NVMusicCollectionViewCell.m
//  mPlace
//
//  Created by MAC on 1/21/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVMusicCollectionViewCell.h"
#import "NVMusicCurent.h"

@implementation NVMusicCollectionViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.avatarImageView setImage:nil];
}

- (void) setCellWitData:(id) data {
    NVMusicCurent *musci = (NVMusicCurent*) data;
    self.titleMusicLable.text = musci.disPlayName;
    self.numberViewLable.text = musci.numberView;
    self.dateLable.text = musci.createDate;
    
    [self.avatarImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,musci.imageUrl]] placeholderImage:[UIImage imageNamed:@"mPlace"]];
    
}

@end
