//
//  NVAmNhacDetailViewController.h
//  mPlace
//
//  Created by MAC on 1/21/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVMusicCurent.h"
#import <MediaPlayer/MediaPlayer.h>


@interface NVAmNhacDetailViewController : UIViewController

@property (nonatomic,strong) NVMusicCurent *musicObject;


@property (weak, nonatomic) IBOutlet UICollectionView *musicColectionView;

@property (weak, nonatomic) IBOutlet UIImageView *musicImageView;
@property (weak, nonatomic) IBOutlet UILabel *musicTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *numberViewLable;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;
@property (weak, nonatomic) IBOutlet UILabel *noData;
@property (nonatomic,strong) MPMoviePlayerController *moviePlayer;


- (IBAction)backButtonPressed:(id)sender;


@end
