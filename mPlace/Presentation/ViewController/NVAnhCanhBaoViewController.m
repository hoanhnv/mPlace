//
//  NVAnhCanhBaoViewController.m
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVAnhCanhBaoViewController.h"

@interface NVAnhCanhBaoViewController ()

@end

@implementation NVAnhCanhBaoViewController

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
- (IBAction)showLeftMenu:(id)sender {
    
    [Appdelegate toggleMenu];
}
-(void)doSearch:(id)sender{
    
}
- (IBAction)doDanganh:(id)sender {
    NVDangAnhViewController *dangAnhVC = [[NVDangAnhViewController alloc]initWithNibName:@"NVDangAnhViewController" bundle:nil];
    [self.navigationController pushViewController:dangAnhVC animated:YES];
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
