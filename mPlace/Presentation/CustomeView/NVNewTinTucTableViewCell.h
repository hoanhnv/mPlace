//
//  NVNewTinTucTableViewCell.h
//  mPlace
//
//  Created by hehe on 11/18/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVNewsObject.h"

@interface NVNewTinTucTableViewCell : UITableViewCell{

    IBOutlet UIImageView * _imgAvatar;
    IBOutlet UILabel  * _txtView;
    IBOutlet UILabel     * _lblCreateDate;
}

- (void)setObject:(NVNewsObject*) obj;

@end
