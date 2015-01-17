//
//  NVListAllNewsViewController.m
//  mPlace
//
//  Created by hehe on 11/21/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVListAllNewsViewController.h"


@interface NVListAllNewsViewController ()

@end

@implementation NVListAllNewsViewController
@synthesize listNews = _listNews;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listNews.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 161;
}

#pragma mark - DELEGATE
- (void)selectNews:(NVNewsObject *)nvTinTuc{
    NVDetailNewsViewController * detail = [[NVDetailNewsViewController alloc] initWithNibName:@"NVDetailNewsViewController" bundle:nil];
    detail.object = nvTinTuc;
    [self.navigationController pushViewController:detail animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identify = @"Identify";
    NVTinTucTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NVTinTucTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.delegate = self;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.backgroundColor = [UIColor clearColor];
    [cell setObj1:[_listNews objectAtIndex:indexPath.row*2]];
    
    if([[_listNews objectAtIndex:indexPath.section] count] == indexPath.row*2+1) return cell;
    [cell setObj2:[_listNews objectAtIndex:indexPath.row*2 + 1]];
    
    return cell;
}

@end
