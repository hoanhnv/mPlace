//
//  NVHomeViewController.h
//  mPlace
//
//  Created by hehe on 9/25/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
#import "NVCityTableViewCell.h"

@interface NVHomeViewController : GAITrackedViewController<CITYDELEGATE>{

    IBOutlet UIScrollView * _scrollHome;
    IBOutlet UIView       * _viewHome;
    
    IBOutlet UIButton     * _btnTinTuc1;
    IBOutlet UIButton     * _btnTinTuc2;
    IBOutlet UIButton     * _btnTinTuc3;
    IBOutlet UIButton     * _btnTinTuc4;
    
    IBOutlet UIButton     * _btnNuiRung1;
    IBOutlet UIButton     * _btnNuiRung2;
    IBOutlet UIButton     * _btnNuiRung3;
    IBOutlet UIButton     * _btnNuiRung4;
    
    IBOutlet UIButton     * _btnBienDao1;
    IBOutlet UIButton     * _btnBienDao2;
    IBOutlet UIButton     * _btnBienDao3;
    IBOutlet UIButton     * _btnBienDao4;
    
    IBOutlet UIImageView     * _imgTintuc1;
    IBOutlet UIImageView     * _imgTintuc2;
    IBOutlet UIImageView     * _imgTintuc3;
    IBOutlet UIImageView     * _imgTintuc4;
    
    IBOutlet UIImageView     * _imgBienDao1;
    IBOutlet UIImageView     * _imgBienDao2;
    IBOutlet UIImageView     * _imgBienDao3;
    IBOutlet UIImageView     * _imgBienDao4;
    
    IBOutlet UIImageView     * _imgNuiRung1;
    IBOutlet UIImageView     * _imgNuiRung2;
    IBOutlet UIImageView     * _imgNuiRung3;
    IBOutlet UIImageView     * _imgNuiRung4;
    
    IBOutlet UILabel     * _lblTinTuc1;
    IBOutlet UILabel     * _lblTinTuc2;
    IBOutlet UILabel     * _lblTinTuc3;
    IBOutlet UILabel     * _lblTinTuc4;
    
    IBOutlet UILabel     * _lblBienDao1;
    IBOutlet UILabel     * _lblBienDao2;
    IBOutlet UILabel     * _lblBienDao3;
    IBOutlet UILabel     * _lblBienDao4;
    
    IBOutlet UILabel     * _lblNuiRung1;
    IBOutlet UILabel     * _lblNuiRung2;
    IBOutlet UILabel     * _lblNuiRung3;
    IBOutlet UILabel     * _lblNuiRung4;
    
    IBOutlet UIView      * _viewBackground1;
    IBOutlet UIView      * _viewBackground2;
    IBOutlet UIView      * _viewBackground3;
    IBOutlet UIView      * _viewBackground4;
    
    IBOutlet UILabel      * _lblNavi;
    
    IBOutlet UITableView * _tblCity;
    IBOutlet UITableView * _tblNews;
}

//- (IBAction)chooseAll:(id)sender;
- (void)list100Locations;
- (void)listSavedLocation;
- (IBAction)chooseAllNews:(id)sender;
-(void)show360;
-(void)showTuVanTour;
-(void)showAmNhac;
@end
