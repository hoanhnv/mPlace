//
//  NVRuleViewController.m
//  mPlace
//
//  Created by hoanhnv on 23/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVRuleViewController.h"
#import "NVGetHome360Service.h"
@interface NVRuleViewController ()

@end

@implementation NVRuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self reloadData];
}

- (IBAction)showLeftMenu:(id)sender {
    
    [Appdelegate toggleMenu];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)reloadData{
    NVGetHome360Service *service = [[NVGetHome360Service alloc]init];
    [service getRule:^(id data){
        [self.webView loadHTMLString:[data valueForKey:@"content"] baseURL:nil];
    } andFailure:^(NSError*err){
    
    }];
}
@end
