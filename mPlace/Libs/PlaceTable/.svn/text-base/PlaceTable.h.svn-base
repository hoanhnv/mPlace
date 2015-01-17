//
//  PlaceTable.h
//  AppDuLich
//
//  Created by Xuan Mai on 7/24/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVDiaDiem.h"
@protocol PLACEDELEGATE <NSObject>

@optional

- (void)selectPlace:(NVDiaDiem *)nvDiadiem;

@end

@interface PlaceTable : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView * tbPlace;
@property (nonatomic, assign) id <PLACEDELEGATE> selectPlace;


- (void)setPlace:(NSArray * )arrPlace;


@end
