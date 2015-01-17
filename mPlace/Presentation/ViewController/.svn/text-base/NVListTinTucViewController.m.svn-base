//
//  NVListTinTucViewController.m
//  mPlace
//
//  Created by hehe on 11/7/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVListTinTucViewController.h"
#import "NVNewsObject.h"
#import "NVTinTucTableViewCell.h"
#import "NVDetailNewsViewController.h"
#import "NVTinTucService.h"
#import "NVTinTucCategory.h"
#import "NVListAllNewsViewController.h"

@interface NVListTinTucViewController (){

    NSArray * _listCateNews;
    NSMutableArray * _list10News;
    //;
}

@end

@implementation NVListTinTucViewController

@synthesize listTinTucTrongNuoc = _listTinTucTrongNuoc;

- (void)viewDidLoad {
    [super viewDidLoad];
    _list10News = [[NSMutableArray alloc] init];
    [NVTinTucService allNewsCategory:^(NSArray *listNewsObject) {
        _listCateNews = listNewsObject;
        [tblTinTuc reloadData];
        
        for(NVTinTucCategory * cate in _listCateNews){
            NSMutableArray * arr = [[NSMutableArray alloc] init];
            [_list10News addObject:arr];
        }
        __block int i = 0;
        
        for(NVTinTucCategory * cate in _listCateNews){
            [NVTinTucService first10NewsSuccessfulwithID:cate.categoryID :^(NSArray *listNewsObject) {
                NSLog(@"222 %@ -- %@",cate.categoryName,cate.categoryID);
                [_list10News replaceObjectAtIndex:i withObject:listNewsObject];
                [tblTinTuc reloadData];
                i++;
                //NSLog(@"so tin tuc %d",listNewsObject.count);
            } andFail:^(NSError *error) {
                NSLog(@"%@",error);
            }];
        }
        
    } andFail:^(NSError *error) {
        
    }];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TABLEVIEW DATASOURCE

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  38.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _listCateNews.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    if(section == 1) return _listTinTucTrongNuoc.count%2==0?_listTinTucTrongNuoc.count/2:_listTinTucTrongNuoc.count/2+1;
    
    if(_list10News.count > 0){
        if([[_list10News objectAtIndex:section] count] > 0)
            return [[_list10News objectAtIndex:section] count]%2 == 0? [[_list10News objectAtIndex:section] count]/2:[[_list10News objectAtIndex:section] count]/2+1;
    }
    
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 161;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identify = @"Identify";
    NVTinTucTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NVTinTucTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.delegate = self;
    }
    //NSLog(@"=====1 %d",indexPath.row);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.backgroundColor = [UIColor clearColor];
    [cell setObj1:[[_list10News objectAtIndex:indexPath.section] objectAtIndex:indexPath.row*2]];
    
    if([[_list10News objectAtIndex:indexPath.section] count] == indexPath.row*2+1)
    {
        [cell setObj2:nil];
    }else{
        [cell setObj2:[[_list10News objectAtIndex:indexPath.section] objectAtIndex:indexPath.row*2 + 1]];
    }
    
   // NSLog(@"=====2 %d",indexPath.row);
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 38)];
    label.backgroundColor = [Ultility colorWithHexString:COLOR_HOANG_HON];
    label.textColor = [UIColor whiteColor];
    
    UILabel * line = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 0.5)];
    line.backgroundColor = [UIColor whiteColor];
    [label addSubview:line];
    
    label.text = [[_listCateNews objectAtIndex:section] categoryName];
    [label setUserInteractionEnabled:YES];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(xemThemButton:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTag:section];
    [button setTitle:@"Xem Thêm" forState:UIControlStateNormal];
    [button setFont:[UIFont systemFontOfSize:14]];
    button.frame = CGRectMake(200.0, 0.0, 160.0, 38.0);
    [label addSubview:button];
    
    return label;
}

#pragma mark - DELEGATE
- (void)selectNews:(NVNewsObject *)nvTinTuc{
    NVDetailNewsViewController * detail = [[NVDetailNewsViewController alloc] initWithNibName:@"NVDetailNewsViewController" bundle:nil];
    detail.object = nvTinTuc;
    [self.navigationController pushViewController:detail animated:YES];
    
}

#pragma mark - ACTION
#pragma

- (IBAction)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)xemThemButton:(UIButton *)sender{
    NVListAllNewsViewController * news = [[NVListAllNewsViewController alloc] initWithNibName:@"NVListAllNewsViewController" bundle:nil];
    NSNumber * idCate = [[_listCateNews objectAtIndex:sender.tag] categoryID];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [NVTinTucService allNewsSuccessfulwithID:idCate :^(NSArray *listNewsObject) {
        
        news.listNews = [listNewsObject mutableCopy];
        [self.navigationController pushViewController:news animated:YES];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    } andFail:^(NSError *error) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
