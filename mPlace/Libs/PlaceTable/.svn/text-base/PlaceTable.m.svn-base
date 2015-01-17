//
//  PlaceTable.m
//  AppDuLich
//
//  Created by Xuan Mai on 7/24/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import "PlaceTable.h"
#import "PlaceCell.h"
@interface PlaceTable (){
    NSMutableArray * arrPlaces;
    UINib *cellLoader;
}

@end

@implementation PlaceTable
@synthesize selectPlace;
static NSString *CellClassName = @"PlaceCell";
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         cellLoader = [UINib nibWithNibName:CellClassName bundle:[NSBundle mainBundle]];
    }
    return self;
}

- (void)initData{
    
}

- (void)setPlace:(NSArray *)arrPlace{
    if (!arrPlaces) {
        arrPlaces = [[NSMutableArray alloc] init];
    }
    [arrPlaces removeAllObjects];
    [arrPlaces addObjectsFromArray:arrPlace];
    [self.tbPlace reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITABLEVIEW DATASOURCE

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return arrPlaces.count;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([selectPlace respondsToSelector:@selector(selectPlace:)]) {
        NVDiaDiem * _diadiem = [arrPlaces objectAtIndex:indexPath.row];
        [selectPlace selectPlace:_diadiem];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"Cell";
    PlaceCell *cell = (PlaceCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
    {
        cell = [[PlaceCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        NSArray *topLevelItems = [cellLoader instantiateWithOwner:self options:nil];
        cell = [topLevelItems objectAtIndex:0];
        cell = (PlaceCell *) [[[NSBundle mainBundle] loadNibNamed:CellClassName owner:self options:nil] lastObject];
    }
    NVDiaDiem * _diadiem = [arrPlaces objectAtIndex:indexPath.row];
    cell.lblName.text = _diadiem.TenDiaDiem;
    cell.lblAddress.text = _diadiem.DiaChi;
    cell.lblName.font = FONT_BOLD(14);
    cell.lblAddress.font = FONT_NORMAL(14);
    [cell.imgThumb setImageWithURL:[NSURL URLWithString:[Ultility getImagePath:_diadiem.AnhKhacLink ]]];
    
    return cell;

}

@end
