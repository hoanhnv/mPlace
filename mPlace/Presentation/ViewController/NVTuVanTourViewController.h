//
//  NVTuVanTourViewController.h
//  mPlace
//
//  Created by hoanhnv on 10/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NVTuVanTourViewController : UIViewController{
    
}
@property (weak, nonatomic) IBOutlet UIView *vHeaderBG;
@property (weak, nonatomic) IBOutlet UIView *vMiddleBG;
@property (weak, nonatomic) IBOutlet UICollectionView *tourCollectionView;

- (IBAction)showLeftMenu:(id)sender;

@end
