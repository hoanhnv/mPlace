//
//  NVYTuongViewController.h
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVDangYTuongViewController.h"
@interface NVYTuongViewController : UIViewController{
    
}

@property (weak, nonatomic) IBOutlet UICollectionView *listYtuongCollectionView;

@property (weak, nonatomic) IBOutlet UILabel *lbIndicator;
- (IBAction)doTabClick:(id)sender;
- (IBAction)doDangYtuongClick:(id)sender;

- (IBAction)showLeftMenu:(id)sender;
- (IBAction)doSearch:(id)sender;
@end
