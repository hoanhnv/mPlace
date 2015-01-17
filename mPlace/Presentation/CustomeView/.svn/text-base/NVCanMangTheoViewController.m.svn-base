//
//  NVCanMangTheoViewController.m
//  mPlace
//
//  Created by hehe on 11/29/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVCanMangTheoViewController.h"

@interface NVCanMangTheoViewController ()

@end

@implementation NVCanMangTheoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"huongdan" ofType:@"html"]isDirectory:NO]]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
