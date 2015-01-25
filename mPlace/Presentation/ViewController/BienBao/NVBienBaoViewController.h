//
//  NVBienBaoViewController.h
//  mPlace
//
//  Created by MAC on 1/22/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"
enum {
    DuongBo,
    DuongSat,
    DuongThuy,
    DuongHangKhong
};

@interface NVBienBaoViewController : UIViewController <NIDropDownDelegate>{
    int typeCate;
    int subCate;
    NIDropDown *dropDown;
    UIButton* currentTabSelected;
}

@property (weak, nonatomic) IBOutlet UIView *categoryView;
@property (weak, nonatomic) IBOutlet UIView *headderView;
@property (weak, nonatomic) IBOutlet UIButton *headerButton;
@property (weak, nonatomic) IBOutlet UILabel *lbIndicator;
@property (weak, nonatomic) IBOutlet UICollectionView *bienbaoCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *noData;
@property (weak, nonatomic) IBOutlet UIButton *btnDanhMuc;
@property (weak, nonatomic) IBOutlet UILabel *allCategoryLable;


- (IBAction)doTabClick:(id)sender;
- (IBAction)showCategoryViewButtonPressed:(id)sender;
- (IBAction)doShowDanhMuc:(id)sender;
- (IBAction)backButtonPressed:(id)sender;

@end
