//
//  NVAmNhacViewController.h
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NVAmNhacViewController : UIViewController


- (IBAction)showLeftMenu:(id)sender;


@property (weak, nonatomic) IBOutlet UICollectionView *musicCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *noData;


@end
