//
//  NVLoginWifiViewController.m
//  mPlace
//
//  Created by hehe on 11/17/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVLoginWifiViewController.h"

@interface NVLoginWifiViewController (){

    
}

@end

@implementation NVLoginWifiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_wifi_signin.png"]];
    [[Appdelegate iViewDeckController] setPanningMode:IIViewDeckFullViewPanning];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleMenu:(id)sender{
    [Appdelegate toggleMenu];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
