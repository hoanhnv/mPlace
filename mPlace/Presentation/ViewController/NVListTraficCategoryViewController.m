//
//  NVListTraficCategoryViewController.m
//  mPlace
//
//  Created by MAC on 1/20/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVListTraficCategoryViewController.h"
#import "NVGetHome360Service.h"
#import "MBProgressHUD.h"
#import "SVPullToRefresh.h"




@interface NVListTraficCategoryViewController ()
@property (nonatomic,strong) NSMutableArray *listTrafic;
@end

@implementation NVListTraficCategoryViewController

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
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.listTrafic = [NSMutableArray array];
    [self loadListCategory];
    
    __weak NVListTraficCategoryViewController *weakSelf = self;
    // loadmore
    [self.categoryTableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadListCategory];
        weakSelf.categoryTableView.showsInfiniteScrolling = YES;
    }];
    
}

- (void) loadListCategory {
    self.noDataTraficCategory.hidden = YES;
    NSInteger pagNumber = self.listTrafic.count/20 +1;
    [NVGetHome360Service getListTraficCategory:pagNumber andSuccess:^(id dataResponse) {
        [self.listTrafic addObjectsFromArray:dataResponse];
        [self.categoryTableView reloadData];
        [self.categoryTableView.infiniteScrollingView stopAnimating];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        if (self.listTrafic.count) {
            self.noDataTraficCategory.hidden = YES;
        } else {
            self.noDataTraficCategory.hidden = NO;
        }
    } andFail:^(NSError *err) {
        self.noDataTraficCategory.hidden = NO;
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self.categoryTableView.infiniteScrollingView stopAnimating];
    }];
}


- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - tableview delegate,datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listTrafic count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.textAlignment = NSTextAlignmentLeft ;
    }
    
    NVTraficCategory *traficCategory = [self.listTrafic objectAtIndex:indexPath.row];
    cell.textLabel.text = traficCategory.disPlayName;
    //cell.textLabel.font = DEFAULT_FONT(12);
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    UIView * v = [[UIView alloc] init];
    v.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = v;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NVTraficCategory *traficcategory = [self.listTrafic objectAtIndex:indexPath.row];
    [self.delegate passingTraficCategory:traficcategory];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
