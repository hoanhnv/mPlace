//
//  NV360ViewController.h
//  mPlace
//
//  Created by hoanhnv on 14/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "NVHome360BO.h"
#import "NVImageRandom.h"
@interface NV360ViewController : UIViewController{
    NVHome360BO *serviceAPI;
}
@property (weak, nonatomic) IBOutlet UIView *vTopHeader;
@property (weak, nonatomic) IBOutlet UIScrollView *vMainView;
@property (weak, nonatomic) IBOutlet iCarousel *vSlideShow;
@property (weak, nonatomic) IBOutlet UIButton *previourtButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (strong, nonatomic) IBOutlet UIView *vMenuButton;
@property (weak, nonatomic) IBOutlet UICollectionView *listImageCollectionView;
@property (strong, nonatomic) IBOutlet UIView *vImageMost;
@property (weak, nonatomic) IBOutlet UICollectionView *listYtuongCollectionView;
@property (strong, nonatomic) IBOutlet UIView *vIdeaMost;
@property (strong, nonatomic) IBOutlet UIView *vMenuBottom;
@property (nonatomic,strong) NSTimer *timer;

- (IBAction)showLeftMenu:(id)sender;
- (IBAction)doSearch:(id)sender;
- (IBAction)doClickMenuButton:(id)sender;
- (IBAction)doClickMenuBottom:(id)sender;
- (IBAction)nextOrPreviourSlideImageViewPreessed:(id)sender;

- (IBAction)doViewAll:(id)sender;



@end
