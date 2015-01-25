//
//  NVTuVanTourViewController.m
//  mPlace
//
//  Created by hoanhnv on 10/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVTuVanTourViewController.h"
#import "NVTourCollectionViewCell.h"
#import "NVCollectionViewAlignLayout.h"
#import "NVGetTuVanTourService.h"
#import "NVTour.h"
#import "SVPullToRefresh.h"
#import "MBProgressHUD.h"
#import "NVTuVanTourChiTietViewController.h"

#define CellWidthTourt 148
#define CellHeigTour 204


@interface NVTuVanTourViewController ()
@property (nonatomic,strong) NSMutableArray *listTour;
@end

@implementation NVTuVanTourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.listTour = [NSMutableArray array];
    [self setupCollectioView];
    [self loadListTour];
    
    __weak NVTuVanTourViewController *weakSelf = self;
    // loadmore
    [self.tourCollectionView addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadListTour];
        weakSelf.tourCollectionView.showsInfiniteScrolling = YES;
    }];
}

- (void) showLeftMenu:(id)sender {
    [Appdelegate toggleMenu];
}

- (void) loadListTour {
    NSInteger pageNumber = self.listTour.count/10 + 1;
    self.noData.hidden = YES;
    [NVGetTuVanTourService getListTour:pageNumber andCompleSucces:^(id dataResponse) {
        [self.listTour addObjectsFromArray:dataResponse];
        [self.tourCollectionView reloadData];
        if (self.listTour.count) {
            self.noData.hidden = YES;
        } else {
            self.noData.hidden = NO;
        }
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self.tourCollectionView.infiniteScrollingView stopAnimating];
    } andFauil:^(NSError *err) {
        if (self.listTour.count) {
            self.noData.hidden = YES;
        } else {
            self.noData.hidden = NO;
        }
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self.tourCollectionView.infiniteScrollingView stopAnimating];
    }];
}

-(void)prepareComponentViews{
    self.vMiddleBG.backgroundColor = [UIColor colorWithRed:231.0f/255 green:66/255.0f blue:37/255.0f alpha:1.0];
}


#pragma mark - UICollectionViewDataSource Methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.listTour.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    float heightCell;
    //    if (collectionView.tag == TagCollectionViewAnh) {
    //        NVAnhCollectionViewCell *cell = (NVAnhCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIDAnh forIndexPath:indexPath];
    //        heightCell = [cell configCellWithObject:indexPath.row];
    //        return cell;
    //    }
    //    else{
    //        NVYtuongCollectionViewCell *cell = (NVYtuongCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIDYtuong forIndexPath:indexPath];
    //        [cell configCellWithObject:nil];
    //        return cell;
    //    }
    
    
        NVTourCollectionViewCell *cell = (NVTourCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NVTourCollectionViewCell class]) forIndexPath:indexPath];
    NVTour *tourObject = [self.listTour objectAtIndex:indexPath.row];
        [cell setCellData:tourObject];
        return cell; 
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CellWidthTourt, CellHeigTour);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NVTuVanTourChiTietViewController*chitietVC = [[NVTuVanTourChiTietViewController alloc]initWithNibName:@"NVTuVanTourChiTietViewController" bundle:nil];
    chitietVC.tourObejct = [self.listTour objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:chitietVC animated:YES];
}


-(void)setupCollectioView{
//    NVCollectionViewAlignLayout *layoutAnh = [[NVCollectionViewAlignLayout alloc]init];
//    layoutAnh.minimumInteritemSpacing = 8.0f;
//    //flowLayout.minimumLineSpacing = 10.0f;
//    layoutAnh.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    layoutAnh.itemSize = CGSizeMake(CellWidthTourt, CellHeigTour);
//    layoutAnh.scrollDirection = UICollectionViewScrollDirectionVertical;
    
//    self.tourCollectionView.collectionViewLayout = layoutAnh;
    [self.tourCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NVTourCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([NVTourCollectionViewCell class])];
}


@end
