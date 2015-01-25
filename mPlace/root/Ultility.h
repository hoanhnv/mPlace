//
//  Ultility.h
//  gameShow
//
//  Created by TrungDH on 6/24/14.
//  Copyright (c) 2014 Cavoixanh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ultility : NSObject

#define PAGE_NUMBER 20;

@property(nonatomic, strong) NSArray * listCategories;
@property(nonatomic, strong) NSMutableArray * arrayForBOOL;
@property(nonatomic, strong) NSString * UUIDString;
@property(nonatomic, strong) NSNumber * categoryID;
@property(nonatomic, strong) NSArray  * first10Locations;
@property(nonatomic, strong) NSNumber  * subCategory;
@property(nonatomic, strong) NSNumber * idNowLocatoin;
@property(nonatomic, strong) NSNumber * statusLogin;

@property(nonatomic, strong) NSString * phoneNumber;

//************* Define lazy load near location******************
//**

@property(nonatomic, strong) NSNumber * pageNumberNearLocation;

//**************************************************************

//************* Define lazy load all location******************
//**

@property(nonatomic, strong) NSNumber * pageNumberAllLocation;

//**************************************************************

@property(nonatomic, strong) NSOperationQueue *operationQueue;

+ (id)shareInstant;
+ (UIColor*)colorWithHexString:(NSString*)hex;
+ (NSString *)getUIDIDString;
+ (NSString *)getDataBasePath;
+ (BOOL)checkNetwork;
+ (BOOL)truncateDataBase;
+ (NSString *)getImagePath:(NSString*)link;
+ (NSString *)getImagePathCity:(NSString *)link;
+ (UIImage *) imageWithView:(UIView *)view;
+ (void)showAlertNetWork;
+ (void)eventGoogleAnalytic:(NSString *) nameEvent :(NSInteger) tag;

+(BOOL)stringEmpty:(NSString*)string;
+(BOOL)stringNull:(NSString*)string;
+(BOOL)stringNullOrEmpty:(NSString*)string;
@end
