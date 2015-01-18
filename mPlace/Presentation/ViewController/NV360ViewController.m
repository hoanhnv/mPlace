//
//  NV360ViewController.m
//  mPlace
//
//  Created by hoanhnv on 14/01/2015.
//  Copyright (c) 2015 Nam Viet corp. All rights reserved.
//

#import "NV360ViewController.h"
@interface NV360ViewController ()
@property (nonatomic,strong) NSMutableArray *slideListRoot;
@end

@implementation NV360ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self prepareComponentViews];
    [self loadDataToComponentViews];
    [self loadListSlideShowImageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)prepareComponentViews{
    CGRect rectMain = [UIScreen mainScreen].bounds;
    self.vSlideShow.frame = CGRectMake(0, 0, 320,150);
    [self.vMainView addSubview:self.vSlideShow];
    
    self.previourtButton.frame = CGRectMake(0, 52, 30, 45);
    self.nextButton.frame      = CGRectMake(290,52,30, 45);
    [self.vMainView addSubview:self.previourtButton];
    [self.vMainView addSubview:self.nextButton];
    
    self.vMenuButton.frame = CGRectMake(0, CGRectGetMaxY(self.vSlideShow.frame), rectMain.size.width, 50);
    [self.vMainView addSubview:self.vMenuButton];
    
    self.vImageMost.frame = CGRectMake(0, CGRectGetMaxY(self.vMenuButton.frame), rectMain.size.width, 150);
    [self.vMainView addSubview:self.vImageMost];
    
    self.vIdeaMost.frame = CGRectMake(0, CGRectGetMaxY(self.vImageMost.frame), rectMain.size.width, 150);
    [self.vMainView addSubview:self.vIdeaMost];
    
    self.vMenuBottom.frame = CGRectMake(0, CGRectGetMaxY(self.vIdeaMost.frame), rectMain.size.width, 120);
    [self.vMainView addSubview:self.vMenuBottom];
    
    [self.vMainView setContentSize:CGSizeMake(rectMain.size.width, CGRectGetMaxY(self.vMenuBottom.frame)+20)];
}
-(void)loadDataToComponentViews{
    //self.arrMenuBottom = [NSArray arrayWithObjects:@"Đăng ảnh cảnh báo ATGT",@"Đăng ý tưởng đóng góp về ATGT",@"Thể lệ cuộc thi 360º ATGT", nil];
}

- (void) loadListSlideShowImageView {
    self.vSlideShow.type = iCarouselTypeRotary;
    self.vSlideShow.decelerationRate = 0.5;
    self.slideListRoot = [NSMutableArray array];
    for (int i = 0; i < 4; i ++) {
        [self.slideListRoot addObject:@"http://dantri4.vcmedia.vn/YaR0wuBQNMhqdl8mV5Yccccccccccc/Image/2015/01/T2/hai-553c1.jpg"];
    }
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3
                                                  target:self
                                                selector:@selector(autoScroll)
                                                userInfo:nil
                                                 repeats:YES];
    
    
    [self.vSlideShow reloadData];
}

- (IBAction)showLeftMenu:(id)sender {

    [Appdelegate toggleMenu];
}

- (IBAction)doSearch:(id)sender {
    
}

- (IBAction)doClickMenuButton:(id)sender {
     UIButton *btn = (UIButton*)sender;
    switch (btn.tag) {
        case 101:
        {
            break;
        }
        case 102:
        {
            break;
        }
        case 103:
        {
            break;
        }
        case 104:
        {
            break;
        }
        default:
            break;
    }
}

- (IBAction)doClickMenuBottom:(id)sender {
    UIButton *btn = (UIButton*)sender;
    switch (btn.tag) {
        case 105:
        {
            break;
        }
        case 106:
        {
            break;
        }
        case 107:
        {
            break;
        }
        default:
            break;
    }
}

- (IBAction)nextOrPreviourSlideImageViewPreessed:(id)sender {
    UIButton *btn = (UIButton*)sender;
    NSInteger index = self.vSlideShow.currentItemIndex;
    if (btn == self.nextButton) {
         index += 1;
    } else {
        index -= 1;
    }
    [self.vSlideShow scrollToItemAtIndex:index animated:YES];
}

#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return self.slideListRoot.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UIImageView *imageView = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, 199.0f)];
        view.backgroundColor = [UIColor lightGrayColor];
        view.contentMode = UIViewContentModeScaleAspectFill;
        
        imageView = [[UIImageView alloc] initWithFrame:view.bounds];
        imageView.backgroundColor = [UIColor clearColor];
        imageView.tag = 1;
        [view addSubview:imageView];
    }
    else {
        //get a reference to the label in the recycled view
        imageView = (UIImageView *)[view viewWithTag:1];
    }
    NSString *slideImageString = self.slideListRoot[index];
    [imageView setImageWithURL:[NSURL URLWithString:slideImageString] placeholderImage:[UIImage imageNamed:nil]];
    
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 1.1f;
    }
    return value;
}

- (void)carouselDidScroll:(iCarousel *)carousel {
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4
                                                  target:self
                                                selector:@selector(autoScroll)
                                                userInfo:nil
                                                 repeats:YES];
}

// auto scroll slide
- (void)autoScroll {
    
    NSInteger index = self.vSlideShow.currentItemIndex + 1;
    if (index >= 3) {
        index = 0;
    }
    
    [self.vSlideShow scrollToItemAtIndex:index animated:YES];
    
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    
}


@end
