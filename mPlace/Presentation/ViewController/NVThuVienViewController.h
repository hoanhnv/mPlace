//
//  NVThuVienViewController.h
//  mPlace
//
//  Created by hoanhnv on 10/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVChiTietThuVienViewController.h"
#import "NVGetThuVienService.h"
#import "NIDropDown.h"
#import "KxMenu.h"
@interface NVThuVienViewController : UIViewController<NIDropDownDelegate>{
    NVGetThuVienService *serviceAPI;
    
    NIDropDown *dropDown;
    UIButton* currentTabSelected;
    
    int typeCate;
    int subCate;
    int month;
    int year;
    int page_number;
    int page_size;

}
- (IBAction)tapView:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnDuongBo;
@property (weak, nonatomic) IBOutlet UIButton *btnDuongThuy;

@property (weak, nonatomic) IBOutlet UIButton *btnDuongSat;
@property (weak, nonatomic) IBOutlet UIButton *btnHangKhong;
@property (weak, nonatomic) IBOutlet UICollectionView *listThuvienCollectionView;

@property (weak, nonatomic) IBOutlet UILabel *lbIndicator;
@property (weak, nonatomic) IBOutlet UIButton *btnDanhMuc;
@property (weak, nonatomic) IBOutlet UIButton *btnThoiGian;

@property (weak, nonatomic) IBOutlet UILabel *noDataImage;
@property (weak, nonatomic) IBOutlet UIView *dateViewContainer;
@property (weak, nonatomic) IBOutlet UILabel *lbDate;
@property (weak, nonatomic) IBOutlet UILabel *lbDanhMuc;
@property (weak, nonatomic) IBOutlet UILabel *noData;

- (IBAction)doShowDanhMuc:(id)sender;
- (IBAction)doShowThoiGian:(id)sender;

- (IBAction)doTabClick:(id)sender;

- (IBAction)showLeftMenu:(id)sender;
- (IBAction)doSearch:(id)sender;

@end
