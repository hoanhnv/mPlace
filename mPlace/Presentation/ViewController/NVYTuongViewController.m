//
//  NVYTuongViewController.m
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVYTuongViewController.h"
#import "NVCollectionViewAlignLayout.h"
#import "NVYtuongCollectionViewCell.h"
#import "NVYTuongChiTietViewController.h"
#import "SVPullToRefresh.h"
#import "NVIdeasAward.h"

#define TagCollectionViewAnh 226
#define TagCollectionViewYtuong 227
#define CellWidth 148
#define CellAnhHeight 180
#define CellYtuongHeight 110
#define CellIDAnh @"cellIdAnh"
#define CellIDYtuong @"cellIdYtuong"

@interface NVYTuongViewController ()
@property (strong, nonatomic) NSMutableArray *lstYtuongDuongBo;
@property (strong, nonatomic) NSMutableArray *lstYtuongDuongSat;
@property (strong, nonatomic) NSMutableArray *lstYtuongDuongThuy;
@property (strong, nonatomic) NSMutableArray *lstYtuongDuongHangKhong;

@end

@implementation NVYTuongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.lstYtuongDuongBo = [NSMutableArray array];
    self.lstYtuongDuongSat = [NSMutableArray array];
    self.lstYtuongDuongThuy = [NSMutableArray array];
    self.lstYtuongDuongHangKhong = [NSMutableArray array];
    serviceAPI = [[NVYTuongBO alloc]init];
    self.listDate = [NSMutableArray array];
    self.btnDate.layer.cornerRadius = 4.0f;
    [self setupCollectioView];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear |NSCalendarUnitMonth) fromDate:[NSDate date]];
    year = [components year];
    month = [components month];
    [self loadViewWithButton:self.btnDuongBo];
    
    __weak NVYTuongViewController *weakSelf = self;
    [self.listYtuongCollectionView addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadMore];
        weakSelf.listYtuongCollectionView.showsInfiniteScrolling = YES;
    }];
}

-(void)setupCollectioView{
//    NVCollectionViewAlignLayout *layoutYtuong = [[NVCollectionViewAlignLayout alloc]init];
//    layoutYtuong.minimumInteritemSpacing = 8.0;
//    //flowLayout.minimumLineSpacing = 10.0f;
//    layoutYtuong.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    layoutYtuong.itemSize = CGSizeMake(CellWidth, CellYtuongHeight);
//    layoutYtuong.scrollDirection = UICollectionViewScrollDirectionVertical;
    
//    self.listYtuongCollectionView.collectionViewLayout = layoutYtuong;
    [self.listYtuongCollectionView registerNib:[UINib nibWithNibName:@"NVYtuongCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:CellIDYtuong];
}

-(void)loadViewWithButton:(UIButton*)btn{
    [UIView animateWithDuration:1.0 animations:^{
        CGRect flbIndicator = self.lbIndicator.frame;
        flbIndicator.origin.x = btn.frame.origin.x;
        self.lbIndicator.frame = flbIndicator;
    }];
    [self loadViewWithTab:btn.tag];
}

-(void)loadViewWithTab:(int)index {
     typeCate = 1;
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
        [self reloadYtuongDoatGiaiWithTab:typeCate];
    } else {
        [self.listYtuongCollectionView reloadData];
    }
    
}
-(void)reloadYtuongDoatGiaiWithTab:(int)tabIndex{
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
    
    [serviceAPI getAllYTuong:tabIndex withPageNumber:pageNumber withMonth:month withYear:year andSuccess:^(NSMutableArray* lstData){
        
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
        [self.listYtuongCollectionView reloadData];
        [self.listYtuongCollectionView.infiniteScrollingView stopAnimating];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
    } andFailure:^(NSError *err){
        [self.listYtuongCollectionView.infiniteScrollingView stopAnimating];
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

- (void) loadMore {
    [self reloadYtuongDoatGiaiWithTab:typeCate];
}

- (IBAction)doTabClick:(id)sender {
    self.noData.hidden = YES;
    UIButton *btn = (UIButton*)sender;
    [self loadViewWithButton:btn];
}

- (IBAction)doDangYtuongClick:(id)sender {
    NVDangYTuongViewController *dangYtuongVC = [[NVDangYTuongViewController alloc]initWithNibName:@"NVDangYTuongViewController" bundle:nil];
    [self.navigationController pushViewController:dangYtuongVC animated:YES];
}

- (IBAction)showLeftMenu:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doSearch:(id)sender {
    
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

- (IBAction)dateButtonPressed:(id)sender {
    
    if (!self.listDate.count) {
        NSMutableArray *listYear = [self getYear];
        NSMutableArray *listMonth = [self getMonth];
        
        for (int i = 0;i < listYear.count; i++) {
            NSString *date = nil;
            for (int index = 0; index < listMonth.count; index ++) {
                date = [NSString stringWithFormat:@"%@-%@",[listMonth objectAtIndex:index],[listYear objectAtIndex:i]];
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
    NVYtuongCollectionViewCell *cell = (NVYtuongCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIDYtuong
                                                                                                               forIndexPath:indexPath];
    
    NVIdeasAward *IdeaObject = nil;
    switch (typeCate) {
        case 1:
            IdeaObject = [self.lstYtuongDuongBo objectAtIndex:indexPath.row];
            break;
        case 2:
            IdeaObject = [self.lstYtuongDuongSat objectAtIndex:indexPath.row];
            break;
        case 3:
            IdeaObject = [self.lstYtuongDuongThuy objectAtIndex:indexPath.row];
            break;
        case 4:
            IdeaObject = [self.lstYtuongDuongHangKhong objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    
    [cell configCellWithObject:IdeaObject];
    return cell;

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CellWidth,CellYtuongHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NVYTuongChiTietViewController *chitietVC = [[NVYTuongChiTietViewController alloc]initWithNibName:@"NVYTuongChiTietViewController" bundle:nil];
    
    NVIdeasAward *IdeaObject = nil;
    switch (typeCate) {
        case 1:
            IdeaObject = [self.lstYtuongDuongBo objectAtIndex:indexPath.row];
            break;
        case 2:
            IdeaObject = [self.lstYtuongDuongSat objectAtIndex:indexPath.row];
            break;
        case 3:
            IdeaObject = [self.lstYtuongDuongThuy objectAtIndex:indexPath.row];
            break;
        case 4:
            IdeaObject = [self.lstYtuongDuongHangKhong objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    
    chitietVC.objectPresentation = IdeaObject;
    [self.navigationController pushViewController:chitietVC animated:YES];
}
#pragma mark - NilDropdown delegate

- (void) niDropDownDelegateMethod: (NIDropDown *) sender {
    [self rel];
    [self.btnDate.titleLabel setText:sender.currentSelect];
    NSArray *arrDate =[sender.currentSelect componentsSeparatedByString:@"-"];
    month = [[arrDate objectAtIndex:0]integerValue];
    year = [[arrDate objectAtIndex:1]integerValue];
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
    [MBProgressHUD showHUDAddedTo: self.view animated:YES];
    [self reloadYtuongDoatGiaiWithTab:typeCate];
}

-(void)rel{
    dropDown = nil;
}

@end
