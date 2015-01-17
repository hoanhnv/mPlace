//
//  NVDirectionViewController.m
//  mPlace
//
//  Created by hehe on 12/8/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVDirectionViewController.h"
#import "myAnnotation.h"
@interface NVDirectionViewController ()

@end

@implementation NVDirectionViewController
//@synthesize mapView = _mapView;
@synthesize diadiemMap = _diadiemMap;

CLPlacemark *thePlacemark;
CLPlacemark * theSource;
MKRoute *routeDetails;

- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    
//    if([locationManager locationServicesEnabled]){
//        NSLog(@"enable");
//    }else{
//        NSLog(@"not enable");
//    }
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager startUpdatingLocation];
    _mapView.delegate = self;
    
    
    NSLog(@"aa %f %f = ",locationManager.location.coordinate.latitude,locationManager.location.coordinate.longitude);
    
    CLLocationCoordinate2D location = locationManager.location.coordinate;
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    span.latitudeDelta = 0.1;
    span.longitudeDelta = 0.1;
    
    region.span = span;
    region.center = location;
    //region.center.latitude = _mapView.userLocation.coordinate.latitude;
    //region.center.longitude = _mapView.userLocation.coordinate.longitude;
    
    [_mapView setRegion:region animated:YES];
    [_mapView regionThatFits:region];
    [_mapView showsUserLocation];
    
    
    //[self _currentLocation];
    [self _pinMylocation];
    [self addressSearch];
    //[self routeButtonPressed];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action
- (IBAction)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - CHI DUONG

- (void)addressSearch{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = [_diadiemMap.Latitube floatValue];
    coordinate1.longitude = [_diadiemMap.Longtitube floatValue];
    
    CLLocation * loc = [[CLLocation alloc] initWithLatitude:coordinate1.latitude longitude:coordinate1.longitude];
    
    [geocoder reverseGeocodeLocation:loc completionHandler:^(NSArray *placemarks, NSError *error) {
        thePlacemark = [placemarks lastObject];
        
        float spanX = 1.00825;
        float spanY = 1.00825;
        MKCoordinateRegion region;
        region.center.latitude = thePlacemark.location.coordinate.latitude;
        region.center.longitude = thePlacemark.location.coordinate.longitude;
        region.span = MKCoordinateSpanMake(spanX, spanY);
        [_mapView setRegion:region animated:YES];
        [self addAnnotation:thePlacemark];
        
        CLLocation * loc1 = [[CLLocation alloc] initWithLatitude:locationManager.location.coordinate.latitude longitude:locationManager.location.coordinate.longitude];
        [geocoder reverseGeocodeLocation:loc1 completionHandler:^(NSArray *placemarks, NSError *error) {
            theSource = [placemarks lastObject];
            if(!SYSTEM_VERSION_LESS_THAN(@"7.0"))
                [self routeButtonPressed];
        }];
        
        
        
    }];
}
- (void)addAnnotation:(CLPlacemark *)placemark {
    MKPointAnnotation * point = [[MKPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(placemark.location.coordinate.latitude, placemark.location.coordinate.longitude);
    point.title = _diadiemMap.TenDiaDiem;
    point.subtitle = [placemark.addressDictionary objectForKey:@"City"];
    
    for (id annotation in _mapView.annotations) {
        [_mapView removeAnnotation:annotation];
    }
    [_mapView addAnnotation:point];
}

- (void)routeButtonPressed {
    MKDirectionsRequest *directionsRequest = [[MKDirectionsRequest alloc] init];
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:thePlacemark];
    MKPlacemark * sourcemark = [[MKPlacemark alloc] initWithPlacemark:theSource];
    [directionsRequest setSource:[[MKMapItem alloc] initWithPlacemark:sourcemark]];
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

#pragma mark DELEGATE mapview
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer  * routeLineRenderer = [[MKPolylineRenderer alloc] initWithPolyline:routeDetails.polyline];
    routeLineRenderer.strokeColor = [UIColor redColor];
    routeLineRenderer.lineWidth = 5;
    return routeLineRenderer;
}

- (void) _currentLocation{
    //[_mapView setCenterCoordinate:_mapView.userLocation.location.coordinate animated:YES];
    //[]
}

- (void) _pinMylocation{
    
    CLLocationCoordinate2D coordinate1;
    coordinate1.latitude = [_diadiemMap.Latitube floatValue];
    coordinate1.longitude = [_diadiemMap.Longtitube floatValue];
    //NSLog(@"lat = %f, long = %f",[_diadiemMap.Latitube floatValue],[_diadiem.Longtitube floatValue]);
    myAnnotation *annotation = [[myAnnotation alloc] initWithCoordinate:coordinate1 title:_diadiemMap.TenDiaDiem];
    annotation.tagID = [_diadiemMap.IDdiadiem intValue];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
