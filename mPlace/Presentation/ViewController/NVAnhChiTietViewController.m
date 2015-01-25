//
//  NVAnhChiTietViewController.m
//  mPlace
//
//  Created by hoanhnv on 14/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVAnhChiTietViewController.h"
#import "NVImageCollectionViewCell.h"
#import "NVGetAnhCanhBaoService.h"
#import "NVDangAnhViewController.h"


@interface NVAnhChiTietViewController ()

@end

@implementation NVAnhChiTietViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.imageList =[NSArray array];
    [self vImageListLayout];
   
    [self initComponentViews];
     [self loadImageDetail];
}

-(void)initComponentViews{
    CGRect fmain = self.mainScrollView.frame;
   
    
    [self.mainScrollView addSubview:self.vDetail];
    
    self.vImageList.frame = CGRectMake(0, CGRectGetMaxY(self.vDetail.frame), fmain.size.width,151);
    [self.mainScrollView addSubview:self.vImageList];
}
-(void)loadImageDetail{
    [NVGetAnhCanhBaoService anhCanhBaoChiTiet:self.objectPresentation.iID andComple:^(id data){
            self.objectPresentation = data;
            [self vDetailLayout];
             self.imageList = self.objectPresentation.images;
            self.imageList =[NSArray arrayWithObjects:@"/backend/www/upload/3/20141219123048-1851036704.jpg",@"/backend/www/upload/3/20141219123048-1851036704.jpg",@"backend/www/upload/3/20141219123048-1851036704.jpg", nil];
            [self.imageCollectionView reloadData];
    } andFailure:^(NSError *err){}];

}
-(void)vDetailLayout{
    // config title and label
    
    [self.lbTitle setTitle:self.objectPresentation.title forState:UIControlStateNormal];
    self.lbDiaDiem.text = self.objectPresentation.address;
    self.lbDate.text    = self.objectPresentation.created_at;
    self.lbContent.text = self.objectPresentation.content;
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
    return [self.imageList count];;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NVImageCollectionViewCell *cell =(NVImageCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,[self.imageList objectAtIndex:indexPath.row]]];
   // [cell.imgContent setImage:[UIImage imageNamed:@"ic_panorama.png"]];
    [cell.imgContent setImageWithURL:url];
  //  cell.imgContent.layer.cornerRadius = 4.0f;
    return cell;
}
// Layout: Set cell size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(94, 100);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 11;
}

- (IBAction)tapTopMenu:(id)sender {
    [Appdelegate toggleMenu];
}

- (IBAction)tapDangAnh:(id)sender {
    NVDangAnhViewController *dangAnhVC = [[NVDangAnhViewController alloc]initWithNibName:@"NVDangAnhViewController" bundle:nil];
    [self.navigationController pushViewController:dangAnhVC animated:YES];
}

@end
