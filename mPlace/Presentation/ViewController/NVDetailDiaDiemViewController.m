//
//  NVDetailDiaDiemViewController.m
//  mPlace
//
//  Created by hehe on 9/25/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVDetailDiaDiemViewController.h"
#import "NVSlideImageViewController.h"
#import "myAnnotation.h"
#import "NVShareFBViewController.h"
#import "NVDiaDiemBusiness.h"
#import "NVDirectionViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface NVDetailDiaDiemViewController (){

    NSMutableArray * arrayImage;
    NSMutableArray * listLocationNear;
    UITapGestureRecognizer * longPress;
}

@end

@implementation NVDetailDiaDiemViewController
@synthesize diadiem = _diadiem;

CLPlacemark *thePlacemark;
MKRoute *routeDetails;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        arrayImage = [[NSMutableArray alloc] init];
        listLocationNear = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.screenName = @"IOS_Chitiet/AN_Chitiet";
    [self setupView];
    [self layoutSubView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    BOOL isBookMark = [NVDiaDiemBusiness checkBookmark:_diadiem];
    if(!isBookMark){
        _btnBookmark.tag = 0;
        [_btnBookmark setImage:[UIImage imageNamed:@"btn_bookmark.png"] forState:UIControlStateNormal];
    }else{
        _btnBookmark.tag = 1;
        [_btnBookmark setImage:[UIImage imageNamed:@"icon_bookmarkchitiet_selected.png"] forState:UIControlStateNormal];
        //[NVDiaDiemBusiness insertBookMark:_obj];
    }
}

- (void)refeshLocation:(NVDiaDiem *) object{
    _diadiem = object;
    BOOL isBookMark = [NVDiaDiemBusiness checkBookmark:_diadiem];
    if(!isBookMark){
        _btnBookmark.tag = 0;
        [_btnBookmark setImage:[UIImage imageNamed:@"btn_bookmark.png"] forState:UIControlStateNormal];
    }else{
        _btnBookmark.tag = 1;
        [_btnBookmark setImage:[UIImage imageNamed:@"icon_bookmarkchitiet_selected.png"] forState:UIControlStateNormal];
    }
    for(UIView * view in [_scrollImage subviews]){
        [view removeFromSuperview];
    }
    [self setupView];
    [_txtDescription sizeToFit];
    NSLog(@"text height = %f",_txtDescription.frame.size.height);
    //[self layoutSubView];
}

- (IBAction)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupView{
    _lblTitleDiaDiem.text = _diadiem.TenDiaDiem;
    _lblDiaChi.text = _diadiem.DiaChi;
    _lblDiaChi2.text = _diadiem.DiaChi;
    _txtDescription.frame = CGRectMake(_txtDescription.frame.origin.x, _txtDescription.frame.origin.y, _txtDescription.frame.size.width, 1000);
    _txtDescription.text = _diadiem.Description;
    
    //NSLog(@"size description 0 = %f",_txtDescription.frame.size.height);
    
    [_txtDescription sizeToFit];
    
    //NSLog(@"size description = %f",_txtDescription.frame.size.height);
    
    _viewThongTin.frame = CGRectMake(_viewThongTin.frame.origin.x, _viewThongTin.frame.origin.y, _viewThongTin.frame.size.width, 482+ _txtDescription.frame.size.height);
    _mapView.frame = CGRectMake(7, 43, 302, 154);
    
    NSLog(@"size thong tin = %f",_viewThongTin.frame.size.height);
    
    _lblSoAnh.text  = [NSString stringWithFormat:@"%d Ảnh",_diadiem.listImages.count];
    _viewBackground1.backgroundColor = _viewBackground2.backgroundColor = _viewBackground3.backgroundColor = _viewBackground4.backgroundColor = _viewBackground5.backgroundColor = [Ultility colorWithHexString:COLOR_HOANG_HON];
    [_imageBanner setImageWithURL:[NSURL URLWithString:[[Ultility getImagePath:_diadiem.AnhKhacLink] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
//    CLLocationCoordinate2D location = _mapView.userLocation.coordinate;
//    MKCoordinateRegion region;
//    MKCoordinateSpan span;
//    
//    location.latitude  = [_diadiem.Latitube floatValue];
//    location.longitude = [_diadiem.Longtitube floatValue];
//    
//    span.latitudeDelta = 0.1;
//    span.longitudeDelta = 0.1;
//    
//    region.span = span;
//    region.center = location;
//    
//    [_mapView setRegion:region animated:YES];
//    [_mapView regionThatFits:region];
//
    [self _pinMylocation];
    
    //[self addressSearch];
    //[self _calculateDistance];
    
    
    _scrollImage.pagingEnabled = NO;
    _scrollImage.contentSize= CGSizeMake(500, _scrollImage.frame.size.height);
    
    
    [MBProgressHUD showHUDAddedTo:_scrollImage animated:YES];
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Add code here to do background processing
        //
        //
        
        [arrayImage removeAllObjects];
        
        for(NSString * string in _diadiem.listImages){
            //NSLog(@"link anh = %@",[Ultility getImagePath:string]);
            if(string){
                UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[Ultility getImagePath:string]]]];
                if(img){
                    
                    [arrayImage addObject:img];
                }
                //[_slideshow addImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[Ultility getImagePath:string]]]]];
            }
        }
        
        dispatch_async( dispatch_get_main_queue(), ^{
            // Add code here to update the UI/send notifications based on the
            // results of the background processing
            
            _scrollImage.contentSize= CGSizeMake(10*(arrayImage.count+2)+117*arrayImage.count , _scrollImage.frame.size.height);
            
            for(int i = 0; i< arrayImage.count; i++){
                UIImage * image = [arrayImage objectAtIndex:i];
                UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10*i+117*i, 15, 117, 98)];
                [imageView setUserInteractionEnabled:YES];
                imageView.tag = i;
                
                longPress = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didLongPress:)];
                longPress.numberOfTapsRequired = 1;
                [imageView addGestureRecognizer:longPress];
                //NSLog(@"tag = %d, i = %d",longPress.view.tag,i);
                
                imageView.layer.cornerRadius = 10.0f;
                imageView.image = image;
                [_scrollImage addSubview:imageView];
            }
            
            [MBProgressHUD hideHUDForView:_scrollImage animated:YES];
        });
    });
    
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
    
        [NVDiaDiemBusiness allLocationNearSuccessful:^(NSArray *listLocationObject) {
            dispatch_async( dispatch_get_main_queue(), ^{
                listLocationNear = [listLocationObject mutableCopy];
                [_tblLocationNear reloadData];
            });
        } andFail:^(NSError *error) {
            
        } ];
    });
    
}

- (void)layoutSubView{
    _viewPanorama.frame = CGRectMake(0, CGRectGetMaxY(_imageBanner.frame), _viewPanorama.frame.size.width, 0);
    _viewHinhanh.frame  = CGRectMake(0, CGRectGetMaxY(_viewPanorama.frame), _viewHinhanh.frame.size.width, _viewHinhanh.frame.size.height);
    _viewVideo.frame  = CGRectMake(0, CGRectGetMaxY(_viewHinhanh.frame), _viewVideo.frame.size.width, 0);
    _viewThongTin.frame = CGRectMake(0, CGRectGetMaxY(_viewVideo.frame), _viewVideo.frame.size.width, _viewThongTin.frame.size.height);
    _viewDiaDiemLienQuan.frame = CGRectMake(0, CGRectGetMaxY(_viewThongTin.frame), _viewDiaDiemLienQuan.frame.size.width, _viewDiaDiemLienQuan.frame.size.height);
    
    NSLog(@"content = %f, hinhanh = %f, diadiem = %f, ",_viewContent.frame.size.height,_viewHinhanh.frame.size.height,_viewDiaDiemLienQuan.frame.size.height);
    
    _viewContent.frame = CGRectMake(0, 0, _viewContent.frame.size.width, _viewContent.frame.size.height+_viewHinhanh.frame.size.height+_viewVideo.frame.size.height+_viewThongTin.frame.size.height +_viewDiaDiemLienQuan.frame.size.height);
    NSLog(@"_view height = %f",_viewContent.frame.size.height);
    [_viewContent addSubview:_viewPanorama];
    [_viewContent addSubview:_viewHinhanh];
    [_viewContent addSubview:_viewVideo];
    [_viewContent addSubview:_viewThongTin];
    [_viewContent addSubview:_viewDiaDiemLienQuan];
    _scrollView.contentSize = CGSizeMake(_viewContent.frame.size.width, _viewContent.frame.size.height);
    [_scrollView addSubview:_viewContent];
}


#pragma mark - LIST IMAGE
#pragma
-(void)didLongPress:(UILongPressGestureRecognizer *)gesture
{
    //if (gesture.state == UIGestureRecognizerStateBegan){
        //[self doSomething];
        NVSlideImageViewController * slide = [[NVSlideImageViewController alloc] initWithNibName:@"NVSlideImageViewController" bundle:nil];
        slide.imageList = [arrayImage copy];
        [slide setIndex:gesture.view.tag];
        //NSLog(@"index = %d, %d",slide.index,gesture.view.tag);
        [self.navigationController pushViewController:slide animated:YES];
    //}
}

#pragma mark - SHARE FB AND EMAIL
#pragma
- (void)shareFacebook{
    UIImage * image = [Ultility imageWithView:_viewContent];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
    NVShareFBViewController * fb = [[NVShareFBViewController alloc] initWithNibName:@"NVShareFBViewController" bundle:nil];
    [self presentViewController:fb animated:YES completion:^{
        fb.imageShare.image = [Ultility imageWithView:_viewContent];
        fb.txtComment.text = _diadiem.TenDiaDiem;
        
    }];
    
    
}

-(void)shareMail{
    mailComposer = [[MFMailComposeViewController alloc]init];
    mailComposer.mailComposeDelegate = self;
    [mailComposer setSubject:@"Test mail"];
    [mailComposer setMessageBody:@"Testing message\
     for the test mail" isHTML:NO];
    
    [self presentViewController:mailComposer animated:YES completion:^{
        NSLog(@"present oks");
     
    }];
}
      
      
#pragma mark - DELEGATE CHOOSE LOCATION
#pragma
- (void)selectPlace:(NVDiaDiem*)diadiem{
    [self refeshLocation:diadiem];
    [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x, 0)
                             animated:YES];
}

#pragma mark - ACTION
#pragma

- (IBAction)listCategoryImages:(id)sender{
    NVSlideImageViewController * slide = [[NVSlideImageViewController alloc] initWithNibName:@"NVSlideImageViewController" bundle:nil];
    slide.imageList = [arrayImage copy];
    [self.navigationController pushViewController:slide animated:YES];
}

- (IBAction)shareFaceBook:(id)sender{
    
    NSString *actionSheetTitle = @"Share"; //Action Sheet Title
    //NSString *destructiveTitle = @"Destructive Button"; //Action Sheet Button Titles
    NSString *other1 = @"Facebook";
    NSString *other2 = @"Email";
    //NSString *other3 = @"Other Button 3";
    NSString *cancelTitle = @"Cancel Button";
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:actionSheetTitle
                                  delegate:self
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:other1, other2, nil];
    [actionSheet showInView:self.view];
    
}

- (IBAction)drectionDiaDiem:(id)sender{
    NSLog(@" direction dia diem ");
    NVDirectionViewController * direction = [[NVDirectionViewController alloc] initWithNibName:@"NVDirectionViewController" bundle:nil];
    direction.diadiemMap = _diadiem;
    [self.navigationController pushViewController:direction animated:YES];

    //UIImage * image = [UIImage imageWithData:<#(NSData *)#>];
    
}

- (IBAction)infoDiaDiem:(id)sender{
    CGPoint bottomOffset = CGPointMake(0, _scrollView.contentSize.height - _scrollView.bounds.size.height);
    [_scrollView setContentOffset:bottomOffset animated:YES];
}

- (IBAction)bookMark:(UIButton*)sender{
    if(_btnBookmark.tag == 0){
        _btnBookmark.tag = 1;
        [_btnBookmark setImage:[UIImage imageNamed:@"icon_bookmarkchitiet_selected.png"] forState:UIControlStateNormal];
        //[self _calculateDistance];
        [NVDiaDiemBusiness insertBookMark:_diadiem];
    }else{
        _btnBookmark.tag = 0;
        [_btnBookmark setImage:[UIImage imageNamed:@"btn_bookmark.png"] forState:UIControlStateNormal];
        [NVDiaDiemBusiness DeleteBookMarkWithDiaDiem:_diadiem];
    }
}

#pragma mark - CHI DUONG

- (void)addressSearch{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = [_diadiem.Latitube floatValue];
    coordinate1.longitude = [_diadiem.Longtitube floatValue];
    
    CLLocation * loc = [[CLLocation alloc] initWithLatitude:coordinate1.latitude longitude:coordinate1.longitude];
    
    [geocoder reverseGeocodeLocation:loc completionHandler:^(NSArray *placemarks, NSError *error) {
        thePlacemark = [placemarks lastObject];
        
        float spanX = 1.00725;
        float spanY = 1.00725;
        MKCoordinateRegion region;
        region.center.latitude = thePlacemark.location.coordinate.latitude;
        region.center.longitude = thePlacemark.location.coordinate.longitude;
        region.span = MKCoordinateSpanMake(spanX, spanY);
        [_mapView setRegion:region animated:YES];
        [self addAnnotation:thePlacemark];
        
        if(!SYSTEM_VERSION_LESS_THAN(@"7.0"))
            [self routeButtonPressed];
    }];
}

- (void)addAnnotation:(CLPlacemark *)placemark {
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(placemark.location.coordinate.latitude, placemark.location.coordinate.longitude);
    point.title = _diadiem.TenDiaDiem;
    point.subtitle = [placemark.addressDictionary objectForKey:@"City"];
    
    for (id annotation in _mapView.annotations) {
        [_mapView removeAnnotation:annotation];
    }
    [_mapView addAnnotation:point];
}

- (void)routeButtonPressed {
    MKDirectionsRequest *directionsRequest = [[MKDirectionsRequest alloc] init];
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:thePlacemark];
    [directionsRequest setSource:[MKMapItem mapItemForCurrentLocation]];
    [directionsRequest setDestination:[[MKMapItem alloc] initWithPlacemark:placemark]];
    directionsRequest.transportType = MKDirectionsTransportTypeAutomobile;
    MKDirections *directions = [[MKDirections alloc] initWithRequest:directionsRequest];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error %@", error.description);
        } else {
            routeDetails = response.routes.lastObject;
            [_mapView addOverlay:routeDetails.polyline];
        }
    }];
}


#pragma mark - PRIVATE METHOD
#pragma mark
- (void) _calculateDistance{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager startUpdatingLocation];
    
    CLLocation *locA = [[CLLocation alloc] initWithLatitude:locationManager.location.coordinate.latitude longitude:locationManager.location.coordinate.longitude];
    
    CLLocation *locB = [[CLLocation alloc] initWithLatitude:[_diadiem.Latitube floatValue] longitude:[_diadiem.Longtitube floatValue]];
    
    CLLocationDistance distance = [locA distanceFromLocation:locB];
    _diadiem.Distance = [NSString stringWithFormat:@"%.0f",distance/1000];
    _lblDistance.text = [NSString stringWithFormat:@"%@km",_diadiem.Distance];
    //NSLog(@"current %@ diem den %@ khoang cach  %@",locA,locB, _obj.Distance);
    
}

- (void) _pinMylocation{
    
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = [_diadiem.Latitube floatValue];
    coordinate1.longitude = [_diadiem.Longtitube floatValue];
    NSLog(@"lat = %f, long = %f",[_diadiem.Latitube floatValue],[_diadiem.Longtitube floatValue]);
    myAnnotation *annotation = [[myAnnotation alloc] initWithCoordinate:coordinate1 title:_diadiem.TenDiaDiem];
    annotation.tagID = [_diadiem.IDdiadiem intValue];
    for(myAnnotation * ano in _mapView.annotations){
        [_mapView removeAnnotation:ano];
    }
    [_mapView addAnnotation:annotation];
    
    
    MKCoordinateSpan span;
    span.latitudeDelta = 0.1;
    span.longitudeDelta = 0.1;
    
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate1, span);
    
    [_mapView setRegion:region animated:YES];
}

#pragma mark - TABLE DATASOURCE

#pragma mark - TABLEVIEW DATASOURCE

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return listLocationNear.count/2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identify = @"Identify";
    NVShowAllLocationTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NVShowAllLocationTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.delegate = self;
    }
    [cell setObj1:[listLocationNear objectAtIndex:indexPath.row*2]];
    [cell setObj2:[listLocationNear objectAtIndex:indexPath.row*2 + 1]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.backgroundColor = [UIColor clearColor];
    
    return cell;
}

#pragma mark - ACTIONSHEET DELEGATE
- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
            switch (buttonIndex) {
                case 0:
                    [self shareFacebook];
                    break;
                case 1:
                    [self shareMail];
                    break;
                
                    break;
                default:
                    break;
            }
}

#pragma mark - mail compose delegate
-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (result) {
        NSLog(@"Result : %d",result);
    }
    if (error) {
        NSLog(@"Error : %@",error);
    }
    [controller dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

@end
