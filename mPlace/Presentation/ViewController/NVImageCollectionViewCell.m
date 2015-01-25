//
//  NVImageCollectionViewCell.m
//  mPlace
//
//  Created by MAC on 1/16/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVImageCollectionViewCell.h"
#import "EXPhotoViewer.h"
@implementation NVImageCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)onButtonTap:(id)sender {
    [EXPhotoViewer showImageFrom:self.imgContent];
}
@end
