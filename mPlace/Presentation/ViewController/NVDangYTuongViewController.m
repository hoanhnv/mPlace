//
//  NVDangYTuongViewController.m
//  mPlace
//
//  Created by hoanhnv on 15/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVDangYTuongViewController.h"
#import "NVGetHome360Service.h"

#define KEYBOARD_ANIMATION_DURATION     0.3f
#define MINIMUM_SCROLL_FRACTION         0.2f
#define MAXIMUM_SCROLL_FRACTION         0.8f
#define PORTRAIT_KEYBOARD_HEIGHT        216

@interface NVDangYTuongViewController ()

@end

@implementation NVDangYTuongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupViews];
}

-(void)setupViews{
    CGRect rectMain = [UIScreen mainScreen].bounds;
    [self.mainScrollView addSubview:self.vDetail];
     [self.mainScrollView setContentSize:CGSizeMake(rectMain.size.width, CGRectGetMaxY(self.vDetail.frame)+20)];
}
- (IBAction)doDangTinClick:(id)sender {
    NSString *message = nil;
    [self.view endEditing:YES];
    if ([self trimStringSpaceWhite:self.txtTitle.text].length == 0) {
        message = @"Bạn chưa nhập tiêu đề ảnh";
        [self.txtTitle resignFirstResponder];
    } else if ([self trimStringSpaceWhite:self.txtLocation.text].length == 0) {
        message = @"Bạn chưa nhập địa điểm";
        [self.txtLocation resignFirstResponder];
    } else if ([self trimStringSpaceWhite:self.txtPhone.text].length == 0) {
        message = @"Bạn chưa nhập số điện thoại";
        [self.txtPhone resignFirstResponder];
    }
    if (message) {
        UIAlertView *alleart = [[UIAlertView alloc] initWithTitle:@"Thông báo" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        alleart.delegate = self;
        [alleart show]; 
        return;
    }
    NSDictionary *params = @{@"title": self.txtTitle.text,
                             @"content": self.txtLocation.text,
                             @"mobile_number":self.txtPhone.text,
                             @"name":@"hoanhNV",
                             @"traffic_category":self.traficCategoryObject.traficId};
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
   [NVGetHome360Service posListComment:params andComple:^(id dataResponse) {
       
       if ([[dataResponse valueForKey:@"code"] integerValue] == 0) {
           UIAlertView *alleart = [[UIAlertView alloc] initWithTitle:@"Thông báo" message:[dataResponse valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
           alleart.delegate = self;
           [alleart show];
       } 
       [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
   } andfail:^(NSError *err) {
       [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
   }];
    
}

- (NSString*) trimStringSpaceWhite:(NSString*) input {
    input = [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return input;
}

- (IBAction)showLeftMenu:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doSearch:(id)sender {
    
}

- (IBAction)showCategoryTraficButtonPressed:(id)sender {
    [self.view endEditing:YES];
    NVListTraficCategoryViewController *traficController = [[NVListTraficCategoryViewController alloc] initWithNibName:NSStringFromClass([NVListTraficCategoryViewController class]) bundle:nil];
    traficController.delegate = self;
    [self.navigationController pushViewController:traficController animated:YES];
}

- (void) passingTraficCategory:(NVTraficCategory *)traficCateGory {
    self.traficCategoryObject = traficCateGory;
    self.categoryName.text = traficCateGory.disPlayName;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.txtLocation resignFirstResponder];
    [self.txtTitle resignFirstResponder];
    [self.txtPhone resignFirstResponder];
    [self doDangTinClick:nil];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
    
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =
    midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    
    /*UIInterfaceOrientation orientation =
     [[UIApplication sharedApplication] statusBarOrientation];
     if (orientation == UIInterfaceOrientationPortrait ||
     orientation == UIInterfaceOrientationPortraitUpsideDown)
     {*/
    self.animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    /*}
     else
     {
     animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
     }*/
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= self.animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += self.animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
