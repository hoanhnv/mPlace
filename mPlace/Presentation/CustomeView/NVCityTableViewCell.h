//
//  NVCityTableViewCell.h
//  mPlace
//
//  Created by hehe on 11/10/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVCity.h"

@protocol CITYDELEGATE <NSObject>

@optional

- (void)selectCity:(NVCity *)nvCity;

@end

@interface NVCityTableViewCell : UITableViewCell{

    IBOutlet UIImageView * imgThumb1;
    IBOutlet UIImageView * imgThumb2;
    
    IBOutlet UILabel     * lblName1;
    IBOutlet UILabel     * lblName2;
    
    IBOutlet UIButton * btnChooseSecond;
}

@property (nonatomic, assign) id <CITYDELEGATE> delegate;
@property (nonatomic, strong) NVCity * city1;
@property (nonatomic, strong) NVCity * city2;

- (void)setObj1:(NVCity *)obj1;
- (void)setObj2:(NVCity *)obj2;

@end
