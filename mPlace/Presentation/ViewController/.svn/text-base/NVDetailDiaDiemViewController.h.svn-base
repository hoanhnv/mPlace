//
//  NVDetailDiaDiemViewController.h
//  mPlace
//
//  Created by hehe on 9/25/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "NVShowAllLocationTableViewCell.h"
#import "GAITrackedViewController.h"
#import <MessageUI/MessageUI.h>
@interface NVDetailDiaDiemViewController : GAITrackedViewController<UITableViewDataSource,UITableViewDelegate,PLACEDELEGATE,UIActionSheetDelegate,MFMailComposeViewControllerDelegate>{

    CLLocationManager *locationManager;
    
    IBOutlet UIScrollView * _scrollView;
    IBOutlet UIView       * _viewContent;
    
    IBOutlet UIImageView  * _imageBanner;
    IBOutlet UILabel      * _lblTitleDiaDiem;
    IBOutlet UILabel      * _lblDiaChi;
    IBOutlet UILabel      * _lblGiomocua;
    IBOutlet UILabel      * _lblThongTin;
    IBOutlet UILabel      * _lblDiaChi2;
    IBOutlet UITextView   * _txtDescription;
    
    IBOutlet MKMapView * _mapView;
    
    IBOutlet UILabel      * _lblSoAnh;
    IBOutlet UILabel      * _lblSoVideo;
    
    IBOutlet UIView      * _viewBackground1;
    IBOutlet UIView      * _viewBackground2;
    IBOutlet UIView      * _viewBackground3;
    IBOutlet UIView      * _viewBackground4;
    IBOutlet UIView      * _viewBackground5;
    
    IBOutlet UIScrollView * _scrollImage;
    
    IBOutlet UITableView * _tblLocationNear;
    IBOutlet UIButton * _btnBookmark;
    IBOutlet UILabel  * _lblDistance;
    
    IBOutlet UIView * _viewPanorama;
    IBOutlet UIView * _viewHinhanh;
    IBOutlet UIView * _viewVideo;
    IBOutlet UIView * _viewThongTin;
    IBOutlet UIView * _viewDiaDiemLienQuan;
    
    MFMailComposeViewController *mailComposer;
    //IBOutlet UIView * _viewPanorama;
}

@property(nonatomic, strong) NVDiaDiem * diadiem;

@end
