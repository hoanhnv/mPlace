//
//  NVThuVienViewController.m
//  mPlace
//
//  Created by hoanhnv on 10/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVThuVienViewController.h"
#import "SVPullToRefresh.h"
#import "NVCollectionViewAlignLayout.h"
#import "NVThuVienCollectionViewCell.h"
#import "NVTrafficSubCategory.h"
#import "MBProgressHUD.h"
#import "NVTrafficLibrary.h"
#import "SVPullToRefresh.h"

#define TagCollectionViewAnh 226
#define TagCollectionViewYtuong 227
#define CellWidth 148
#define CellAnhHeight 180
#define CellYtuongHeight 110
#define CellIDThuVien @"cellIdThuVien"

@interface NVThuVienViewController ()

@property (strong, nonatomic) NSMutableArray *lstYtuongDuongBo;
@property (strong, nonatomic) NSMutableArray *lstYtuongDuongSat;
@property (strong, nonatomic) NSMutableArray *lstYtuongDuongThuy;
@property (strong, nonatomic) NSMutableArray *lstYtuongDuongHangKhong;

@property (strong, nonatomic) NSMutableArray *lstThuVien;
@property (strong, nonatomic) NSMutableArray *listDate;
@property (strong, nonatomic) NSMutableArray *listDanhMuc;
@end

@implementation NVThuVienViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    serviceAPI = [[NVGetThuVienService alloc]init];
    self.listDate = [NSMutableArray array];
    self.listDanhMuc = [NSMutableArray array];
    self.lstYtuongDuongBo = [NSMutableArray array];
    self.lstYtuongDuongSat = [NSMutableArray array];
    self.lstYtuongDuongThuy = [NSMutableArray array];
    self.lstYtuongDuongHangKhong = [NSMutableArray array];
    self.btnDanhMuc.layer.cornerRadius =4.0;
    self.btnThoiGian.layer.cornerRadius = 4.0;
    [self loadDanhMucThuVien];
    [self setupCollectioView];
    [self initParametter];
    [self loadViewWithButton:self.btnDuongBo];
    
    __weak NVThuVienViewController *weakSelf = self;
    // loadmore
    [self.listThuvienCollectionView addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadMoreData];
        weakSelf.listThuvienCollectionView.showsInfiniteScrolling = YES;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupCollectioView{
//    NVCollectionViewAlignLayout *layoutThuVien = [[NVCollectionViewAlignLayout alloc]init];
//    layoutThuVien.minimumInteritemSpacing = 8.0;
//    //flowLayout.minimumLineSpacing = 10.0f;
//    layoutThuVien.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    layoutThuVien.itemSize = CGSizeMake(CellWidth, CellYtuongHeight);
//    layoutThuVien.scrollDirection = UICollectionViewScrollDirectionVertical;
    
//    self.listThuvienCollectionView.collectionViewLayout = layoutThuVien;
    [self.listThuvienCollectionView registerNib:[UINib nibWithNibName:@"NVThuVienCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:CellIDThuVien];
}
-(void)loadDanhMucThuVien{
    NVTrafficSubCategory *fisrtObject = [NVTrafficSubCategory new];
    fisrtObject.traficId = 0;
    fisrtObject.disPlayName = @"Danh mục";
    [self.listDanhMuc addObject:fisrtObject];
    [serviceAPI getDanhMucThuVien:^(id data){
        [self.listDanhMuc addObjectsFromArray:(NSMutableArray*)data];
    } andFailure:^(NSError *err){
    }];
    
}
-(void)initParametter{
    typeCate = self.btnDuongBo.tag;
    subCate = 0;
    page_number = 1;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear |NSCalendarUnitMonth) fromDate:[NSDate date]];
    year = [components year];
    month = [components month];
    
}
-(void)loadViewWithButton:(UIButton*)btn{
    [UIView animateWithDuration:1.0 animations:^{
        CGRect flbIndicator = self.lbIndicator.frame;
        flbIndicator.origin.x = btn.frame.origin.x;
        self.lbIndicator.frame = flbIndicator;
    }];
    [self loadViewWithTab:btn.tag];
    
}
-(void)loadViewWithTab:(int)index{ 
    self.noData.hidden = YES;
    BOOL should = NO;
    switch (index) {
        case 200:{
            should = (self.lstYtuongDuongBo.count == 0?YES:NO);
            typeCate = 1;
        }
            break;
        case 201:{
            should = (self.lstYtuongDuongSat.count == 0?YES:NO);
            typeCate = 2;
        }
            break;
        case 202:{
            should = (self.lstYtuongDuongThuy.count == 0?YES:NO);
            typeCate = 3;
        }
            break;
        case 203:{
            should = (self.lstYtuongDuongHangKhong.count == 0?YES:NO);
            typeCate = 4;
        }
            break;
            
        default:
            break;
    }
    if (should) {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [self reloadThuVienWithTab:typeCate];
    } else {
        [self.listThuvienCollectionView reloadData];
    }
}

- (void) loadMoreData {
    self.noData.hidden = YES;
    [self reloadThuVienWithTab:typeCate];
}

-(void)reloadThuVienWithTab:(int)tabIndex{
    NSInteger pageNumber = 0;
    switch (typeCate) {
        case 1:
            pageNumber = self.lstYtuongDuongBo.count/20 + 1;
            break;
        case 2:
            pageNumber = self.lstYtuongDuongSat.count/20 + 1;
            break;
        case 3:
            pageNumber = self.lstYtuongDuongThuy.count/20 + 1;
            break;
        case 4:
            pageNumber = self.lstYtuongDuongHangKhong.count/20 + 1;
            break;
            
        default:
            break;
    }
    
    [serviceAPI getAllThuVien:tabIndex withSubCate:subCate withPageNumber:page_number withPageSize:PAGE_SIZE withMonth:month withYear:year
     andSuccess:^(id lstData){
         
         
         switch (typeCate) {
             case 1:
                 [self.lstYtuongDuongBo addObjectsFromArray:lstData];
                 if (self.lstYtuongDuongBo.count == 0) {
                     self.noData.hidden = NO;
                 } else {
                     self.noData.hidden = YES;
                 }
                 break;
             case 2:
                 [self.lstYtuongDuongSat addObjectsFromArray:lstData];
                 if (self.lstYtuongDuongSat.count == 0) {
                     self.noData.hidden = NO;
                 } else {
                     self.noData.hidden = YES;
                 }
                 break;
             case 3:
                 [self.lstYtuongDuongThuy addObjectsFromArray:lstData];
                 if (self.lstYtuongDuongThuy.count == 0) {
                     self.noData.hidden = NO;
                 } else {
                     self.noData.hidden = YES;
                 }
                 break;
             case 4:
                 [self.lstYtuongDuongHangKhong addObjectsFromArray:lstData];
                 if (self.lstYtuongDuongHangKhong.count == 0) {
                     self.noData.hidden = NO;
                 } else {
                     self.noData.hidden = YES;
                 }
                 break;
                 
             default:
                 break;
         }
         [self.listThuvienCollectionView reloadData];
         [self.listThuvienCollectionView.infiniteScrollingView stopAnimating];
         [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
     }
    andFailure:^(NSError*err){ 
        [self.listThuvienCollectionView.infiniteScrollingView stopAnimating];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        switch (typeCate) {
            case 1:
                if (self.lstYtuongDuongBo.count == 0) {
                    self.noData.hidden = NO;
                } else {
                    self.noData.hidden = YES;
                }
                break;
            case 2:
                if (self.lstYtuongDuongSat.count == 0) {
                    self.noData.hidden = NO;
                } else {
                    self.noData.hidden = YES;
                }
                break;
            case 3:
                if (self.lstYtuongDuongThuy.count == 0) {
                    self.noData.hidden = NO;
                } else {
                    self.noData.hidden = YES;
                }
                break;
            case 4:
                if (self.lstYtuongDuongHangKhong.count == 0) {
                    self.noData.hidden = NO;
                } else {
                    self.noData.hidden = YES;
                }
                break;
                
            default:
                break;
        }
    }];
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
- (NSMutableArray*)getYear
{
     NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear) fromDate:[NSDate date]];
    NSInteger _year = [components year];
    NSMutableArray *arr =[[NSMutableArray alloc]init ];
    while (_year>=1920) {
        [arr addObject:[NSNumber numberWithInt:_year]];
        _year--;
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
- (IBAction)doShowThoiGian:(id)sender {
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
        CGFloat f = 250;//self.view.frame.size.height - btn.frame.origin.y -btn.frame.size.height-10;
        dropDown = [[NIDropDown alloc]showDropDown:sender :&f :nil :self.listDate :@"down"];
        dropDown.delegate = self;
    }
    else {
        [dropDown hideDropDown:sender];
        [self rel];
    }
}

- (IBAction)doTabClick:(id)sender {
    UIButton *btn = (UIButton*)sender;
    currentTabSelected = btn;
    [self loadViewWithButton:btn];
}
- (IBAction)showLeftMenu:(id)sender {
    
    [Appdelegate toggleMenu];
}

- (IBAction)doSearch:(id)sender {
    
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
            return self.lstYtuongDuongBo.count;
            break;
        case 2:
            return self.lstYtuongDuongSat.count;
            break;
        case 3:
            return self.lstYtuongDuongThuy.count;
            break;
        case 4:
            return self.lstYtuongDuongHangKhong.count;
            break;
            
        default:
            break;
    }
    
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NVThuVienCollectionViewCell *cell = (NVThuVienCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIDThuVien
                                                                                                               forIndexPath:indexPath];
    
    NVTrafficLibrary *traficLybary = nil;
    switch (typeCate) {
        case 1:
            traficLybary = [self.lstYtuongDuongBo objectAtIndex:indexPath.row];
            break;
        case 2:
            traficLybary = [self.lstYtuongDuongSat objectAtIndex:indexPath.row];
            break;
        case 3:
            traficLybary = [self.lstYtuongDuongThuy objectAtIndex:indexPath.row];
            break;
        case 4:
            traficLybary = [self.lstYtuongDuongHangKhong objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    
    [cell configCellWithObject:traficLybary];
    return cell;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CellWidth,CellYtuongHeight);
    //    return [[NVAnhCollectionViewCell new]getCellSizeWithItem:indexPath.row];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (dropDown) {
        [dropDown hideDropDown:self.btnThoiGian];
        [dropDown hideDropDown:self.btnDanhMuc];
    }
    
    NVTrafficLibrary *traficLybary = nil;
    switch (typeCate) {
        case 1:
            traficLybary = [self.lstYtuongDuongBo objectAtIndex:indexPath.row];
            break;
        case 2:
            traficLybary = [self.lstYtuongDuongSat objectAtIndex:indexPath.row];
            break;
        case 3:
            traficLybary = [self.lstYtuongDuongThuy objectAtIndex:indexPath.row];
            break;
        case 4:
            traficLybary = [self.lstYtuongDuongHangKhong objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    
    NVChiTietThuVienViewController *chitietVC = [[NVChiTietThuVienViewController alloc]initWithNibName:@"NVChiTietThuVienViewController" bundle:nil];
    chitietVC.objectPresentation = traficLybary;
    [self.navigationController pushViewController:chitietVC animated:YES];
}

#pragma mark - NilDropdown delegate

- (void) niDropDownDelegateMethod: (NIDropDown *) sender {
    [self rel];
    if (sender.objectShare) {
        NVTrafficSubCategory *subCateObject = (NVTrafficSubCategory*)sender.objectShare;
        [self.lbDanhMuc setText:sender.currentSelect];
        subCate = [subCateObject.traficId integerValue];
    }
    else{
        [self.lbDate setText:sender.currentSelect];
        NSArray *arrDate =[self.lbDate.text componentsSeparatedByString:@"-"];
        month = [[arrDate objectAtIndex:0]integerValue];
        year = [[arrDate objectAtIndex:1]integerValue];
    }
    
    switch (typeCate) {
        case 1:
            [self.lstYtuongDuongBo removeAllObjects];
            break;
        case 2:
            [self.lstYtuongDuongSat removeAllObjects];
            break;
        case 3:
            [self.lstYtuongDuongThuy removeAllObjects];
            break;
        case 4:
            [self.lstYtuongDuongHangKhong removeAllObjects];
            break;
            
        default:
            break;
    } 
     [self reloadThuVienWithTab:typeCate];
}

-(void)rel{
    dropDown = nil;
}


@end
