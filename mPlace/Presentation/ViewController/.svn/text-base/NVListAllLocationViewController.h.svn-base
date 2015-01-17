//
//  NVListAllLocationViewController.h
//  mPlace
//
//  Created by hehe on 9/30/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVShowAllLocationTableViewCell.h"

typedef enum : NSUInteger {
    search = 0,
    list100Location = 1
} typeList;

@interface NVListAllLocationViewController : UIViewController<PLACEDELEGATE>{

    IBOutlet UITableView * _tblListAllLocation;
}

@property(nonatomic, strong) IBOutlet UILabel * lblTitle;
@property(nonatomic, strong) NSString * textTitle;
@property(nonatomic, strong) NSMutableArray * arrLocation;
@property(nonatomic)         typeList  type;

- (void) setTextTitle:(NSString *) text;
@end
