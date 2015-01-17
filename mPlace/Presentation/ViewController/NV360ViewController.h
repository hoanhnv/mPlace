//
//  NV360ViewController.h
//  mPlace
//
//  Created by hoanhnv on 14/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NV360ViewController : UIViewController{
    
}
@property (weak, nonatomic) IBOutlet UIView *vTopHeader;
@property (weak, nonatomic) IBOutlet UIScrollView *vMainView;
@property (strong, nonatomic) IBOutlet UIView *vSlideShow;
@property (strong, nonatomic) IBOutlet UIView *vMenuButton;
@property (strong, nonatomic) IBOutlet UIView *vImageMost;
@property (strong, nonatomic) IBOutlet UIView *vIdeaMost;
@property (strong, nonatomic) IBOutlet UIView *vMenuBottom;

- (IBAction)showLeftMenu:(id)sender;
- (IBAction)doSearch:(id)sender;
- (IBAction)doClickMenuButton:(id)sender;
- (IBAction)doClickMenuBottom:(id)sender;

@end
