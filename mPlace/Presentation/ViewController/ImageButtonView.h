//
//  ImageButtonView.h
//  AppTivi
//
//  Created by hoanhca on 7/13/14.
//  Copyright (c) 2014 GameXP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageButtonView : UIImageView{
    UIButton *_button;
}
@property (nonatomic, strong) UIButton *button;

- (id)initWithImage:(UIImage *)image;
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
