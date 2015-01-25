//
//  NVTuVanTourChiTietViewController.h
//  mPlace
//
//  Created by hoanhnv on 20/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVTour.h"

@interface NVTuVanTourChiTietViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *titleTourLable;
@property (weak, nonatomic) IBOutlet UIWebView *contenWebView;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;

@property (nonatomic,strong) NVTour *tourObejct;
- (IBAction)showLeftMenu:(id)sender;
@end
