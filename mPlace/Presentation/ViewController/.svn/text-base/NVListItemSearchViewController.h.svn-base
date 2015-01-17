//
//  NVListItemSearchViewController.h
//  mPlace
//
//  Created by hehe on 10/23/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//
@class NVFilterViewController;

#import <UIKit/UIKit.h>
#import "NVFilterViewController.h"

typedef enum : NSUInteger {
    city = 0,
    category = 1
    
} typeSearch;

@interface NVListItemSearchViewController : UIViewController<UISearchBarDelegate>{
    
    IBOutlet UITableView * tblListItems;
    IBOutlet UISearchBar * _searchBar;
}


@property(nonatomic, strong) NVFilterViewController * filterInstant;
@property(nonatomic, strong) NSString * titleNavi;
@property(nonatomic, strong) IBOutlet UILabel * lblTitle;
@property(nonatomic, strong) IBOutlet UITableView * tblListItems;
@property(nonatomic, strong) NSArray * listItems;
@property(nonatomic) typeSearch typeSearch;

@end
