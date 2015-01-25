//
//  NVAmNhacDetailViewController.m
//  mPlace
//
//  Created by MAC on 1/21/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVAmNhacDetailViewController.h"
#import "NVGetAmNhacService.h"
#import "NVMusicCollectionViewCell.h"
#import "MBProgressHUD.h"
#import "SVPullToRefresh.h"

@interface NVAmNhacDetailViewController ()
@property (nonatomic,strong) NSMutableArray *listMusic;
@end

@implementation NVAmNhacDetailViewController

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
    
    [self loadData];
    
    __weak NVAmNhacDetailViewController *weakSelf = self;
    // loadmore
    [self.musicColectionView addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadDetailMusic];
        weakSelf.musicColectionView.showsInfiniteScrolling = YES;
    }];
    
    [self.musicColectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NVMusicCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([NVMusicCollectionViewCell class])];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPlayer)];
    singleTap.numberOfTapsRequired = 1;
    [self.musicImageView setUserInteractionEnabled:YES];
    [self.musicImageView addGestureRecognizer:singleTap];
    
}

- (void) loadData {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self updateUi];
    self.listMusic = [NSMutableArray array];
    [self loadDetailMusic];
}

-(void)showPlayer {
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:self.musicObject.videoUrl]];
    [[_moviePlayer view] setFrame:[[self view] bounds]];
    [[self view] addSubview: [_moviePlayer view]];
    [_moviePlayer setFullscreen:YES animated:YES];
    _moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    [_moviePlayer play];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(doneButtonClick:)
                                                 name:MPMoviePlayerWillExitFullscreenNotification
                                               object:nil];
}

- (IBAction)doneButtonClick:(NSNotification*) notf {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerDidEnterFullscreenNotification object:nil];
    [self.moviePlayer stop];
    [self.moviePlayer.view removeFromSuperview];
    self.moviePlayer = nil;
}


- (void) loadDetailMusic {
   [NVGetAmNhacService getMusicDetail:self.musicObject andCompleSucces:^(id dataResponse) {
       [self updateUi];
       [self.listMusic addObjectsFromArray:dataResponse];
       [self.musicColectionView reloadData];
       [self.musicColectionView.infiniteScrollingView stopAnimating];
       [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
       
       if (self.listMusic.count) {
           self.noData.hidden = YES;
       } else {
           self.noData.hidden = NO;
       }
       
   } andFauil:^(NSError *err) {
       [self.musicColectionView.infiniteScrollingView stopAnimating];
       [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
   }];
}

- (void) updateUi {
    self.musicTitleLable.text = self.musicObject.disPlayName;
    self.numberViewLable.text = self.musicObject.numberView;
    self.dateLable.text       = self.musicObject.createDate;
    [self.musicImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,self.musicObject.imageUrl]] placeholderImage:[UIImage imageNamed:@"mPlace"]]; 
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UICollectionViewDataSource Methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.listMusic.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NVMusicCollectionViewCell *cell = (NVMusicCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NVMusicCollectionViewCell class]) forIndexPath:indexPath];
    NVMusicCurent *music = [self.listMusic objectAtIndex:indexPath.row];
    [cell setCellWitData:music];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(148, 180);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.musicObject = [self.listMusic objectAtIndex:indexPath.row];
    [self loadData];
    
}

@end
