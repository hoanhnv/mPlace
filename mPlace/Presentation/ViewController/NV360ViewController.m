//
//  NV360ViewController.m
//  mPlace
//
//  Created by hoanhnv on 14/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NV360ViewController.h"
#import "NVAnhCanhBaoViewController.h"
#import "NVYTuongViewController.h"
#import "NVAnhCollectionViewCell.h"
#import "NVYtuongCollectionViewCell.h"
#import "NVCollectionViewAlignLayout.h"
#import "NVThuVienViewController.h"
#import "NVGetHome360Service.h"
#import "NVYTuongChiTietViewController.h"
#import "NVAnhChiTietViewController.h"
#import "NVRuleViewController.h"
#import "NVIdeasAward.h"
#import "NVBienBaoViewController.h"

#define TagCollectionViewAnh 226
#define TagCollectionViewYtuong 227
#define CellWidth 148
#define CellAnhHeight 180
#define CellYtuongHeight 110
#define CellIDAnh @"cellIdAnh"
#define CellIDYtuong @"cellIdYtuong"

@interface NV360ViewController ()
@property (nonatomic,strong) NSMutableArray *slideListRoot;
@property (nonatomic,strong) NSMutableArray *lstImageMost;
@property (nonatomic,strong) NSMutableArray *lstImageRandom;
@property (nonatomic,strong) NSMutableArray *lstIdeaMost;
@end

@implementation NV360ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self prepareComponentViews];
    [self setupCollectioView];
    [self loadDataToComponentViews];
    
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
    CGRect rectMain = [UIScreen mainScreen].bounds;
    self.vSlideShow.frame = CGRectMake(0, 0, 320,150);
    [self.vMainView addSubview:self.vSlideShow];
    
    self.previourtButton.frame = CGRectMake(0, 52, 30, 45);
    self.nextButton.frame      = CGRectMake(290,52,30, 45);
    [self.vMainView addSubview:self.previourtButton];
    [self.vMainView addSubview:self.nextButton];
    
    self.vMenuButton.frame = CGRectMake(0, CGRectGetMaxY(self.vSlideShow.frame), rectMain.size.width, 78);
    [self.vMainView addSubview:self.vMenuButton];
    
    self.vImageMost.frame = CGRectMake(0, CGRectGetMaxY(self.vMenuButton.frame) +8, rectMain.size.width, 425);
    [self.vMainView addSubview:self.vImageMost];
    
    self.vIdeaMost.frame = CGRectMake(0, CGRectGetMaxY(self.vImageMost.frame) + 2, rectMain.size.width, 276);
    [self.vMainView addSubview:self.vIdeaMost];
    
    self.vMenuBottom.frame = CGRectMake(0, CGRectGetMaxY(self.vIdeaMost.frame), rectMain.size.width, 120);
    [self.vMainView addSubview:self.vMenuBottom];
    
    [self.vMainView setContentSize:CGSizeMake(rectMain.size.width, CGRectGetMaxY(self.vMenuBottom.frame)+20)];
}
-(void)loadDataToComponentViews{
    serviceAPI = [[NVHome360BO alloc]init];
    [self reloadAnhDoatGiai];
    [self reloadYtuongDoatGiai];
    [self reloadAnhRandom];
    
}
-(void)setupCollectioView{
    NVCollectionViewAlignLayout *layoutAnh = [[NVCollectionViewAlignLayout alloc]init];
    layoutAnh.minimumInteritemSpacing = 8.0f;
    //flowLayout.minimumLineSpacing = 10.0f;
    layoutAnh.sectionInset = UIEdgeInsetsMake(6.0, 0, 8.0, 0);
    layoutAnh.itemSize = CGSizeMake(CellWidth, CellAnhHeight);
    layoutAnh.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.listImageCollectionView.collectionViewLayout = layoutAnh;
    [self.listImageCollectionView registerNib:[UINib nibWithNibName:@"NVAnhCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:CellIDAnh];
    
    NVCollectionViewAlignLayout *layoutYtuong = [[NVCollectionViewAlignLayout alloc]init];
    layoutYtuong.minimumInteritemSpacing = 8.0;
    //flowLayout.minimumLineSpacing = 10.0f;
    layoutYtuong.sectionInset = UIEdgeInsetsMake(6.0f, 0, 8.0f, 0);
    layoutYtuong.itemSize = CGSizeMake(CellWidth, CellYtuongHeight);
    layoutYtuong.scrollDirection = UICollectionViewScrollDirectionVertical;

    self.listYtuongCollectionView.collectionViewLayout = layoutYtuong;
    [self.listYtuongCollectionView registerNib:[UINib nibWithNibName:@"NVYtuongCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:CellIDYtuong];
}

-(void)reloadAnhDoatGiai{
    self.lstImageMost = [NSMutableArray array];
    [serviceAPI getAnhDoatGiai:^(NSMutableArray* lstData){
        self.lstImageMost = (NSMutableArray*)lstData;
        [self.listImageCollectionView reloadData];
    } andFailure:^(NSError *err){
        NSLog(@"No data");
    }];
}
-(void)reloadAnhRandom{
    self.lstIdeaMost = [NSMutableArray array];
    [serviceAPI getRandomImage:^(NSMutableArray* lstData){
        self.lstImageRandom = (NSMutableArray*)lstData;
        [self loadListSlideShowImageView];
    } andFailure:^(NSError *err){
        NSLog(@"No data");
    }];
}
-(void)reloadYtuongDoatGiai{
    self.lstIdeaMost = [NSMutableArray array];
    [serviceAPI getYTuongDoatGiai:^(NSMutableArray* lstData){
        self.lstIdeaMost = (NSMutableArray*)lstData;
        [self.listYtuongCollectionView reloadData];
    } andFailure:^(NSError *err){
        NSLog(@"No data");
    }];
}
- (void) loadListSlideShowImageView {
    self.vSlideShow.type = iCarouselTypeRotary;
    self.vSlideShow.decelerationRate = 0.5;
    self.slideListRoot = [NSMutableArray array];
    for (int i = 0; i<[self.lstImageRandom count]; i++) {
        NVImageRandom *objRandom = ((NVImageRandom*)[self.lstImageRandom objectAtIndex:i]);
        [self.slideListRoot addObject:[objRandom getUrlImage]];
    }
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3
                                                  target:self
                                                selector:@selector(autoScroll)
                                                userInfo:nil
                                                 repeats:YES];
    
    [self.vSlideShow reloadData];
}

#pragma mark - UICollectionViewDataSource Methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.tag == TagCollectionViewAnh) {
        [self.lstImageMost count];
    }
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float heightCell;
    if (collectionView.tag == TagCollectionViewAnh) {
        NVAnhCollectionViewCell *cell = (NVAnhCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIDAnh
                                                                                                             forIndexPath:indexPath];
        if ([self.lstImageMost count]) {
            heightCell = [cell configCellWithObject:[self.lstImageMost objectAtIndex:indexPath.row]];
        }
        return cell;
    }
    else{
        NVYtuongCollectionViewCell *cell = (NVYtuongCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIDYtuong
                                                                                                                   forIndexPath:indexPath];
        if ([self.lstIdeaMost count]) {
            [cell configCellWithObject:[self.lstIdeaMost objectAtIndex:indexPath.row]];
        }
        return cell;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:
(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView.tag == TagCollectionViewAnh) {
         return CGSizeMake(CellWidth,CellAnhHeight);
    }
    if (collectionView.tag == TagCollectionViewYtuong) {
        return CGSizeMake(CellWidth,CellYtuongHeight);
    }
    return CGSizeZero;
//    return [[NVAnhCollectionViewCell new]getCellSizeWithItem:indexPath.row];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == TagCollectionViewAnh) {
        NVAnhChiTietViewController*chitietVC = [[NVAnhChiTietViewController alloc]initWithNibName:@"NVAnhChiTietViewController" bundle:nil];
        chitietVC.objectPresentation = (NVImageDoatGiai*) [self.lstImageMost objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:chitietVC animated:YES];
    }
    if (collectionView.tag == TagCollectionViewYtuong) {
        NVYTuongChiTietViewController *chitietVC = [[NVYTuongChiTietViewController alloc]initWithNibName:@"NVYTuongChiTietViewController" bundle:nil];
        chitietVC.objectPresentation = (NVIdeasAward*) [self.lstIdeaMost objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:chitietVC animated:YES];

    }
  }

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    return 10;
//}
//// Layout: Set Edges
//- (UIEdgeInsets)collectionView:
//(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    
//    return UIEdgeInsetsMake(0, 0, 0, 0);  // top, left, bottom, right
//}

- (IBAction)showLeftMenu:(id)sender {

    [Appdelegate toggleMenu];
}

- (IBAction)doSearch:(id)sender {
    
}

- (IBAction)doClickMenuButton:(id)sender {
     UIButton *btn = (UIButton*)sender;
    switch (btn.tag) {
        case 101:
        {
            NVDangAnhViewController *dangAnhVC = [[NVDangAnhViewController alloc]initWithNibName:@"NVDangAnhViewController" bundle:nil];
            [self.navigationController pushViewController:dangAnhVC animated:YES];
            break;
        }
        case 102:
        {
            NVDangYTuongViewController *dangYtuongVC = [[NVDangYTuongViewController alloc]initWithNibName:@"NVDangYTuongViewController" bundle:nil];
            [self.navigationController pushViewController:dangYtuongVC animated:YES];
            break;
        }
        case 103:
        {
            NVThuVienViewController *thuVienVC = [[NVThuVienViewController alloc]initWithNibName:@"NVThuVienViewController" bundle:nil];
            [self.navigationController pushViewController:thuVienVC animated:YES];
            break;
        }
        case 104:
        {
            NVBienBaoViewController *bienBaoViewController = [[NVBienBaoViewController alloc] initWithNibName:NSStringFromClass([NVBienBaoViewController class]) bundle:nil];
            [self.navigationController pushViewController:bienBaoViewController animated:YES];
            break;
        }
        default:
            break;
    }
}

- (IBAction)doClickMenuBottom:(id)sender {
    UIButton *btn = (UIButton*)sender;
    switch (btn.tag) {
        case 105:
        {
            NVDangAnhViewController *dangAnhVC = [[NVDangAnhViewController alloc]initWithNibName:@"NVDangAnhViewController" bundle:nil];
            [self.navigationController pushViewController:dangAnhVC animated:YES];
            break;
        }
        case 106:
        {
            NVDangYTuongViewController *dangYtuongVC = [[NVDangYTuongViewController alloc]initWithNibName:@"NVDangYTuongViewController" bundle:nil];
            [self.navigationController pushViewController:dangYtuongVC animated:YES];
            break;
        }
        case 107:
        {
            NVRuleViewController *ruleVC = [[NVRuleViewController alloc]initWithNibName:@"NVRuleViewController" bundle:nil];
            [self.navigationController pushViewController:ruleVC animated:YES];
            break;
        }
        default:
            break;
    }
}

- (IBAction)nextOrPreviourSlideImageViewPreessed:(id)sender {
    UIButton *btn = (UIButton*)sender;
    NSInteger index = self.vSlideShow.currentItemIndex;
    if (btn == self.nextButton) {
         index += 1;
    } else {
        index -= 1;
    }
    [self.vSlideShow scrollToItemAtIndex:index animated:YES];
}

- (IBAction)doViewAll:(id)sender {
    UIButton *btn = (UIButton*)sender;
    if (btn.tag == 662) {
        NVAnhCanhBaoViewController *anhCanhBaoVC = [[NVAnhCanhBaoViewController alloc]initWithNibName:@"NVAnhCanhBaoViewController" bundle:nil];
        [self.navigationController pushViewController:anhCanhBaoVC animated:YES];
        
    }
    else if (btn.tag == 663){
        NVYTuongViewController *yTuongVC = [[NVYTuongViewController alloc]initWithNibName:@"NVYTuongViewController" bundle:nil];
        [self.navigationController pushViewController:yTuongVC animated:YES];
        
    }
}

#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return self.slideListRoot.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UIImageView *imageView = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, 199.0f)];
        view.backgroundColor = [UIColor lightGrayColor];
        view.contentMode = UIViewContentModeScaleToFill;
        
        imageView = [[UIImageView alloc] initWithFrame:view.bounds];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.tag = 1;
        [view addSubview:imageView];
    }
    else {
        //get a reference to the label in the recycled view
        imageView = (UIImageView *)[view viewWithTag:1];
    }
    NSString *slideImageString = self.slideListRoot[index];
    [imageView setImageWithURL:[NSURL URLWithString:slideImageString] placeholderImage:[UIImage imageNamed:@"mPlace"]];
    
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.1f;
    }
    return value;
}

- (void)carouselDidScroll:(iCarousel *)carousel {
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4
                                                  target:self
                                                selector:@selector(autoScroll)
                                                userInfo:nil
                                                 repeats:YES];
}

// auto scroll slide
- (void)autoScroll {
    
    NSInteger index = self.vSlideShow.currentItemIndex + 1;
    if (index >= 3) {
        index = 0;
    }
    
    [self.vSlideShow scrollToItemAtIndex:index animated:YES];
    
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    
}


@end
