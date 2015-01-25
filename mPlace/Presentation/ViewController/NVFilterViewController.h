//
//  NVFilterViewController.h
//  mPlace
//
//  Created by hehe on 10/10/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "NVCategory.h"
#import "NVCity.h"
//UISearchControllerDelegate in ios 8
@interface NVFilterViewController : GAITrackedViewController<UISearchControllerDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>{

    IBOutlet UISearchBar * _searchBar;
    IBOutlet UILabel     * _lblTitle;
    IBOutlet UITextField * _txtSearch;
    
}

@property(nonatomic, strong) IBOutlet UIButton * btnCity;
@property(nonatomic, strong) IBOutlet UIButton * btnCategory;
@property(nonatomic, strong) NVCity * searchCity;
@property(nonatomic, strong) NVCategory * searchCategory;

@end
