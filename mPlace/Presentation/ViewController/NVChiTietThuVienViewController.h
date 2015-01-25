//
//  NVChiTietThuVienViewController.h
//  mPlace
//
//  Created by hoanhnv on 15/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVTrafficLibrary.h"
@interface NVChiTietThuVienViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    
}
@property (strong, nonatomic) NVTrafficLibrary *objectPresentation;
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) IBOutlet UIView *vListMore;
@end
