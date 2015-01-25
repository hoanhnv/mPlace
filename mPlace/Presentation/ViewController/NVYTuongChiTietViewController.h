//
//  NVYTuongChiTietViewController.h
//  mPlace
//
//  Created by hoanhnv on 14/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVIdeasAward.h"

@interface NVYTuongChiTietViewController : UIViewController
@property (strong, nonatomic) NVIdeasAward *objectPresentation;

- (IBAction)doDangYtuongClick:(id)sender;
- (IBAction)showLeftMenu:(id)sender;
- (IBAction)doSearch:(id)sender;
@end
