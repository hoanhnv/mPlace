//
//  NVHoTroViewController.m
//  mPlace
//
//  Created by hehe on 10/24/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVHoTroViewController.h"

@interface NVHoTroViewController ()

@end

@implementation NVHoTroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.screenName = @"IOS_Hotro/AN_Hotro";
    _lblNavi.backgroundColor = [Ultility colorWithHexString:COLOR_NAVIGATION];
    [[Appdelegate iViewDeckController] setPanningMode:IIViewDeckFullViewPanning];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[Appdelegate iViewDeckController] setPanningMode:IIViewDeckFullViewPanning];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)togglemeu:(id)sender{
    [Appdelegate toggleMenu];
}

@end
