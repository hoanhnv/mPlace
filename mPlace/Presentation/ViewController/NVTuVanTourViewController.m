//
//  NVTuVanTourViewController.m
//  mPlace
//
//  Created by hoanhnv on 10/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVTuVanTourViewController.h"

@interface NVTuVanTourViewController ()

@end

@implementation NVTuVanTourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
-(void)prepareComponentViews{
    self.vMiddleBG.backgroundColor = [UIColor colorWithRed:231.0f/255 green:66/255.0f blue:37/255.0f alpha:1.0];
}
@end
