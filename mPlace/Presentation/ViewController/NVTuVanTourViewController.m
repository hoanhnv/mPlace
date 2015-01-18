//
//  NVTuVanTourViewController.m
//  mPlace
//
//  Created by hoanhnv on 10/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVTuVanTourViewController.h"

@interface NVTuVanTourViewController ()

@end

@implementation NVTuVanTourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
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
    return 4;
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
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeZero;
    //    return [[NVAnhCollectionViewCell new]getCellSizeWithItem:indexPath.row];
}

@end
