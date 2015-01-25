//
//  NVBienBaoViewController.m
//  mPlace
//
//  Created by MAC on 1/22/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVBienBaoViewController.h"
#import "NVGetBienBaoSerVice.h"
#import "NVTrafficSign.h"
#import "NVBienBaoCollectionViewCell.h"
#import "MBProgressHUD.h"
#import "SVPullToRefresh.h"
#import "NVBienBaoDetailViewController.h"
#import "NVTrafficSubCategory.h"

@interface NVBienBaoViewController ()
@property (nonatomic,strong) NSMutableArray *listTraficDuongBo;
@property (nonatomic,strong) NSMutableArray *listTraficDuongSat;
@property (nonatomic,strong) NSMutableArray *listTraficDuongThuy;
@property (nonatomic,strong) NSMutableArray *listTraficDuongHangKhong;
@property (nonatomic,strong) NSMutableArray *listDanhMuc;
@end

@implementation NVBienBaoViewController

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
     self.btnDanhMuc.layer.cornerRadius = 4.0f;
    [self.bienbaoCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NVBienBaoCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([NVBienBaoCollectionViewCell class])]; 
    self.listTraficDuongBo = [NSMutableArray array];
    self.listTraficDuongHangKhong = [NSMutableArray array];
    self.listTraficDuongSat = [NSMutableArray array];
    self.listTraficDuongThuy = [NSMutableArray array];
    self.listDanhMuc = [NSMutableArray array];
    [self loadViewWithTab:200];
    
    
    __weak NVBienBaoViewController *weakSelf = self;
    // loadmore
    [self.bienbaoCollectionView addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadMore];
        weakSelf.bienbaoCollectionView.showsInfiniteScrolling = YES;
    }];
    
    
}
-(void)loadDanhMuc{
    NVTrafficSubCategory *fisrtObject = [NVTrafficSubCategory new];
    fisrtObject.traficId = 0;
    fisrtObject.disPlayName = @"Danh mục";
    [self.listDanhMuc addObject:fisrtObject];
    [NVGetBienBaoSerVice getDanhmucBienBao:^(id data){
        [self.listDanhMuc addObjectsFromArray:(NSMutableArray*)data];
    } andFailure:^(NSError *err){
    }];
}
-(void)loadViewWithButton:(UIButton*)btn{
    [UIView animateWithDuration:1.0 animations:^{
        CGRect flbIndicator = self.lbIndicator.frame;
        flbIndicator.origin.x = btn.frame.origin.x;
        self.lbIndicator.frame = flbIndicator;
    }];
    [self loadViewWithTab:btn.tag];
}

- (void)loadViewWithTab:(int)index {
    self.noData.hidden = YES;
    NSInteger pageNumber = 0;
    typeCate = 1;
    BOOL sholdLoaddata = NO;
    switch (index) {
        case 200:{
            if (!self.listTraficDuongBo.count) {
                sholdLoaddata = (self.listTraficDuongBo.count == 0?YES:NO);
            }
            typeCate = 1;
            pageNumber = self.listTraficDuongBo.count/20 + 1;
        }
            break;
        case 201:{
            if (!self.listTraficDuongSat.count) {
                sholdLoaddata = (self.listTraficDuongSat.count == 0?YES:NO);
            }
            
            typeCate = 2;
            pageNumber = self.listTraficDuongSat.count/20 + 1;
        }
            break;
        case 202:{
            if (!self.listTraficDuongThuy.count) {
                sholdLoaddata = (self.listTraficDuongThuy.count == 0?YES:NO);
            }
            typeCate = 3;
            pageNumber = self.listTraficDuongThuy.count/20 + 1;
        }
            break;
        case 203:{
            if (!self.listTraficDuongHangKhong.count) {
                sholdLoaddata = (self.listTraficDuongHangKhong.count == 0?YES:NO);
            }
            
            typeCate = 4;
            pageNumber = self.listTraficDuongHangKhong.count/20 + 1;
        }
            break;
            
        default:
            break;
    }
    if (sholdLoaddata) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [self reloadBienBaoWithTab:pageNumber];
    } else {
        [self.bienbaoCollectionView reloadData];
    }
    
}

-(void)reloadBienBaoWithTab:(NSInteger) numberPage {
    
    [NVGetBienBaoSerVice getListBienBao:numberPage andType:typeCate andComple:^(id dataResponse) {
        
        switch (typeCate) {
            case 1:
                [self.listTraficDuongBo addObjectsFromArray:dataResponse];
                if (self.listTraficDuongBo.count) {
                    self.noData.hidden = YES;
                } else {
                    self.noData.hidden = NO;
                }
                break;
            case 2:
                [self.listTraficDuongSat addObjectsFromArray:dataResponse];
                if (self.listTraficDuongSat.count) {
                    self.noData.hidden = YES;
                } else {
                    self.noData.hidden = NO;
                }
                break;
            case 3:
                [self.listTraficDuongThuy addObjectsFromArray:dataResponse];
                if (self.listTraficDuongThuy.count) {
                    self.noData.hidden = YES;
                } else {
                    self.noData.hidden = NO;
                }
                break;
            case 4:
                [self.listTraficDuongHangKhong addObjectsFromArray:dataResponse];
                if (self.listTraficDuongHangKhong.count) {
                    self.noData.hidden = YES;
                } else {
                    self.noData.hidden = NO;
                }
                break;
                
            default:
                break;
        } 
        [self.bienbaoCollectionView reloadData];
        [self.bienbaoCollectionView.infiniteScrollingView stopAnimating];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
    } andFauil:^(NSError *err) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self.bienbaoCollectionView.infiniteScrollingView stopAnimating];
    }];
}

- (void) loadMore {
    NSInteger pageNumber = 0;
    switch (typeCate) {
        case 1:
            pageNumber = self.listTraficDuongBo.count/10 + 1;
            break;
        case 2:
            pageNumber = self.listTraficDuongSat.count/10 + 1;
            break;
        case 3:
            pageNumber = self.listTraficDuongThuy.count/10 + 1;
            break;
        case 4:
            pageNumber = self.listTraficDuongHangKhong.count/10 + 1;
            break;
        default:
            break;
    }
    [self reloadBienBaoWithTab:pageNumber];
}

- (IBAction)doTabClick:(id)sender {
    UIButton *btn = (UIButton*)sender;
    currentTabSelected = btn;
    [self loadViewWithButton:btn];
}

#pragma mark - UICollectionViewDataSource Methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    switch (typeCate) {
        case 1:
            return self.listTraficDuongBo.count;
            break;
        case 2:
            return  self.listTraficDuongSat.count;
            break;
        case 3:
            return self.listTraficDuongThuy.count;
            break;
        case 4:
            return self.listTraficDuongHangKhong.count;
            break;
            
        default:
            break;
    }
    
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NVBienBaoCollectionViewCell *cell = (NVBienBaoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NVBienBaoCollectionViewCell class])
                                                                                                               forIndexPath:indexPath];
    NVTrafficSign *traficSing = nil;
    switch (typeCate) {
        case 1:
            traficSing = [self.listTraficDuongBo objectAtIndex:indexPath.row];
            break;
        case 2:
            traficSing = [self.listTraficDuongSat objectAtIndex:indexPath.row];
            break;
        case 3:
            traficSing = [self.listTraficDuongThuy objectAtIndex:indexPath.row];
            break;
        case 4:
            traficSing = [self.listTraficDuongHangKhong objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    
    [cell setCellWithData:traficSing];
    
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(148,195);

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NVTrafficSign *traficSing = nil;
    switch (typeCate) {
        case 1:
            traficSing = [self.listTraficDuongBo objectAtIndex:indexPath.row];
            break;
        case 2:
            traficSing = [self.listTraficDuongSat objectAtIndex:indexPath.row];
            break;
        case 3:
            traficSing = [self.listTraficDuongThuy objectAtIndex:indexPath.row];
            break;
        case 4:
            traficSing = [self.listTraficDuongHangKhong objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    
    NVBienBaoDetailViewController *bienbaoDetailViewController = [[NVBienBaoDetailViewController alloc] initWithNibName:NSStringFromClass([NVBienBaoDetailViewController class]) bundle:nil];
    bienbaoDetailViewController.traficSing = traficSing;
    [self.navigationController pushViewController:bienbaoDetailViewController animated:YES];
}


- (IBAction)showCategoryViewButtonPressed:(id)sender {
    [self.headerButton setEnabled:NO];
    self.allCategoryLable.hidden = YES;
    [self.headerButton setImage:nil forState:UIControlStateNormal];
    self.categoryView.hidden = NO;
    CGRect frame = self.headderView.frame;
    frame.origin.y = CGRectGetMaxY(self.categoryView.frame) +5;
    self.headderView.frame = frame;
    
    frame = self.bienbaoCollectionView.frame;
    frame.origin.y = CGRectGetMaxY(self.headderView.frame);
    frame.size.height = [[UIScreen mainScreen] bounds].size.height - frame.origin.y;
    self.bienbaoCollectionView.frame = frame;
    
}

- (IBAction)doShowDanhMuc:(id)sender {
    if(dropDown == nil) {
        CGFloat f = 250;//self.view.frame.size.height - btn.frame.origin.y -btn.frame.size.height-10;
        dropDown = [[NIDropDown alloc]showDropDown:sender :&f :self.listDanhMuc :nil :@"down"];
        dropDown.delegate = self;
    }
    else {
        [dropDown hideDropDown:sender];
        [self rel];
    }
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - NilDropdown delegate

- (void) niDropDownDelegateMethod: (NIDropDown *) sender {
    [self rel];
    if (sender.objectShare) {
        NVTrafficSubCategory *subCateObject = (NVTrafficSubCategory*)sender.objectShare;
        [self.btnDanhMuc.titleLabel setText:sender.currentSelect];
        subCate = [subCateObject.traficId integerValue];
    }
    [self reloadBienBaoWithTab:currentTabSelected.tag];
}
-(void)rel{
    dropDown = nil;
}
@end
