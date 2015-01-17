//
//  NVAnhChiTietViewController.m
//  mPlace
//
//  Created by hoanhnv on 14/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVAnhChiTietViewController.h"
#import "NVImageCollectionViewCell.h"

@interface NVAnhChiTietViewController ()

@end

@implementation NVAnhChiTietViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)initComponentViews{
    CGRect fmain = self.mainScrollView.frame;
    
    [self vDetailLayout];
    [self vImageListLayout];
    
    [self.mainScrollView addSubview:self.vDetail];
    
    self.vImageList.frame = CGRectMake(fmain.origin.x, CGRectGetMaxY(self.vDetail.frame), fmain.size.width,151);
    [self.mainScrollView addSubview:self.vImageList];
    
}

-(void)vDetailLayout{
    // config title and label
}

-(void)vImageListLayout{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.imageCollectionView setPagingEnabled:YES];
    [self.imageCollectionView setCollectionViewLayout:flowLayout];
    [self.imageCollectionView registerNib:[UINib nibWithNibName:@"NVImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"imageCell"];
}
#pragma mark - UICollectionView Datasource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 25;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NVImageCollectionViewCell *cell =(NVImageCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    cell.imgContent.image = [UIImage imageNamed:@"banner_2_2.png"];
    cell.imgContent.layer.cornerRadius = 4.0f;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    // open poup image
}
// Layout: Set cell size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(94, 100);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 11;
}
// Layout: Set Edges
//- (UIEdgeInsets)collectionView:
//(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    
//    return UIEdgeInsetsMake(15.3,15.3,15.3,15.3);  // top, left, bottom, right
//}


- (IBAction)tapTopMenu:(id)sender {
}

- (IBAction)tapDangAnh:(id)sender {
}
@end
