//
//  NVListTraficCategoryViewController.h
//  mPlace
//
//  Created by MAC on 1/20/15.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVTraficCategory.h"

@protocol TraficCategoryDelegate <NSObject>

- (void) passingTraficCategory:(NVTraficCategory*) traficCateGory;

@end

@interface NVListTraficCategoryViewController : UIViewController
@property (nonatomic,assign) id<TraficCategoryDelegate> delegate;

- (IBAction)backButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (weak, nonatomic) IBOutlet UILabel *noDataTraficCategory;

@end
