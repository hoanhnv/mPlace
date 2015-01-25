//
//  NVBienBaoDetailViewController.h
//  mPlace
//
//  Created by MAC on 1/23/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVTrafficSign.h"

@interface NVBienBaoDetailViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *displayNameLable;
@property (weak, nonatomic) IBOutlet UILabel *numberWarning;
@property (weak, nonatomic) IBOutlet UILabel *disPlayWarning;
@property (weak, nonatomic) IBOutlet UIImageView *warningImageView;
@property (weak, nonatomic) IBOutlet UITextView *DescriptionWarning;
@property (nonatomic,strong) NVTrafficSign *traficSing;

- (IBAction)doBackView:(id)sender;

@end
