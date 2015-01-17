//
//  NV360ViewController.m
//  mPlace
//
//  Created by hoanhnv on 14/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NV360ViewController.h"

@interface NV360ViewController ()

@end

@implementation NV360ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self prepareComponentViews];
    [self loadDataToComponentViews];
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
    CGRect rectMain = [UIScreen mainScreen].bounds;
    self.vSlideShow.frame = CGRectMake(0, 0, 320,150);
    [self.vMainView addSubview:self.vSlideShow];
    
    self.vMenuButton.frame = CGRectMake(0, CGRectGetMaxY(self.vSlideShow.frame), rectMain.size.width, 50);
    [self.vMainView addSubview:self.vMenuButton];
    
    self.vImageMost.frame = CGRectMake(0, CGRectGetMaxY(self.vMenuButton.frame), rectMain.size.width, 150);
    [self.vMainView addSubview:self.vImageMost];
    
    self.vIdeaMost.frame = CGRectMake(0, CGRectGetMaxY(self.vImageMost.frame), rectMain.size.width, 150);
    [self.vMainView addSubview:self.vIdeaMost];
    
    self.vMenuBottom.frame = CGRectMake(0, CGRectGetMaxY(self.vIdeaMost.frame), rectMain.size.width, 120);
    [self.vMainView addSubview:self.vMenuBottom];
    
    [self.vMainView setContentSize:CGSizeMake(rectMain.size.width, CGRectGetMaxY(self.vMenuBottom.frame)+20)];
}
-(void)loadDataToComponentViews{
    //self.arrMenuBottom = [NSArray arrayWithObjects:@"Đăng ảnh cảnh báo ATGT",@"Đăng ý tưởng đóng góp về ATGT",@"Thể lệ cuộc thi 360º ATGT", nil];
}


- (IBAction)showLeftMenu:(id)sender {

    [Appdelegate toggleMenu];
}

- (IBAction)doSearch:(id)sender {
    
}

- (IBAction)doClickMenuButton:(id)sender {
     UIButton *btn = (UIButton*)sender;
    switch (btn.tag) {
        case 101:
        {
            break;
        }
        case 102:
        {
            break;
        }
        case 103:
        {
            break;
        }
        case 104:
        {
            break;
        }
        default:
            break;
    }
}

- (IBAction)doClickMenuBottom:(id)sender {
    UIButton *btn = (UIButton*)sender;
    switch (btn.tag) {
        case 105:
        {
            break;
        }
        case 106:
        {
            break;
        }
        case 107:
        {
            break;
        }
        default:
            break;
    }
}
@end
