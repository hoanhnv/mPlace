//
//  NVFilterViewController.m
//  mPlace
//
//  Created by hehe on 10/10/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVFilterViewController.h"
#import "NVListItemSearchViewController.h"
#import "NVListAllLocationViewController.h"
#import "NVDiaDiemBusiness.h"
#import "NVUltilityService.h"

@interface NVFilterViewController (){

    NSArray * _listImages;
    NSArray * _listTitles;
    NVListItemSearchViewController * listItem;
    NVDiaDiemBusiness * _diadiemBusiness;
}

@end

@implementation NVFilterViewController
@synthesize searchCategory = _searchCategory;
@synthesize searchCity = _searchCity;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.screenName = @"IOS_Timkiem/AN_Timkiem";
    [_txtSearch endEditing:NO];
    _txtSearch.delegate = self;
    
    [_txtSearch setValue:[UIColor whiteColor]
                    forKeyPath:@"_placeholderLabel.textColor"];
    _listImages = [NSArray arrayWithObjects:@"ic_search_city.png",@"ic_seatch_service.png", nil];
    _listTitles = [NSArray arrayWithObjects:@"Thành phố/tỉnh thành",@"Dịch vụ", nil];
    self.navigationController.navigationBarHidden = YES;
    _lblTitle.backgroundColor = [Ultility colorWithHexString:COLOR_NAVIGATION];
    
    //self.view.superview.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)closeFilter:(id)sender{
//    [_searchBar endEditing:YES];
//    [UIView animateWithDuration:0.5 animations:^{
//        self.view.frame = CGRectMake(0, 800, self.view.frame.size.width, self.view.frame.size.height);
//    } completion:^(BOOL finished) {
//        NSLog(@"dong ok");
//        
//    }];
//}

- (IBAction)searchAction:(id)sender{
    
    NVListAllLocationViewController * location = [[NVListAllLocationViewController alloc] initWithNibName:@"NVListAllLocationViewController" bundle:nil];
    
    [[Ultility shareInstant] setPageNumberAllLocation:@1];
    if(!_searchCategory) [[Ultility shareInstant] setCategoryID:@0];

    
    [NVDiaDiemBusiness allDiaDiemFromSearch:_txtSearch.text withCity:_searchCity and:_searchCategory :^(NSArray *listLocationBookMark) {
        
        location.arrLocation = [listLocationBookMark mutableCopy];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
        [self.navigationController pushViewController:location animated:YES];
        
    } andFail:^(NSError *error) {
        NSLog(@"loi search = %@",error);
    
    }];
}

- (IBAction)cancel:(id)sender{
    [_searchBar endEditing:YES];
    _txtSearch.text = @"";
    [_btnCity setTitle:@"Tỉnh/Thành phố" forState:UIControlStateNormal];
    [_btnCategory setTitle:@"Thể loại" forState:UIControlStateNormal];
}

- (IBAction)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)chooseCity:(id)sender{
    
    if(!listItem)
        listItem = [[NVListItemSearchViewController alloc] initWithNibName:@"NVListItemSearchViewController" bundle:nil];
    
    [NVDiaDiemBusiness allCitySuccessful:^(NSArray *listCityObject) {
        listItem.listItems = listCityObject;
        //listItem.titleNavi  = @"Tỉnh/ thành phố";
        listItem.typeSearch = city;
        listItem.filterInstant = self;
        [listItem.tblListItems reloadData];
        
        [self presentViewController:listItem animated:YES completion:^{
            NSLog(@"");
        }];
        
    } andFail:^(NSError *error) {
        
    }];
}

- (IBAction)chooseCategory:(id)sender{
    
    [Ultility eventGoogleAnalytic:@"AC_TKTheloai" :0];
    
    if(!listItem)
        listItem = [[NVListItemSearchViewController alloc] initWithNibName:@"NVListItemSearchViewController" bundle:nil];
    
    [NVUltilityService allCategorySuccessful:^(NSArray *listCategory) {
        listItem.listItems = [listCategory copy];
        //listItem.titleNavi  = @"Dịch vụ";
        listItem.typeSearch = category;
        listItem.filterInstant = self;
        [listItem.tblListItems reloadData];
        [self presentViewController:listItem animated:YES completion:^{
            NSLog(@"");
        }];
    } andFail:^(NSError *error) {
        
    }];
    
    
}

#pragma mark - TABLEVIEW DATASOURCE

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identify = @"Identify";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.backgroundColor = [UIColor clearColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.imageView.image = [UIImage imageNamed:_listImages[indexPath.row]];
    cell.textLabel.text = _listTitles[indexPath.row];
    
    return cell;
}

#pragma mark - DELEGATE
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if(!listItem)
//    listItem = [[NVListItemSearchViewController alloc] initWithNibName:@"NVListItemSearchViewController" bundle:nil];
//    if(indexPath.row == 0){
//        listItem.listItems = [NSArray arrayWithObjects:@"Hà Nội",@"TP Hồ Chí Minh",@"Bạc Liêu",@"Cao Bằng", nil];
//        listItem.titleNavi  = @"Tỉnh/ thành phố";
//        listItem.filterInstant = self;
//    }else{
//        listItem.listItems = [NSArray arrayWithObjects:@"",@"",@"", nil];
//        listItem.titleNavi  = @"Dịch vụ";
//        listItem.filterInstant = self;
//    }
//    
//    [self presentViewController:listItem animated:YES completion:^{
//        NSLog(@"");
//    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
