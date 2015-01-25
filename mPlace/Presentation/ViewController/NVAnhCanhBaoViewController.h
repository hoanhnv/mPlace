//
//  NVAnhCanhBaoViewController.h
//  mPlace
//
//  Created by hoanhnv on 11/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVDangAnhViewController.h"
#import "NIDropDown.h"
@interface NVAnhCanhBaoViewController : UIViewController <NIDropDownDelegate>{
    NIDropDown *dropDown;
}
@property (weak, nonatomic) IBOutlet UICollectionView *listImageCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *noDataImage;
@property (weak, nonatomic) IBOutlet UIView *dateViewContainer;
@property (weak, nonatomic) IBOutlet UIDatePicker *pickerDate;

@property (weak, nonatomic) IBOutlet UIButton *btnDate;


- (IBAction)showLeftMenu:(id)sender;
- (IBAction)doSearch:(id)sender;
- (IBAction)doDanganh:(id)sender;
- (IBAction)dateButtonPressed:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;




@end
