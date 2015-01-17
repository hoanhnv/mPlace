//
//  NVShareFBViewController.m
//  AppDuLich
//
//  Created by hehe on 8/25/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import "NVShareFBViewController.h"

@interface NVShareFBViewController ()

@end

@implementation NVShareFBViewController
@synthesize imageShare = _imageShare;
@synthesize txtComment = _txtComment;


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
    [_txtComment becomeFirstResponder];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupUI{
    
}

- (IBAction)Cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)PostWall:(id)sender{
    [FBSession.activeSession closeAndClearTokenInformation];
    [FBSession.activeSession close];
    [FBSession setActiveSession:nil];
    
    [FBSession openActiveSessionWithPublishPermissions:@[@"publish_actions"] defaultAudience:FBSessionDefaultAudienceFriends allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
        if (!error && status == FBSessionStateOpen) {
            
            NSMutableDictionary* params = [[NSMutableDictionary alloc] init];
            [params setObject:_txtComment.text forKey:@"message"];
            [params setObject:UIImagePNGRepresentation(_imageShare.image) forKey:@"picture"];
            
            [FBRequestConnection startWithGraphPath:@"me/photos"
                                         parameters:params
                                         HTTPMethod:@"POST"
                                  completionHandler:^(FBRequestConnection *connection,
                                                      id result,
                                                      NSError *error)
             {
                 if (error)
                 {
                     //showing an alert for failure
                     //[self alertWithTitle:@"Facebook" message:@"Unable to share the photo please try later."];
                 }
                 else
                 {
                     //showing an alert for success
                     //[UIUtils alertWithTitle:@"Facebook" message:@"Shared the photo successfully"];
                 }
                 //_shareToFbBtn.enabled = YES;
                 
             }];
            [self dismissViewControllerAnimated:YES completion:^{
             
            }];
            
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
