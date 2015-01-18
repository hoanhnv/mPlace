//
//  NVThuVienViewController.m
//  mPlace
//
//  Created by hoanhnv on 10/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVThuVienViewController.h"

@interface NVThuVienViewController ()

@end

@implementation NVThuVienViewController

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

-(void)loadViewWithButton:(UIButton*)btn{
    [UIView animateWithDuration:1.0 animations:^{
        CGRect flbIndicator = self.lbIndicator.frame;
        flbIndicator.origin.x = btn.frame.origin.x;
        self.lbIndicator.frame = flbIndicator;
    }];
    [self loadViewWithTab:btn.tag];
    
}
-(void)loadViewWithTab:(int)index{
    switch (index) {
        case 200:{
            
        }
            break;
        case 201:{
            
        }
            break;
        case 202:{
            
        }
            break;
        case 203:{
            
        }
            break;
            
        default:
            break;
    }
}
- (IBAction)doTabClick:(id)sender {
    UIButton *btn = (UIButton*)sender;
    [self loadViewWithButton:btn];
}
- (IBAction)showLeftMenu:(id)sender {
    
    [Appdelegate toggleMenu];
}

- (IBAction)doSearch:(id)sender {
    
}
@end
