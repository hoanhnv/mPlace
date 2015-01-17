//
//  NVAppDelegate.h
//  mPlace
//
//  Created by hehe on 9/25/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IIViewDeckController.h"
#import "Define.h"

@interface NVAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NVHomeViewController * home;
@property (strong, nonatomic) NVMenuViewController * menu;
@property (strong, nonatomic) NVHoTroViewController * tuychon;
@property (strong, nonatomic) NVTuyChon * hotro;
@property (strong, nonatomic) NVFilterViewController * filter;
@property (strong, nonatomic) UINavigationController * navigation;
@property (strong, nonatomic) IIViewDeckController * iViewDeckController;
@property (strong, nonatomic) NVLoginWifiViewController * wifi;
@property (strong, nonatomic) NV360ViewController *giaothong;
@property (strong, nonatomic) NVTuVanTourViewController *tuVanTour;
@property (strong, nonatomic) NVAmNhacViewController *amNhac;

- (void)toggleMenu;
- (void)handleMenu:(NSInteger) indexPath;
@end
