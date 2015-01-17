//
//  NVShareFBViewController.h
//  AppDuLich
//
//  Created by hehe on 8/25/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NVShareFBViewController : UIViewController



@property(nonatomic, strong) IBOutlet UITextView * txtComment;
@property(nonatomic, strong) IBOutlet UIImageView * imageShare;

- (void)setupUI;
@end
