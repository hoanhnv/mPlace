//
//  NVExchangeTableViewCell.m
//  mPlace
//
//  Created by hehe on 11/15/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVExchangeTableViewCell.h"



@implementation NVExchangeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setObject:(NVTygia *) tyGia{
    lblName.text     = tyGia.currencyName;
    lblBuy.text      = tyGia.exchangeBuy;
    lblTransfer.text = tyGia.exchangeTransfer;
    lblSell.text     = tyGia.exchangeSell;
}

@end
