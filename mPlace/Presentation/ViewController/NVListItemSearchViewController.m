//
//  NVListItemSearchViewController.m
//  mPlace
//
//  Created by hehe on 10/23/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVListItemSearchViewController.h"
#import "NVCity.h"
#import "NVCategory.h"

@interface NVListItemSearchViewController (){
    NSMutableArray * arrItems;
}

@end

@implementation NVListItemSearchViewController
@synthesize lblTitle = _lblTitle;
@synthesize listItems = _listItems;
@synthesize titleNavi = _titleNavi;
@synthesize filterInstant = _filterInstant;
@synthesize typeSearch = _typeSearch;
@synthesize tblListItems = tblListItems;

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBar.delegate = self;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [_lblTitle setText:_titleNavi];
    if(arrItems){
        arrItems = nil;
    }
    arrItems = [[NSMutableArray alloc] initWithArray:_listItems];
    [tblListItems reloadData];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [tblListItems reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender{
    //[self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismiss sucessful");
    }];
}

#pragma mark - DATASOURCE
#pragma mark - TABLEVIEW DATASOURCE

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identify = @"Identify";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    if(_typeSearch == city)
        cell.textLabel.text = [(NVCity *)[arrItems objectAtIndex:indexPath.row] nameCity];
    else
        cell.textLabel.text = [(NVCategory *)[arrItems objectAtIndex:indexPath.row] displayName];
    
    return cell;
}


#pragma mark - SEARCH BAR DELEGATE
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range
  replacementText:(NSString *)text{
    //NSString * key = [NSString stringWithFormat:@"%@%@",searchBar.text,text];
    
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText{

    //NSLog(@"aaa %@",searchText);
    if([searchText isEqualToString:@""]){
        arrItems = [_listItems mutableCopy];
        [tblListItems reloadData];
        return;
    }
    
    NSPredicate *resultPredicate;
    
    if(_typeSearch == city){
        resultPredicate = [NSPredicate predicateWithFormat:@"SELF.nameCity CONTAINS[cd] %@", searchText];
    }else{
        resultPredicate = [NSPredicate predicateWithFormat:@"SELF.displayName CONTAINS[cd] %@", searchText];
    }
    
    
    
    [arrItems removeAllObjects];
    arrItems = [[_listItems filteredArrayUsingPredicate:resultPredicate] mutableCopy];
    [tblListItems reloadData];
}

#pragma mark - DELEGATE

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if(_typeSearch == city){
        [_filterInstant.btnCity setTitle:cell.textLabel.text forState:UIControlStateNormal];
        _filterInstant.searchCity = [arrItems objectAtIndex:indexPath.row];
    }
    else{
        [_filterInstant.btnCategory setTitle:cell.textLabel.text forState:UIControlStateNormal];
        _filterInstant.searchCategory = [arrItems objectAtIndex:indexPath.row];
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        
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
