//
//  NVTyGiaTableViewCell.h
//  mPlace
//
//  Created by hehe on 11/15/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVTyGia.h"


@interface NVTyGiaTableViewCell : UITableViewCell{

    IBOutlet UILabel * lblName;
    IBOutlet UILabel * lblBuy;
    IBOutlet UILabel * lblTransfer;
    IBOutlet UILabel * lblSell;
}

- (void) setObject:(NVTygia *) tyGia;

@end
