//
//  NVBienBaoDetailViewController.m
//  mPlace
//
//  Created by MAC on 1/23/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVBienBaoDetailViewController.h"
#import "NVGetBienBaoSerVice.h"

@interface NVBienBaoDetailViewController ()

@end

@implementation NVBienBaoDetailViewController

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
    // Do any additional setup after loading the view from its nib.
    [self updateUi];
    [self loadDetailWarning];
}

- (void) loadDetailWarning {
    [NVGetBienBaoSerVice getTraficSingDetail:self.traficSing andComple:^(id dataResponse) {
        [self updateUi];
    } andFauil:^(NSError *err) {
        
    }];
}

- (void) updateUi {
    self.displayNameLable.text =   [NSString stringWithFormat:@"Biển %@: %@",self.traficSing.warningCode,self.traficSing.disPlayNameTrafic];
    self.numberWarning.text = [NSString stringWithFormat:@"Số hiệu biển: %@",self.traficSing.warningCode];
    self.disPlayWarning.text = [NSString stringWithFormat:@"Nhóm biển: biển báo cấm"];
    [self.warningImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,self.traficSing.urlIcon]] placeholderImage:[UIImage imageNamed:@"mPlace"]];
    [self.DescriptionWarning setText:self.traficSing.descriptionTrafic];
}

- (IBAction)doBackView:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
