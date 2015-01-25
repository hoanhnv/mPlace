//
//  NVTuVanTourChiTietViewController.m
//  mPlace
//
//  Created by hoanhnv on 20/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVTuVanTourChiTietViewController.h"

@interface NVTuVanTourChiTietViewController ()

@end

@implementation NVTuVanTourChiTietViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.titleTourLable.text = self.tourObejct.disPlayName;
    self.dateLable.text = self.tourObejct.release_date;
    [self.contenWebView loadHTMLString:self.tourObejct.contentTour baseURL:nil];
    
}
- (void) showLeftMenu:(id)sender {
    [Appdelegate toggleMenu];
}
@end
