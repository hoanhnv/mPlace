//
//  NVAmNhacViewController.m
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVAmNhacViewController.h"
#import "NVMusicCollectionViewCell.h"
#import "NVGetAmNhacService.h"
#import "MBProgressHUD.h"
#import "SVPullToRefresh.h"
#import "NVAmNhacDetailViewController.h"
#import "NVMusicCurent.h"
#import "NVAmNhacDetailViewController.h"


@interface NVAmNhacViewController ()

@property (nonatomic,strong) NSMutableArray *listMusic;

@end

@implementation NVAmNhacViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.listMusic = [NSMutableArray array];
    [self loadListMusic];
    
    __weak NVAmNhacViewController *weakSelf = self;
    // loadmore
    [self.musicCollectionView addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadListMusic];
        weakSelf.musicCollectionView.showsInfiniteScrolling = YES;
    }];
    
    [self.musicCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NVMusicCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([NVMusicCollectionViewCell class])];
}

- (void) loadListMusic {
    self.noData.hidden = YES;
    NSInteger pageNumber = self.listMusic.count/10 + 1;
    [NVGetAmNhacService getListMusic:pageNumber andCompleSucces:^(id dataResponse) {
        [self.listMusic addObjectsFromArray:dataResponse];
        [self.musicCollectionView reloadData];
        [self.musicCollectionView.infiniteScrollingView stopAnimating];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        if (self.listMusic.count) {
            self.noData.hidden = YES;
        } else {
            self.noData.hidden = NO;
        }
        
    } andFauil:^(NSError *err) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        self.noData.hidden = NO;
        [self.musicCollectionView.infiniteScrollingView stopAnimating];
    }];
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
    NVAmNhacDetailViewController *amnhacDetailViewController = [[NVAmNhacDetailViewController alloc] initWithNibName:NSStringFromClass([NVAmNhacDetailViewController class]) bundle:nil];
    NVMusicCurent *musicCurentObject = [self.listMusic objectAtIndex:indexPath.row];
    amnhacDetailViewController.musicObject = musicCurentObject;
    [self.navigationController pushViewController:amnhacDetailViewController animated:YES];
}


- (IBAction)showLeftMenu:(id)sender {
    [Appdelegate toggleMenu];
}
@end
