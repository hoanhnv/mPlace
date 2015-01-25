//
//  NVHomeViewController.m
//  mPlace
//
//  Created by hehe on 9/25/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVHomeViewController.h"
#import "NVDetailDiaDiemViewController.h"
#import "NVListTinTucViewController.h"
#import "NVDiaDiemBusiness.h"
#import "NVTinTucService.h"
#import "NVListAllLocationViewController.h"
#import "NVFilterViewController.h"
#import "NVNewsObject.h"
#import "NVNewTinTucTableViewCell.h"
#import "NVDetailNewsViewController.h"
#import "NVGetChargingBusiness.h"

#import "NVTuVanTourViewController.h"//#226
#define TIME_SCHEDULE 5

@interface NVHomeViewController (){

    NSArray * _listBienDaoLocation;
    NSArray * _listNuiRungLocation;
    NSArray * _listNewsObjects;
    NSInteger _index;
    BOOL    isScheduling;
    NVDiaDiem * biendao1;
    NVDiaDiem * biendao2;
    NVDiaDiem * biendao3;
    NVDiaDiem * biendao4;
    
    NVDiaDiem * nuirung1;
    NVDiaDiem * nuirung2;
    NVDiaDiem * nuirung3;
    NVDiaDiem * nuirung4;
    
    NVNewsObject * _news1;
    NVNewsObject * _news2;
    NVNewsObject * _news3;
    NVNewsObject * _news4;
    
    NVFilterViewController * filter;
    NVListTinTucViewController * tintuc;
    NSTimer * _timer;
    BOOL statusNetwork;
    
    NSMutableArray * _listCity;
    NSMutableArray * _listFullCity;
    NSMutableArray * _list10TinTuc;
    
    UIView * viewBanner;
}

@end

@implementation NVHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _listCity = [[NSMutableArray alloc] init];
        _list10TinTuc = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [NVGetChargingBusiness getAccount:^(BOOL suc) {
        NSLog(@"suc = %d",suc);
    } andFail:^(NSError *error) {
        
    }];
    self.screenName = @"IOS_Home/AN_Home";
    [[Ultility shareInstant] setPageNumberAllLocation:@1];
    
    _index = 0;
    isScheduling = FALSE;
    statusNetwork = [Ultility checkNetwork];
    self.navigationController.navigationBarHidden = YES;
    [self initView];
    [self getDataBienDao];
    [self getDataTinTuc];
    UIImage * image = [Ultility imageWithView:_viewHome];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    
    if(statusNetwork != [Ultility checkNetwork]){
        NSLog(@"aaaaaaaa");
        [self getDataBienDao];
        statusNetwork = [Ultility checkNetwork];
    }
    
    if(![Ultility checkNetwork]){
        [Ultility showAlertNetWork];
    }
    
//    if(_timer){
//        _timer =  [NSTimer scheduledTimerWithTimeInterval:TIME_SCHEDULE target:self selector:@selector(changeUI) userInfo:nil repeats:YES];
//    }
    [[Appdelegate iViewDeckController] setPanningMode:IIViewDeckFullViewPanning];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[Appdelegate iViewDeckController] setPanningMode:IIViewDeckNoPanning];
    //[_timer invalidate];
    //_timer = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    [self initDetectNumberView];
    tintuc = [[NVListTinTucViewController alloc] initWithNibName:@"NVListTinTucViewController" bundle:nil];
    
    _lblNavi.backgroundColor = [Ultility colorWithHexString:COLOR_NAVIGATION];
    
    _scrollHome.contentSize = CGSizeMake(_viewHome.frame.size.width, _viewHome.frame.size.height);
    _scrollHome.pagingEnabled = NO;
    [_scrollHome addSubview:_viewHome];
    
    _imgBienDao1.layer.cornerRadius = 5;
    _imgBienDao2.layer.cornerRadius = 5;
    _imgBienDao3.layer.cornerRadius = 5;
    _imgBienDao4.layer.cornerRadius = 5;
    
    _imgNuiRung1.layer.cornerRadius = 5;
    _imgNuiRung2.layer.cornerRadius = 5;
    _imgNuiRung3.layer.cornerRadius = 5;
    _imgNuiRung4.layer.cornerRadius = 5;
    
    _viewBackground1.backgroundColor = _viewBackground2.backgroundColor = _viewBackground3.backgroundColor = [Ultility colorWithHexString:COLOR_HOANG_HON];
    
}

- (void)initDetectNumberView{
    viewBanner = [[UIView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(_lblNavi.frame), 320, 0)];
    viewBanner.alpha = 0.0;
    viewBanner.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewBanner];
    
    UILabel * labelText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    labelText.numberOfLines = 0;
    labelText.text = @"   Không nhận diện được thuê bao";
    labelText.textColor = [UIColor whiteColor];
    labelText.font = [UIFont systemFontOfSize:14];
    [viewBanner addSubview:labelText];
    
    [UIView animateWithDuration:0.5 animations:^{
        viewBanner.alpha = 0.8;
        viewBanner.frame = CGRectMake(0, CGRectGetMaxY(_lblNavi.frame), 320, 50);
        
    } completion:^(BOOL finished) {
        NSLog(@"scroll finish");
    }];
}

- (void)list100Locations{
    NVListAllLocationViewController * location = [[NVListAllLocationViewController alloc] initWithNibName:@"NVListAllLocationViewController" bundle:nil];
    [[Ultility shareInstant] setCategoryID:@1];
    //[[Ultility shareInstant] setPageNumberAllLocation:@1];
    [NVDiaDiemBusiness allDiaDiemFromServiceFollowCategoryID:^(NSArray *listLocationBookMark) {
        location.arrLocation = [listLocationBookMark mutableCopy];
        //NSLog(@"%d",_listNuiRungLocation.count);
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self.navigationController pushViewController:location animated:YES];
        
    } andFail:^(NSError *error) {
        
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        //if()
        
    }];

}

- (void)listSavedLocation{
    NVListAllLocationViewController * location = [[NVListAllLocationViewController alloc] initWithNibName:@"NVListAllLocationViewController" bundle:nil];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [NVDiaDiemBusiness allBookmarkFromDB:^(NSArray *listLocationBookMark) {
        location.arrLocation = [listLocationBookMark mutableCopy];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self.navigationController pushViewController:location animated:YES];
        location.textTitle = @"Địa Điểm Đã Lưu";
        //[location setTextTitle:@"Địa Điểm Đã Lưu"];//= @"Địa Điểm Đã Lưu";
    } andFail:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
}
//#226
-(void)showTuVanTour{
    NVTuVanTourViewController *tourVC = [[NVTuVanTourViewController alloc]initWithNibName:@"NVTuVanTourViewController" bundle:nil];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

}
-(void)show360{
    NV360ViewController *giaothong = [[NV360ViewController alloc]initWithNibName:@"NV360ViewController" bundle:nil];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

}
-(void)showAmNhac{
    
}
#pragma mark - ACTION -
#pragma

- (void)selectCity:(NVCity *)nvCity{
    
    UIImage * image = [Ultility imageWithView:_viewHome];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
    NVListAllLocationViewController * location = [[NVListAllLocationViewController alloc] initWithNibName:@"NVListAllLocationViewController" bundle:nil];
    NSLog(@"id = %@",nvCity.idCity);
    [[Ultility shareInstant] setCategoryID:nvCity.idCity];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [NVDiaDiemBusiness allDiaDiemFromServiceFollowCategoryID:^(NSArray *listLocationBookMark) {
        location.arrLocation = [listLocationBookMark mutableCopy];
        location.textTitle = nvCity.nameCity;
        //NSLog(@"%d",_listNuiRungLocation.count);
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self.navigationController pushViewController:location animated:YES];
        
    } andFail:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
}

- (IBAction)toggleMenu:(id)sender{
    [Appdelegate toggleMenu];
}

- (IBAction)chooseAll:(id)sender{
    NVListAllLocationViewController * location = [[NVListAllLocationViewController alloc] initWithNibName:@"NVListAllLocationViewController" bundle:nil];
    [[Ultility shareInstant] setCategoryID:@0];
    //[[Ultility shareInstant] setPageNumberAllLocation:@1];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [NVDiaDiemBusiness allDiaDiemFromServiceFollowCategoryID:^(NSArray *listLocationBookMark) {
        location.arrLocation = [listLocationBookMark mutableCopy];
        location.textTitle = @"Tất cả địa điểm";
        //NSLog(@"%d",_listNuiRungLocation.count);
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self.navigationController pushViewController:location animated:YES];
    
    } andFail:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
}

- (IBAction)chooseAllNews:(id)sender{
    
    [self.navigationController pushViewController:tintuc animated:YES];
    
//    [NVTinTucService allNewsSuccessful:^(NSArray *listNewsObject) {
//        _listNewsObjects = listNewsObject;
//        //[self changeUINews];
//        tintuc.listTinTucTrongNuoc = _listNewsObjects;
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//        [self.navigationController pushViewController:tintuc animated:YES];
//    } andFail:^(NSError *error) {
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
//    }];
}

- (IBAction)filterLocation:(id)sender{
    
    if(!filter)
     filter = [[NVFilterViewController alloc] initWithNibName:@"NVFilterViewController" bundle:nil];
    [self.navigationController pushViewController:filter animated:YES];
    
}

- (IBAction)closeFilter:(id)sender{
//    [UIView animateWithDuration:0.5 animations:^{
//        filter.view.frame = CGRectMake(0, 800, self.view.frame.size.width, self.view.frame.size.height);
//    } completion:^(BOOL finished) {
//        NSLog(@"ok");
//    }];

}

- (void)getDataTinTuc{
    
    [NVTinTucService first10NewsSuccessfulwithID:@0 :^(NSArray *listNewsObject) {
        _list10TinTuc = [listNewsObject mutableCopy];
        [_tblNews reloadData];
    } andFail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

- (void)getDataBienDao{
    //[[Ultility shareInstant] setCategoryID:@28];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    if([Ultility checkNetwork]){
//        [NVDiaDiemBusiness allDiaDiemFromServiceFollowCategoryID:^(NSArray *listLocationBookMark) {
//            _listBienDaoLocation = listLocationBookMark;
//            //NSLog(@"count = %d",_listBienDaoLocation.count);
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//            if(_listNuiRungLocation.count > 0 && !isScheduling)
//                [self scheduleTimer];
//        } andFail:^(NSError *error) {
//            
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//        }];
        
        [NVDiaDiemBusiness allCitySuccessful:^(NSArray *listCityObject) {
            _listFullCity = [listCityObject mutableCopy];
            _listCity = [listCityObject mutableCopy];
            
            if(_listCity.count >= 7) _index = 7;
            [_tblCity reloadData];
            //[self scheduleTimer];
            [self performSelector:@selector(scheduleTimer) withObject:nil afterDelay:TIME_SCHEDULE];
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        } andFail:^(NSError *error) {
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        }];
        
    }else{
        [NVDiaDiemBusiness allDiaDiemFromDBSuccessful:^(NSArray *listLocationObj) {
            _listBienDaoLocation = listLocationObj;
            //NSLog(@"count = %d",_listBienDaoLocation.count);
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//            if(_listNuiRungLocation.count > 0 && !isScheduling)
//                [self scheduleTimer];
        } andFail:^(NSError *error) {
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        }];
    }
}

- (void)getDataNuiRung{
//    [[Ultility shareInstant] setCategoryID:@29];
//    
//    if([Ultility checkNetwork]){
//        [NVDiaDiemBusiness allDiaDiemFromServiceFollowCategoryID:^(NSArray *listLocationBookMark) {
//            _listNuiRungLocation = listLocationBookMark;
//            //NSLog(@"%d",_listNuiRungLocation.count);
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//            if(_listBienDaoLocation.count > 0 && !isScheduling){
//                [self scheduleTimer];
//            }
//        } andFail:^(NSError *error) {
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//        }];
//    }else{
//        [NVDiaDiemBusiness allDiaDiemFromDBSuccessful:^(NSArray *listLocationObj) {
//            _listNuiRungLocation = listLocationObj;
//            //NSLog(@"%d",_listNuiRungLocation.count);
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//            if(_listBienDaoLocation.count > 0 && !isScheduling){
//                [self scheduleTimer];
//            }
//        } andFail:^(NSError *error) {
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//        }];
//    }
}

- (void)scheduleTimer{
    isScheduling = YES;
    [self changeUI];
    _timer =  [NSTimer scheduledTimerWithTimeInterval:TIME_SCHEDULE target:self selector:@selector(changeUI) userInfo:nil repeats:YES];
}

- (void)changeUI{
    [_listCity removeAllObjects];
    for(int i = 0; i< 8; i++){
        _index++;
        if(_index>=_listFullCity.count)
            _index = 0;
        [_listCity addObject:[_listFullCity objectAtIndex:_index]];
    }
    [_tblCity reloadData];
    
//    if(_indexBienDao >= _listBienDaoLocation.count/4) _indexBienDao = 0;
//    if(_indexNuiRung >= _listNuiRungLocation.count/4) _indexNuiRung = 0;
//    
//    biendao1 = [_listBienDaoLocation objectAtIndex:_indexBienDao*4];
//    biendao2 = [_listBienDaoLocation objectAtIndex:_indexBienDao*4+1];
//    biendao3 = [_listBienDaoLocation objectAtIndex:_indexBienDao*4+2];
//    biendao4 = [_listBienDaoLocation objectAtIndex:_indexBienDao*4+3];
//    
//    nuirung1 = [_listNuiRungLocation objectAtIndex:_indexNuiRung*4];
//    nuirung2 = [_listNuiRungLocation objectAtIndex:_indexNuiRung*4+1];
//    nuirung3 = [_listNuiRungLocation objectAtIndex:_indexNuiRung*4+2];
//    nuirung4 = [_listNuiRungLocation objectAtIndex:_indexNuiRung*4+3];
//    
//    [UIView animateWithDuration:3 animations:^{
//        [_imgNuiRung1 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:nuirung1.AnhKhacLink] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//        NSLog(@"link = %@",[NSString stringWithFormat:@"%@%@",SERVER_IMAGE,nuirung1.AnhKhacLink]);
//        [_imgNuiRung2 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:nuirung2.AnhKhacLink] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//        [_imgNuiRung3 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:nuirung3.AnhKhacLink] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//        [_imgNuiRung4 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:nuirung4.AnhKhacLink] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//        
//        [_imgBienDao1 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:biendao1.AnhKhacLink] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//        NSLog(@"link = %@",[NSString stringWithFormat:@"%@%@",SERVER_IMAGE,nuirung1.AnhKhacLink]);
//        [_imgBienDao2 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:biendao2.AnhKhacLink] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//        [_imgBienDao3 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:biendao3.AnhKhacLink] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//        [_imgBienDao4 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:biendao4.AnhKhacLink] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//        
//        _lblNuiRung1.text = nuirung1.TenDiaDiem;
//        _lblNuiRung2.text = nuirung2.TenDiaDiem;
//        _lblNuiRung3.text = nuirung3.TenDiaDiem;
//        _lblNuiRung4.text = nuirung4.TenDiaDiem;
//        
//        _lblBienDao1.text = biendao1.TenDiaDiem;
//        _lblBienDao2.text = biendao2.TenDiaDiem;
//        _lblBienDao3.text = biendao3.TenDiaDiem;
//        _lblBienDao4.text = biendao4.TenDiaDiem;
//    }];
//    
//    NSLog(@"=================");
//    _indexNuiRung++;
//    _indexBienDao++;
}

- (void)changeUINews{
    //dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        
//    if(_listNewsObjects.count > 0){
//            _news1 = [_listNewsObjects objectAtIndex:0];
//            [_imgTintuc1 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:_news1.linkImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//            _lblTinTuc1.text = _news1.title;
//        NSLog(@" anh tin tuc = %@",[[Ultility getImagePath:_news1.linkImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
//    }
//    
//    if(_listNewsObjects.count > 1){
//        _news1 = [_listNewsObjects objectAtIndex:1];
//        [_imgTintuc2 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:_news1.linkImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//        _lblTinTuc2.text = _news1.title;
//        NSLog(@" anh tin tuc = %@",[[Ultility getImagePath:_news1.linkImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
//    }
//    
//    if(_listNewsObjects.count > 2){
//        _news1 = [_listNewsObjects objectAtIndex:2];
//        [_imgTintuc3 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:_news1.linkImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//        
//        NSLog(@" anh tin tuc = %@",[[Ultility getImagePath:_news1.linkImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
//        
//        _lblTinTuc3.text = _news1.title;
//    }
//    
//    if(_listNewsObjects.count > 3){
//        _news1 = [_listNewsObjects objectAtIndex:3];
//        [_imgTintuc4 setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:_news1.linkImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//        _lblTinTuc4.text = _news1.title;
//        NSLog(@" anh tin tuc = %@",[[Ultility getImagePath:_news1.linkImage] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
//    }
}

#pragma mark - TABLEVIEW DATASOURCE
#pragma

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if((_listCity.count == 0 && tableView == _tblCity) || (_list10TinTuc.count == 0&& tableView == _tblNews)) return 0;
    
    if(_tblNews == tableView) return _list10TinTuc.count;
    
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(_tblNews == tableView) return 77;
    
    return 114;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(tableView == _tblCity){
        static NSString * identify = @"Identify";
        NVCityTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if(cell == nil){
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NVCityTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            cell.delegate = self;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageView.backgroundColor = [UIColor clearColor];
        [cell setObj1:[_listCity objectAtIndex:indexPath.row*2]];
        
        if(_listCity.count == indexPath.row*2+1) return cell;
        [cell setObj2:[_listCity objectAtIndex:indexPath.row*2 + 1]];
        
        return cell;
    }else{
        static NSString * identify = @"Identify2";
        NVNewTinTucTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if(cell == nil){
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NVNewTinTucTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            //cell.delegate = self;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageView.backgroundColor = [UIColor clearColor];
        [cell setObject:[_list10TinTuc objectAtIndex:indexPath.row]];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(_tblNews == tableView){
        NVDetailNewsViewController * detail = [[NVDetailNewsViewController alloc] initWithNibName:@"NVDetailNewsViewController" bundle:nil];
        detail.object = [_list10TinTuc objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:detail animated:YES];
    }
}

@end
