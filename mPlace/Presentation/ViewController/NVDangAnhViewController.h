//
//  NVDangAnhViewController.h
//  mPlace
//
//  Created by hoanhnv on 16/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVDatePicker.h"
@interface NVDangAnhViewController : UIViewController<UINavigationControllerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>{
    NSDate *selectedDate;
    int numberImage;
}
@property (strong, nonatomic) NVDatePicker *myDatePicker;
@property (weak, nonatomic) IBOutletCollection(UIButton) NSArray *btnAddImage;
@property (weak, nonatomic) IBOutlet UIButton *btnImage1;
@property (weak, nonatomic) IBOutlet UIButton *btnClose1;
@property (weak, nonatomic) IBOutlet UIButton *btnClose2;
@property (weak, nonatomic) IBOutlet UIButton *btnImage2;
@property (weak, nonatomic) IBOutlet UIButton *btnImage3;
@property (weak, nonatomic) IBOutlet UIButton *btnClose3;

@property (weak, nonatomic) IBOutlet UIButton *btnImage4;
@property (weak, nonatomic) IBOutlet UIButton *btnClose4;
- (IBAction)doClose_Image:(id)sender;

- (IBAction)doAddImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *vMainScrollView;
@property (weak, nonatomic) IBOutlet UIView *vDetaiView;
@property (weak, nonatomic) IBOutlet UIImageView *vMiddle;

@property (weak, nonatomic) IBOutlet UITextField *txtTitle;
@property (weak, nonatomic) IBOutlet UITextField *txtWarning;
@property (weak, nonatomic) IBOutlet UITextField *txtLocation;
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
@property (weak, nonatomic) IBOutlet UIButton *btnTime;
@property (weak, nonatomic) IBOutlet UILabel *lbTime;
@property (strong,nonatomic) UIImage *image1;
@property (strong,nonatomic) UIImage *image2;
@property (strong,nonatomic) UIImage *image3;
@property (strong,nonatomic) UIImage *image4;
@property (readwrite,nonatomic) int fromImage;
@property (nonatomic, assign) float animatedDistance;

- (IBAction)btnTime_Click:(id)sender;

- (IBAction)showLeftMenu:(id)sender;
- (IBAction)doSearch:(id)sender;
- (IBAction)doDangTin:(id)sender;
-(UIImage*)loadImageFromAssertByUrl:(NSURL*)url completion:(void (^)(UIImage*)) completion;

@end
