//
//  NVSlideImageViewController.m
//  AppDuLich
//
//  Created by hehe on 7/25/14.
//  Copyright (c) 2014 NamViet. All rights reserved.
//

#import "NVSlideImageViewController.h"
#import "Ultility.h"
#import "MBProgressHUD.h"

@interface NVSlideImageViewController (){
    NSInteger index;
    //NSMutableArray * arrayImage;
}

@end

@implementation NVSlideImageViewController
@synthesize imageList = _imageList;
@synthesize index = index;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //index = 1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    index = 1;
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.9]];
    
    _slideshow.delegate = self;
    [_slideshow setDelay:1]; // Delay between transitions
    [_slideshow setTransitionDuration:.5]; // Transition duration
    [_slideshow setTransitionType:KASlideShowTransitionFade]; // Choose a transition type (fade or slide)
    [_slideshow setImagesContentMode:UIViewContentModeScaleAspectFill]; // Choose a content mode for images to display
    
    // Do any additional setup after loading the view from its nib.
    lblSlide.font = [UIFont boldSystemFontOfSize:20.0f];
    lblSlide.textColor = [Ultility colorWithHexString:@"0x366cd0"];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    for(UIImage * image in _imageList){
        [_slideshow addImage:image];
    }
    
    [self setTextLAbel];
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}


- (void)setTextLAbel{
    [lblNumberOfImage setText:[NSString stringWithFormat:@"Cover photos: %d/%d",index + 1, _imageList.count]];
}


-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    //Do what you want here
    if(_imageList.count == 0) return;
    [_slideshow next];
    if(index == _imageList.count){
        index = 1;
        [self setTextLAbel];
        return;
    }
    index++;
    [self setTextLAbel];
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if(_imageList.count == 0) return;
    [_slideshow previous];
    if(index == 1){
        index = _imageList.count;
        [self setTextLAbel];
        return;
    }
    index--;
    [self setTextLAbel];
    //Do what you want here
}

- (IBAction)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
