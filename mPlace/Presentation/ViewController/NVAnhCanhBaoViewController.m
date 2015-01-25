//
//  NVAnhCanhBaoViewController.m
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVAnhCanhBaoViewController.h"
#import "NVGetAnhCanhBaoService.h"
#import "NVAnhCollectionViewCell.h"
#import "NVImageDoatGiai.h"
#import "NVCollectionViewAlignLayout.h"
#import "SVPullToRefresh.h"
#import "MBProgressHUD.h"
#import "NVAnhChiTietViewController.h"

#define CellWidth 148
#define CellAnhHeight 180

@interface NVAnhCanhBaoViewController ()
@property (nonatomic,strong) NSMutableArray *listImageWarning;
@property (nonatomic,strong) NSMutableArray *listDate;
@end

@implementation NVAnhCanhBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showHUDAddedTo:self.listImageCollectionView animated:YES];
    self.listImageWarning = [NSMutableArray array];
    self.listDate = [NSMutableArray array];
        self.btnDate.layer.cornerRadius = 4.0f;
    [self setupCollectioView];
    [self loadListImageWarning];
    
    
    __weak NVAnhCanhBaoViewController *weakSelf = self;
    // loadmore
    [self.listImageCollectionView addInfiniteScrollingWithActionHandler:^{
            [weakSelf loadListImageWarning];
            weakSelf.listImageCollectionView.showsInfiniteScrolling = YES;
    }];
}

- (IBAction)showLeftMenu:(id)sender { 
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)doSearch:(id)sender{
    
}

- (NSMutableArray*)getYear
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear) fromDate:[NSDate date]];
    NSInteger year = [components year];
    NSMutableArray *arr =[[NSMutableArray alloc]init ];
    while (year>=1920) {
        [arr addObject:[NSNumber numberWithInt:year]];
        year--;
    }
    return arr;
}

- (NSMutableArray*)getMonth{
    NSMutableArray*monthList=[[NSMutableArray alloc]init ];
    for (int i=1;i<=12; i++) {
        [monthList addObject:[NSNumber numberWithInt:i]];
    }
    return monthList;
}

- (IBAction)doDanganh:(id)sender {
    NVDangAnhViewController *dangAnhVC = [[NVDangAnhViewController alloc]initWithNibName:@"NVDangAnhViewController" bundle:nil];
    [self.navigationController pushViewController:dangAnhVC animated:YES];
}

- (IBAction)dateButtonPressed:(id)sender {
    
    if (!self.listDate.count) {
        NSMutableArray *listYear = [self getYear];
        NSMutableArray *listMonth = [self getMonth];
        
        for (int i = 0;i < listYear.count; i++) {
            NSString *date = nil;
            for (int index = 0; index < listMonth.count; index ++) {
                date = [NSString stringWithFormat:@"%@/%@",[listMonth objectAtIndex:index],[listYear objectAtIndex:i]];
                [self.listDate addObject:date];
            }
        }
    }
    
    if(dropDown == nil) {
        UIButton *btn =(UIButton*)sender;
        CGFloat f =self.view.frame.size.height - btn.frame.origin.y -btn.frame.size.height-10;
        dropDown = [[NIDropDown alloc]showDropDown:sender :&f :nil :self.listDate :@"down"];
        dropDown.delegate = self;
    }
    else {
        [dropDown hideDropDown:sender];
        [self rel];
    }
}

- (void) loadListImageWarning {
    self.noDataImage.hidden = YES;
    NSInteger page = self.listImageWarning.count/20 +1;
    [NVGetAnhCanhBaoService getListImageWarning:page withPageSize:20 withMonth:1 withYear:2015 andSuccess:^(id dataResponse) {
        [self.listImageWarning addObjectsFromArray:dataResponse];
        [self.listImageCollectionView reloadData];
        [self.listImageCollectionView.infiniteScrollingView stopAnimating];
        [MBProgressHUD hideAllHUDsForView:self.listImageCollectionView animated:YES];
        if (self.listImageWarning.count) {
            self.noDataImage.hidden = YES;
        } else {
            self.noDataImage.hidden = NO;
        }
    } andFailure:^(NSError *err) {
        [MBProgressHUD hideAllHUDsForView:self.listImageCollectionView animated:YES];
        [self.listImageCollectionView.infiniteScrollingView stopAnimating];
    }];
}

#pragma mark - UICollectionViewDataSource Methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.listImageWarning.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NVAnhCollectionViewCell *cell = (NVAnhCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NVAnhCollectionViewCell class]) forIndexPath:indexPath];
    NVImageDoatGiai *imageObject = [self.listImageWarning objectAtIndex:indexPath.row];
    [cell configCellWithObject:imageObject];
    return cell;
    
    
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CellWidth, CellAnhHeight);
    //    return [[NVAnhCollectionViewCell new]getCellSizeWithItem:indexPath.row];
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [dropDown hideDropDown:self.btnDate];
    NVAnhChiTietViewController*chitietVC = [[NVAnhChiTietViewController alloc]initWithNibName:@"NVAnhChiTietViewController" bundle:nil];
    chitietVC.objectPresentation = (NVImageDoatGiai*) [self.listImageWarning objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:chitietVC animated:YES];
}

-(void)setupCollectioView{
    NVCollectionViewAlignLayout *layoutAnh = [[NVCollectionViewAlignLayout alloc]init];
    layoutAnh.minimumInteritemSpacing = 8.0f;
    //flowLayout.minimumLineSpacing = 10.0f;
    layoutAnh.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layoutAnh.itemSize = CGSizeMake(CellWidth, CellAnhHeight);
    layoutAnh.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.listImageCollectionView.collectionViewLayout = layoutAnh;
    [self.listImageCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NVAnhCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([NVAnhCollectionViewCell class])];
}

#pragma mark - NilDropdown delegate

- (void) niDropDownDelegateMethod: (NIDropDown *) sender {
    [self rel];
}

-(void)rel{
    dropDown = nil;
}

@end
