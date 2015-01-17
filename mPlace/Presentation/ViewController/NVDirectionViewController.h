//
//  NVDirectionViewController.h
//  mPlace
//
//  Created by hehe on 12/8/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "NVDiaDiem.h"

@interface NVDirectionViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate>{

    CLLocationManager *locationManager;
    MKPolyline *routeLine;
    MKPolylineView *routeLineView;
    IBOutlet MKMapView * _mapView;
}

//@property(nonatomic, strong) IBOutlet MKMapView * mapView;
@property(nonatomic, strong) NVDiaDiem * diadiemMap;
@end
