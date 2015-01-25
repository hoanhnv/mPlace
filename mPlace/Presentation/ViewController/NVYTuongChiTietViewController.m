//
//  NVYTuongChiTietViewController.m
//  mPlace
//
//  Created by hoanhnv on 14/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVYTuongChiTietViewController.h"
#import "NVDangYTuongViewController.h"
#import "Ultility.h"
@interface NVYTuongChiTietViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbPhone;
@property (strong, nonatomic) IBOutlet UITextView *txtContent;

@end

@implementation NVYTuongChiTietViewController
@synthesize objectPresentation;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadDataToView:self.objectPresentation];
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
-(void)loadDataToView:(NVIdeasAward*)obj{
    self.lbTitle.text = obj.title;
    self.lbName.text = [Ultility stringNullOrEmpty:obj.name]?@"mPlace":obj.name;
    self.lbPhone.text = obj.number_contact;
    self.txtContent.text = obj.content;
}

- (IBAction)doDangYtuongClick:(id)sender {
    NVDangYTuongViewController *dangYtuongVC = [[NVDangYTuongViewController alloc]initWithNibName:@"NVDangYTuongViewController" bundle:nil];
    [self.navigationController pushViewController:dangYtuongVC animated:YES];
}

- (IBAction)showLeftMenu:(id)sender { 
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doSearch:(id)sender {
    
}
@end
