//
//  NVTuyChon.m
//  mPlace
//
//  Created by hehe on 10/24/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVTuyChon.h"
#import "NVTyGiaViewController.h"
#import "NVCanMangTheoViewController.h"

@interface NVTuyChon ()

@end

@implementation NVTuyChon

- (void)viewDidLoad {
    [super viewDidLoad];
    self.screenName = @"IOS_Tuychon/AN_Tuychon";
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

- (IBAction)togglemeu:(id)sender{
    [Appdelegate toggleMenu];
}

- (IBAction)callSupport:(id)sender{
    
    //[self googleAnalytic:@"AC_CALL" :11];
    [Ultility eventGoogleAnalytic:@"AC_CALL" :11];
    
    NSURL *url = [NSURL URLWithString:@"tel://19009999"];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)emailSupport:(id)sender{
    
    //[self googleAnalytic:@"AC_Email" :10];
    [Ultility eventGoogleAnalytic:@"AC_Email" :10];
    
    if ([MFMailComposeViewController canSendMail]) {
        // Show the composer
        MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        [controller setToRecipients:[NSArray arrayWithObject:@"mplace@namviet-corp.vn" ]];
        [controller setSubject:@"Yêu cầu trợ giúp"];
        [controller setMessageBody:@"" isHTML:NO];
        if (controller) [self presentViewController:controller animated:YES completion:^{
            NSLog(@"present ok");
        }];
    } else {
        // Handle the error
    }
    
}

- (IBAction)chooseTyGia:(id)sender{
    NVTyGiaViewController * tygia = [[NVTyGiaViewController alloc] initWithNibName:@"NVTyGiaViewController" bundle:nil];
    [self.navigationController pushViewController:tygia animated:YES];
}

- (IBAction)canMangTheo:(id)sender{
    NVCanMangTheoViewController * canmang = [[NVCanMangTheoViewController alloc] initWithNibName:@"NVCanMangTheoViewController" bundle:nil];
    [self.navigationController pushViewController:canmang animated:YES];
}

#pragma mark - EMAIL DELEGATE

-(void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismiss");
    }];
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
