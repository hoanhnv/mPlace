//
//  ImageButtonView.m
//  AppTivi
//
//  Created by hoanhca on 7/13/14.
//  Copyright (c) 2014 GameXP. All rights reserved.
//

#import "ImageButtonView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ImageButtonView

- (id)initWithImage:(UIImage *)image
{
	self = [super initWithImage:image];
	
	if (_button == nil)
	{
		_button = [UIButton buttonWithType:UIButtonTypeCustom];
		_button.frame = CGRectZero;
		[self addSubview:_button];
		[self bringSubviewToFront:_button];
		[self setUserInteractionEnabled:YES];
//		
//		self.layer.shadowColor = [UIColor blackColor].CGColor;
//		self.layer.shadowOffset = CGSizeMake(0, 1);
//		self.layer.shadowOpacity = 1;
//		self.layer.shadowRadius = 3.0;
		
		_button.backgroundColor = (image == nil ? [UIColor blackColor] : [UIColor clearColor]);
}
	
	return (self);
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
	if (_button != nil)
	{
		[_button addTarget:target action:action forControlEvents:controlEvents];
	}
}

- (void)setFrame:(CGRect)rect
{
	[super setFrame:rect];
	
	if (_button != nil)
	{
		self.button.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
	}
}


@end
