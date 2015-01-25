//
//  Ultility.m
//  gameShow
//
//  Created by TrungDH on 6/24/14.
//  Copyright (c) 2014 Cavoixanh. All rights reserved.
//

#import "Ultility.h"
#import "Reachability.h"
#import "NVGetUltilityService.h"
#import "define.h"

@implementation Ultility
static Ultility * ultility = nil;
@synthesize phoneNumber = _phoneNumber;
@synthesize operationQueue = _operationQueue;
#define StringLenght 40

+(id)shareInstant {
    if(!ultility){
        ultility = [[Ultility alloc] init];
        
    }
    return ultility;
    
}

-(id)init{
    self = [super init];
    if(self){
        _phoneNumber = @"";
        if(!_operationQueue)
            _operationQueue = [[NSOperationQueue alloc] init];
    }
    
    return self;
}

+ (UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+ (NSString *) genRandStringLength{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: StringLenght];
    
    for (int i=0; i<StringLenght; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    
    return randomString;
}
//+(void)writeKeyChain{
//    KeychainItemWrapper* wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"UUIDString" accessGroup:@"com.namviet.appdulich"];
//    NSString *keyUDID =  [wrapper objectForKey:UUID];
//    if (keyUDID.length <40) {
//        keyUDID = [self genRandStringLength];
//    }
//    else return;
//    [wrapper setObject:keyUDID forKey:UUID];
//    NSLog(@"Random string %@",keyUDID);
//}
//+(NSString *)getUIDIDString{
//    KeychainItemWrapper* wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"UUIDString" accessGroup:@"com.namviet.appdulich"];
//    [self writeKeyChain];
//    NSString *keyUDID = [wrapper objectForKey:UUID];
//    return keyUDID;
//}

+ (NSString *)getDataBasePath{
    
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* foofile = [documentsPath stringByAppendingPathComponent:@"dulich_databbase.db"];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:foofile];
    if(fileExists)
        return foofile;
    
    return nil;
}

+ (BOOL)checkNetwork{
    Reachability* reach = [Reachability reachabilityWithHostname:@"http://google.com.vn"];
    if(reach.isReachable) return YES;
    
    return NO;
}

+ (BOOL)truncateDataBase{
    [NVGetUltilityService truncateDatabase];
    return YES;
}

+ (NSString *)getImagePath:(NSString*)link{
    return [NSString stringWithFormat:@"%@%@",SERVER_IMAGE,link];
}

+ (NSString *)getImagePathCity:(NSString *)link{
    return [NSString stringWithFormat:@"%@%@",DOMAIN_MPLACE,link];
}

+ (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

+ (void)showAlertNetWork{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Mạng lỗi" message:@"Bạn vui lòng kiểm tra lại kết nối mạng" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

+ (void)eventGoogleAnalytic:(NSString *) nameEvent :(NSInteger) tag{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    NSMutableDictionary *event =
    [[GAIDictionaryBuilder createEventWithCategory:@"uiaction"
                                            action:nameEvent
                                             label:nameEvent
                                             value:nil] build];
    [tracker send:event];
}

+(BOOL)stringNull:(NSString*)string{
    if(![string isEqual:[NSNull null]]&&![string isEqualToString:@"(null)"]&&![string isKindOfClass:(id)[NSNull null]]){
        return NO;
    }
    else{
        return YES;
    }
}
+(BOOL)stringEmpty:(NSString*)string{
    
    if ([self stringNull:string]||[string length]==0||[string isEqualToString:@""]) {
        return YES;
    }
    else{
        return NO;
    }
}
+(BOOL)stringNullOrEmpty:(NSString*)str{
    if ([self stringEmpty:str]||[self stringNull:str]) {
        return YES;
    }
    else return NO;
}
@end
