//
//  NVTourCollectionViewCell.m
//  mPlace
//
//  Created by MAC on 1/20/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVTourCollectionViewCell.h"
#import "NVTour.h"

@implementation NVTourCollectionViewCell

- (void) setCellData:(id) data {
    NVTour *tourObject = (NVTour*)data;
  //  [self.avatar setImageWithURL:[NSURL URLWithString:]]
    self.titleTour.text = tourObject.disPlayName;
    self.dateLable.text = tourObject.release_date;
}

@end
