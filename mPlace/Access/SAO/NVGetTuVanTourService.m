//
//  NVGetTuVanTourService.m
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NVGetTuVanTourService.h"
#import "NVTour.h"


@implementation NVGetTuVanTourService
-(void)allTours:(void (^)(id))completion :(void (^)(NSError *))withFailed{
}


+ (void) getListTour:(NSInteger) pageNumber andCompleSucces:(completion) success andFauil:(failCompletion) fail {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@page_number=%@",DOMAIN_MPLACE,SERVICE_GET_LIST_TOUR,[NSNumber numberWithInteger:pageNumber]]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[url relativeString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                  options:kNilOptions
                                                    error:nil];
        if (json == nil) {
            return ;
        }
        NSArray * array = [json objectForKey:@"resultTour"];
        NSMutableArray * listTour = [[NSMutableArray alloc] init];
        for(NSDictionary * dict in array){
            [listTour addObject:[NVTour initWithFrom:dict]];
        }
        
        success(listTour);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"getYTuongDoatGiai error request with description : %@", error);
        fail(error);
    }];
}

@end
