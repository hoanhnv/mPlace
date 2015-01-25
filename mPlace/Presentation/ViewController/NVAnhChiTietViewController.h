//
//  NVAnhChiTietViewController.h
//  mPlace
//
//  Created by hoanhnv on 14/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVImageDoatGiai.h"
#import "NVImagesWarning.h"
@interface NVAnhChiTietViewController : UIViewController{

}
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

//view detail
@property (weak, nonatomic) IBOutlet UIView *vDetail;
@property (weak, nonatomic) IBOutlet UIImageView *imgTitle;
@property (weak, nonatomic) IBOutlet UIButton *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbDiaDiem;
@property (weak, nonatomic) IBOutlet UILabel *lbDate;
@property (weak, nonatomic) IBOutlet UILabel *lbPhone;
@property (weak, nonatomic) IBOutlet UITextView *lbContent;

//View image list
@property (weak, nonatomic) IBOutlet UIView *vImageList;
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;

//view video
@property (weak, nonatomic) IBOutlet UIView *vVideoList;
@property (weak, nonatomic) IBOutlet UILabel *titleImageDetail;


//view ban do
@property (weak, nonatomic) IBOutlet UIView *vBanDo;
@property (strong, nonatomic)NVImagesWarning *objectPresentation;

@property (strong, nonatomic)  NSArray *imageList;

- (IBAction)tapTopMenu:(id)sender;
- (IBAction)tapDangAnh:(id)sender;


@end
