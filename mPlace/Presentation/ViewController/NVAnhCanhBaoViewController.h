//
//  NVAnhCanhBaoViewController.h
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVDangAnhViewController.h"
@interface NVAnhCanhBaoViewController : UIViewController{
    
}

@property (weak, nonatomic) IBOutlet UICollectionView *listImageCollectionView;

- (IBAction)showLeftMenu:(id)sender;
- (IBAction)doSearch:(id)sender;
- (IBAction)doDanganh:(id)sender;

@end
