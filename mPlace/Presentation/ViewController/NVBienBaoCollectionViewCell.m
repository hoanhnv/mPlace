//
//  NVBienBaoCollectionViewCell.m
//  mPlace
//
//  Created by MAC on 1/22/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVBienBaoCollectionViewCell.h"
#import "NVTrafficSign.h"

@implementation  NVBienBaoCollectionViewCell


- (void) setCellWithData:(id) data {
    NVTrafficSign *traficSing = (NVTrafficSign*) data;
    self.numberLable.text = traficSing.warningCode;
    [self.bienbaoImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,traficSing.urlIcon]] placeholderImage:[UIImage imageNamed:@"mPlace"]];
    self.titleBienBao.text = traficSing.disPlayNameTrafic;
}

@end
