//
//  Define.h
//  mPlace
//
//  Created by hehe on 9/25/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#ifndef mPlace_Define_h
#define mPlace_Define_h

#import "MBProgressHUD.h"
#import "Reachability.h"
#import "Libs/AFNetworking/AFNetworking.h"
#import "Libs/AFNetworking/AFHTTPRequestOperation.h"
#import "Libs/objc/SBJson.h"
#import "NVDiaDiem.h"
#import "UIImageView+AFNetworking.h"
#import "MBProgressHUD.h"

#import "NVHomeViewController.h"
#import "NVMenuViewController.h"
#import "NVTuyChon.h"
#import "NVHoTroViewController.h"
#import "NVFilterViewController.h"
#import "NVLoginWifiViewController.h"
#import "NV360ViewController.h"
#import "NVTuVanTourViewController.h"
#import "NVAmNhacViewController.h"

#define Appdelegate ((NVAppDelegate *)[[UIApplication sharedApplication] delegate])

//define system
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

// define text color

#define COLOR_TEXT_TATCA @"0x5c7ca8"
#define COLOR_NAVIGATION @"0x076ebd"


//

//  define link server

#define UUID @"UUID"
#define PAGE_SIZE 20

//********** API charging **************************//

#define SERVICE_GET_ACCOUNT @"api/getAccountInfo"
#define SERVICE_GET_CANCEL @"api/getCancelService?service_type=MPLACE"
#define SERVICE_GET_PAY    @"api/getPayService?service_type=MPLACE"


//**************************************************

#define SERVERDEFAULT @"http://mplace.vn:8080/mplace/"//@"http://mplace.vn:8080/travel_api/"//@"http://mobiphim.vn:8080/travel_api/"
#define DOMAIN_MPLACE @"http://mplace.vn"
#define SERVER_IMAGE @"http://mplace.vn"//@"http://123.30.211.195/travel_backend"

#define SERVICE_GET_HOT @"/api/getLocationHonor"
//#define SERVICE_GET_ALL_NEWS @"api/getArticlesByCatogory"
#define SERVICE_GET_ALL_DIA_DIEM @"api/getLocationByCatogory"
#define SERVICE_GET_DETAIL_NEWS(value) [NSString stringWithFormat:@"api/getArticlesInfo?id=%@",value]

#define SERVICE_GET_ALL_LOCATION(LocationID,PAGE_NUMBER)  [NSString stringWithFormat:@"api/getLocationByCatogory?id=%@&page_number=%@&page_size=%@",LocationID,PAGE_NUMBER,@20]

#define SERVICE_GET_NEAR_LOCATION(LocationID,PAGE_NUMBER) [NSString stringWithFormat:@"api/getRelatedLocation?id=%@&page_number=%@&page_size=%@",LocationID,PAGE_NUMBER,@20]

#define SERVICE_SEARCH_LOCATION(keyword,CATEGORY_ID,PROVINCE_ID,PAGE_NUMBER) [NSString stringWithFormat:@"api/getSearchLocation?keywords=%@&category_id=%@&province_id=%@&page_size=%@&page_number=%@",keyword,CATEGORY_ID,PROVINCE_ID,@20,PAGE_NUMBER]

#define GET_METHOD @"GET"
#define POST_METHOD @"POST"

//#define SERVICE_GET_WEATHER @"http://mobiphim.vn:8080/travel_api/api/getWeather?q=HaNoi"
#define COLOR_HOANG_HON @"0x6f2e03"

#define SERVICE_GET_ALL_NEWS(value)  [NSString stringWithFormat:@"api/getArticlesByCatogory?id=%@",value]//@"api/getArticlesByCatogory"

#define SERVICE_GET_DETAIL_NEWS(value) [NSString stringWithFormat:@"api/getArticlesInfo?id=%@",value];

#define SERVICE_GET_ALL_CITY @"api/getCategories?id=0&type=2&page_number=1&page_size=0"

#define SERVICE_GET_CURRENCY @"api/getExchangerates"

#define SERVICE_GET_WEATHER @"api/getListProvinceWeather"

#define SERVICE_GET_CATEGORIES @"api/getCategories?id=0&type=1&page_number=1&page_size=0"

#define SERVICE_GET_10_NEWS(value) [NSString stringWithFormat:@"api/getArticlesByCatogory?id=%@&page_number=1&page_size=10",value]

#define SERVICE_GET_CATEGORIES_NEWS @"api/getArticlesCategories?id=0"

#endif



