//
//  NVDangYTuongViewController.h
//  mPlace
//
//  Created by hoanhnv on 15/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVListTraficCategoryViewController.h"
#import "NVTraficCategory.h"

@interface NVDangYTuongViewController : UIViewController<UITextFieldDelegate,TraficCategoryDelegate> {
    
}
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (strong, nonatomic) IBOutlet UIView *vDetail;

@property (weak, nonatomic) IBOutlet UITextField *txtTitle;
@property (weak, nonatomic) IBOutlet UITextField *txtLocation;
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
@property (weak, nonatomic) IBOutlet UILabel *categoryName;
@property (nonatomic, assign) float animatedDistance;
@property (nonatomic,strong) NVTraficCategory *traficCategoryObject;

- (IBAction)doDangTinClick:(id)sender;
- (IBAction)showLeftMenu:(id)sender;
- (IBAction)doSearch:(id)sender;
- (IBAction)showCategoryTraficButtonPressed:(id)sender;



@end
