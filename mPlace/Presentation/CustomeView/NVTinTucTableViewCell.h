//
//  NVTinTucTableViewCell.h
//  mPlace
//
//  Created by hehe on 11/7/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVNewsObject.h"

@protocol NEWSDELEGATE <NSObject>

@optional

- (void)selectNews:(NVNewsObject *)nvTinTuc;

@end

@interface NVTinTucTableViewCell : UITableViewCell{

    IBOutlet UIImageView * imgThumb1;
    IBOutlet UIImageView * imgThumb2;
    
    IBOutlet UIButton * btnChooseFirst;
    IBOutlet UIButton * btnChooseSecond;
    
    IBOutlet UIImageView * imgCategory1;
    IBOutlet UIImageView * imgCategory2;
    
    IBOutlet UILabel     * lblName1;
    IBOutlet UILabel     * lblName2;
}

@property (nonatomic, assign) id <NEWSDELEGATE> delegate;
@property (nonatomic, strong) NVNewsObject * tintuc1;
@property (nonatomic, strong) NVNewsObject * tintuc2;

- (void)setObj1:(NVNewsObject *)obj1;
- (void)setObj2:(NVNewsObject *)obj2;
@end
