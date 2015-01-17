//
//  NVTyGiaViewController.m
//  mPlace
//
//  Created by hehe on 11/15/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVTyGiaViewController.h"
#import "NVExchangeTableViewCell.h"
#import "NVTinTucService.h"

@interface NVTyGiaViewController (){

    NSMutableArray * listCurreies;
}

@end

@implementation NVTyGiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    listCurreies = [[NSMutableArray alloc] init];
    [NVTinTucService allExchangeSuccessful:^(NSArray *listCurrencyObject) {
        listCurreies = [listCurrencyObject mutableCopy];
        [tblTyGia reloadData];
    } andFail:^(NSError *error) {
        
    }];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleMenu:(id)sender{
    [Appdelegate toggleMenu];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return listCurreies.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 43;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identify = @"Identify";
    NVExchangeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NVExchangeTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        //cell.delegate = self;
    }
    [cell setObject:[listCurreies objectAtIndex:indexPath.row]];
    
    return cell;
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
