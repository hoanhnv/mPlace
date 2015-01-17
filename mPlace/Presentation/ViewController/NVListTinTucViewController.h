//
//  NVListTinTucViewController.h
//  mPlace
//
//  Created by hehe on 11/7/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVTinTucTableViewCell.h"

@interface NVListTinTucViewController : UIViewController<NEWSDELEGATE>{

    IBOutlet UITableView * tblTinTuc;
}

@property(nonatomic, strong) NSArray * listTinTucTrongNuoc;
@property(nonatomic, strong) NVNewsObject * objects;

@end
