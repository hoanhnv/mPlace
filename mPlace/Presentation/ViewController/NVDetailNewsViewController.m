//
//  NVDetailNewsViewController.m
//  AppDuLich
//
//  Created by hehe on 7/15/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import "NVDetailNewsViewController.h"

@interface NVDetailNewsViewController ()

@end

@implementation NVDetailNewsViewController
@synthesize object = _object;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.screenName = @"IOS_Tintuc/AN_Tintuc";
    [self initView];
    // Do any additional setup after loading the view from its nib.
}

- (void)initView{
    //_labelTitle.text = @"Tin tức";
    //_labelTitle.font = FONT_BOLD(20);
    _labelTitle.textColor = [UIColor whiteColor];
    _labelTitle.textAlignment = NSTextAlignmentCenter;
    
    _content.text = _object.content;
    _labelTitle.text = @"TIN TỨC";//_object.title;
    //_labelTitleText.numberOfLines = 0;
    _labelTitleText.text = _object.title;
    
    NSString * contentWebView = [NSString stringWithFormat:@"<html>\
                                 <head><title></title></head>\
                                 <body>\
                                 <style> p img{width: 98%% !important;height: auto !important} </style><div class'' style='width: 100%% !important;'> %@ </div>\
                                 </body>\
                                 </html>",_object.content];
    [_webView loadHTMLString:contentWebView baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    //[[Appdelegate iViewDeckController] setPanningMode:IIViewDeckFullViewPanning];
}

@end
