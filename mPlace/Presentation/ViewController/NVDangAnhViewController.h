//
//  NVDangAnhViewController.h
//  mPlace
//
//  Created by hoanhnv on 16/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NVDangAnhViewController : UIViewController
@property (weak, nonatomic) IBOutletCollection(UIButton) NSArray *btnAddImage;
- (IBAction)doAddImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *vMainScrollView;
@property (weak, nonatomic) IBOutlet UIView *vDetaiView;

@property (weak, nonatomic) IBOutlet UITextField *txtTitle;
@property (weak, nonatomic) IBOutlet UITextField *txtWarning;
@property (weak, nonatomic) IBOutlet UITextField *txtLocation;
@property (weak, nonatomic) IBOutlet UITextField *txtTime;
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;

- (IBAction)showLeftMenu:(id)sender;
- (IBAction)doSearch:(id)sender;
- (IBAction)doDangTin:(id)sender;
@end
