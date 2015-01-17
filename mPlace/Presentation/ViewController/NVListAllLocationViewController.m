//
//  NVListAllLocationViewController.m
//  mPlace
//
//  Created by hehe on 9/30/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVListAllLocationViewController.h"
#import "NVDetailDiaDiemViewController.h"
#import "NVShowAllLocationTableViewCell.h"
#import "NVDiaDiemBusiness.h"

@interface NVListAllLocationViewController (){

   __block BOOL _lockLoadMore;
}

@end

@implementation NVListAllLocationViewController

@synthesize arrLocation = _arrLocation;
@synthesize lblTitle = _lblTitle;
@synthesize textTitle = _textTitle;
@synthesize type = _type;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _arrLocation = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _lblTitle.text = _textTitle;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TABLEVIEW DATASOURCE

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrLocation.count%2==0? _arrLocation.count/2:_arrLocation.count/2+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identify = @"Identify";
    NVShowAllLocationTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NVShowAllLocationTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.delegate = self;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.backgroundColor = [UIColor clearColor];
    [cell setObj1:[_arrLocation objectAtIndex:indexPath.row*2]];
    
    if(_arrLocation.count == indexPath.row*2+1){
        [cell setObj2:nil];
    }else{
        [cell setObj2:[_arrLocation objectAtIndex:indexPath.row*2 + 1]];
    }
    
    
    
    return cell;
}

#pragma mark - DELEGATE CHOOSE LOCATION
#pragma
- (void)selectPlace:(NVDiaDiem*)diadiem{
    NVDetailDiaDiemViewController * detail = [[NVDetailDiaDiemViewController alloc] initWithNibName:@"NVDetailDiaDiemViewController" bundle:nil];
    detail.diadiem = diadiem;
    [[Ultility shareInstant] setIdNowLocatoin:diadiem.IDdiadiem];
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - ACTION
-(IBAction)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - delegate UITABLEVIEW

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(_tblListAllLocation.contentOffset.y<0){
        //it means table view is pulled down like refresh
        return;
    }
    else if(_tblListAllLocation.contentOffset.y >= (_tblListAllLocation.contentSize.height - _tblListAllLocation.bounds.size.height)) {
        //NSLog(@"bottom!");
        //NSLog(@"%@", [self getLastMessageID]);
        //[self getMoreStuff:[self getLastMessageID]];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if(_tblListAllLocation.contentOffset.y<0){
        //it means table view is pulled down like refresh
        return;
    }
    else if(_tblListAllLocation.contentOffset.y >= (_tblListAllLocation.contentSize.height - _tblListAllLocation.bounds.size.height)) {
        NSLog(@"bottom!");
        [self loadMoreData];
    }
}

- (void)loadMoreData{
    __block NSInteger index =  [[[Ultility shareInstant] pageNumberAllLocation] integerValue];
    index += 1;
    [[Ultility shareInstant] setPageNumberAllLocation:[NSNumber numberWithInt:index]];
    
    if(_type == search){
        
    }else if (_type == list100Location){
        
    }
    else{
        //[[Ultility shareInstant] setCategoryID:@1];
    }
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [NVDiaDiemBusiness allDiaDiemFromServiceFollowCategoryID:^(NSArray *listLocationBookMark) {
        [_arrLocation addObjectsFromArray:listLocationBookMark];
        [_tblListAllLocation reloadData];
        //NSLog(@"%d",_listNuiRungLocation.count);
        if(listLocationBookMark.count == 0){
            index-=1;
            [[Ultility shareInstant] setPageNumberAllLocation:[NSNumber numberWithInt:index]];
        }
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
    } andFail:^(NSError *error) {
        index-=1;
        [[Ultility shareInstant] setPageNumberAllLocation:[NSNumber numberWithInt:index]];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
}



@end
