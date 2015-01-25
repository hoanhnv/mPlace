//
//  NVYTuongViewController.h
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVDangYTuongViewController.h"
#import "NVYTuongBO.h"
#import "NIDropDown.h"
@interface NVYTuongViewController : UIViewController<NIDropDownDelegate>{
     NVYTuongBO *serviceAPI;
    int typeCate;
     NIDropDown *dropDown;
    UIButton* currentTabSelected;
    
    NSInteger month;
    NSInteger year;

}
@property (weak, nonatomic) IBOutlet UIButton *btnDate;
@property (weak, nonatomic) IBOutlet UIButton *btnDuongBo;
@property (weak, nonatomic) IBOutlet UIButton *btnDuongThuy;

@property (weak, nonatomic) IBOutlet UIButton *btnDuongSat;
@property (weak, nonatomic) IBOutlet UIButton *btnHangKhong;
@property (weak, nonatomic) IBOutlet UICollectionView *listYtuongCollectionView;
@property (strong, nonatomic) NSMutableArray *listDate;
@property (weak, nonatomic) IBOutlet UILabel *lbIndicator;
@property (weak, nonatomic) IBOutlet UILabel *noData;



- (IBAction)doTabClick:(id)sender;
- (IBAction)doDangYtuongClick:(id)sender;

- (IBAction)showLeftMenu:(id)sender;
- (IBAction)doSearch:(id)sender;
- (IBAction)dateButtonPressed:(id)sender;


@end
