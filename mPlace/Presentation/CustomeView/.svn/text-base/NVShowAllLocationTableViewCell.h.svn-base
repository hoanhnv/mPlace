//
//  NVShowAllLocationTableViewCell.h
//  mPlace
//
//  Created by hehe on 9/30/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PLACEDELEGATE <NSObject>

@optional

- (void)selectPlace:(NVDiaDiem *)nvDiadiem;

@end

@interface NVShowAllLocationTableViewCell : UITableViewCell{

    IBOutlet UIImageView * imgThumb1;
    IBOutlet UIImageView * imgThumb2;
    
    IBOutlet UIButton * btnChooseFirst;
    IBOutlet UIButton * btnChooseSecond;
    
    IBOutlet UIImageView * imgCategory1;
    IBOutlet UIImageView * imgCategory2;
    
    IBOutlet UILabel     * lblName1;
    IBOutlet UILabel     * lblName2;
}

@property (nonatomic, assign) id <PLACEDELEGATE> delegate;
@property (nonatomic, strong) NVDiaDiem * diadiem1;
@property (nonatomic, strong) NVDiaDiem * diadiem2;

- (void)setObj1:(NVDiaDiem *)obj1;
- (void)setObj2:(NVDiaDiem *)obj2;

@end
