//
//  NVThuVienViewController.h
//  mPlace
//
//  Created by hoanhnv on 10/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVChiTietThuVienViewController.h"
@interface NVThuVienViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lbIndicator;

- (IBAction)doTabClick:(id)sender;

- (IBAction)showLeftMenu:(id)sender;
- (IBAction)doSearch:(id)sender;

@end
