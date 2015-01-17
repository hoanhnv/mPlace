//
//  NVAppDelegate.m
//  mPlace
//
//  Created by hehe on 9/25/14.
//  Copyright (c) 2014 Nam Viet corp. All rights reserved.
//

#import "NVAppDelegate.h"

#import "GAI.h"
#import "GAITracker.h"

@implementation NVAppDelegate
@synthesize home = _home;
@synthesize menu = _menu;
@synthesize hotro = _hotro;
@synthesize tuychon = _tuychon;
@synthesize filter = _filter;
@synthesize navigation = _navigation;
@synthesize iViewDeckController = _iViewDeckController;
@synthesize wifi = _wifi;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [self checkAndCopyDB];
    if([Ultility checkNetwork]) NSLog(@"co mang");
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"])
    {
        if([Ultility checkNetwork]){
            [Ultility truncateDataBase];
            NSLog(@"da truncate toan bo database");
        }
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        // This is the first launch ever
    }
    
    [self initViewControllers];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = _iViewDeckController;
    [self.window makeKeyAndVisible];
    //[self toggleMenu];
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|
     UIRemoteNotificationTypeAlert|
     UIRemoteNotificationTypeSound];
    
    //set up GAI
    // Optional: automatically send uncaught exceptions to Google Analytics.
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    
    // Optional: set Logger to VERBOSE for debug information.
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelNone];
    
    // Initialize tracker. Replace with your tracking ID.
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-56246173-1"];
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    // Enable IDFA collection.
    [tracker setAllowIDFACollection:YES];
    
    return YES;
}

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSLog(@"My token is: %@", deviceToken);
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
    NSLog(@"Failed to get token, error: %@", error);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    //[PFPush handlePush:userInfo];
    NSLog(@"user info = %@",userInfo);
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    BOOL urlWasHandled = [FBAppCall handleOpenURL:url
                                sourceApplication:sourceApplication
                                  fallbackHandler:^(FBAppCall *call) {
                                      NSLog(@"Unhandled deep link: %@", url);
                                      // Here goes the code to handle the links
                                      // Use the links to show a relevant view of your app to the user
                                  }];
    
    return urlWasHandled;
}

- (void)initViewControllers{
    _home = [[NVHomeViewController alloc] initWithNibName:@"NVHomeViewController" bundle:nil];
    _menu = [[NVMenuViewController alloc] initWithNibName:@"NVMenuViewController" bundle:nil];
    //_hotro = [[NVHoTroViewController alloc] initWithNibName:@"NVHoTroViewController" bundle:nil];
    _hotro = [[NVTuyChon alloc] initWithNibName:@"NVTuyChon" bundle:nil];
    _filter = [[NVFilterViewController alloc] initWithNibName:@"NVFilterViewController" bundle:nil];
    _wifi  = [[NVLoginWifiViewController alloc] initWithNibName:@"NVLoginWifiViewController" bundle:nil];
    //_tuychon = [[NVTuyChon alloc] initWithNibName:@"NVTuyChon" bundle:nil];
    _tuychon = [[NVHoTroViewController alloc] initWithNibName:@"NVHoTroViewController" bundle:nil];
    _giaothong = [[NV360ViewController alloc]initWithNibName:@"NV360ViewController" bundle:nil];
    _tuVanTour = [[NVTuVanTourViewController alloc]initWithNibName:@"NVTuVanTourViewController" bundle:nil];
    _amNhac = [[NVAmNhacViewController alloc]initWithNibName:@"NVAmNhacViewController" bundle:nil];
    
    _navigation = [[UINavigationController alloc] initWithRootViewController:_home];
    _iViewDeckController = [[IIViewDeckController alloc] initWithCenterViewController:_navigation leftViewController:_menu];

    [Parse setApplicationId:@"4XktaYNg1F2kpBmaKP2q55okRscyULKQkb4tSzyq"
                  clientKey:@"eW9Rfwgju9PzRdLDRnVUYJAS24j2XG5WPF0oaBSQ"];
}

- (void)toggleMenu{
    [_iViewDeckController toggleLeftViewAnimated:YES completion:^(IIViewDeckController *controller, BOOL success) {
         
    }];
}

- (void)handleMenu:(NSInteger) indexPath{
    
    switch (indexPath) {
        case 0:
        {
            _navigation.viewControllers = [NSArray arrayWithObjects:_home, nil];//Trang chu
        }
            break;
        case 1:
        {
            //Tu van tour
            _navigation.viewControllers = [NSArray arrayWithObjects:_home, nil];
             
        }
            break;
        case 2:
        {
            _navigation.viewControllers = [NSArray arrayWithObjects:_home, nil];//tin tuc
            [_home chooseAllNews:nil];
        }
            break;
        case 3:
        {
            //Dia diem hot
            _navigation.viewControllers = [NSArray arrayWithObjects:_home, nil];
            [_home list100Locations];
        }
            break;
        case 4:
        {
            //dia diem luu
            _navigation.viewControllers = [NSArray arrayWithObjects:_home, nil];
            [_home listSavedLocation];
        }
            break;
        
        case 5:
        {
            //tim kiem
            _navigation.viewControllers = [NSArray arrayWithObjects:_home, nil];
            [_home.navigationController pushViewController:_filter animated:YES];
        }
            break;
        case 6:
        {
            _navigation.viewControllers = [NSArray arrayWithObjects:_giaothong, nil];//360
        }
            break;
        case 7:
        {
            ;//am nhac
        }
            break;
        case 8:
        {
            _navigation.viewControllers = [NSArray arrayWithObjects:_wifi, nil];//dang nhap
        }
            break;
        case 9:
        {
            //tuy chon
            _navigation.viewControllers = [NSArray arrayWithObjects:_tuychon, nil];
           
        } break;
        case 10:
        {
            //ho tro
            _navigation.viewControllers = [NSArray arrayWithObjects:_hotro, nil];
           
        }
            break;
        case 11:{
            NSLog(@"da chon thoat");
            [_menu loginFB];
        }
            break;
        default:
            break;
    }

    [self toggleMenu];
}

- (void)checkAndCopyDB{
    
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* foofile = [documentsPath stringByAppendingPathComponent:@"dulich_databbase.db"];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:foofile];
    if(!fileExists){
        NSLog(@"chua co file");
        NSError *error;
        NSString *fileURL = [[NSBundle mainBundle] pathForResource:@"dulich_databbase" ofType:@"db"];
        if([[NSFileManager defaultManager] copyItemAtPath:fileURL toPath:foofile error:&error]){
            NSLog(@"copy thanh cong");
        }else{
            NSLog(@"error = %@",error);
        }
    }
}

@end
