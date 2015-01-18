//
//  NVCollectionViewAlignLayout.m
//  KRLCollectionViewGridLayoutDemo
//
//  Created by hoanhnv on 17/01/2015.
//  Copyright (c) 2015 Lundbergsoft. All rights reserved.
//

#import "NVCollectionViewAlignLayout.h"

@implementation NVCollectionViewAlignLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect;
{
    NSArray *attrs = [super layoutAttributesForElementsInRect:rect];
    CGFloat baseline = -2;
    NSMutableArray *sameLineElements = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *element in attrs) {
        if (element.representedElementCategory == UICollectionElementCategoryCell) {
            CGRect frame = element.frame;
            CGFloat centerY = CGRectGetMidY(frame);
            if (ABS(centerY - baseline) > 1) {
                baseline = centerY;
                [self alignToTopForSameLineElements:sameLineElements];
                [sameLineElements removeAllObjects];
            }
            [sameLineElements addObject:element];
        }
    }
    [self alignToTopForSameLineElements:sameLineElements];//align once for the last line
    return attrs;
}

- (void)alignToTopForSameLineElements:(NSArray *)sameLineElements
{
    if (sameLineElements.count == 0) {
        return;
    }
    NSArray *sorted = [sameLineElements sortedArrayUsingComparator:^NSComparisonResult(UICollectionViewLayoutAttributes *obj1, UICollectionViewLayoutAttributes *obj2) {
        CGFloat height1 = obj1.frame.size.height;
        CGFloat height2 = obj2.frame.size.height;
        CGFloat delta = height1 - height2;
        return delta == 0. ? NSOrderedSame : ABS(delta)/delta;
    }];
    UICollectionViewLayoutAttributes *tallest = [sorted lastObject];
    [sameLineElements enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *obj, NSUInteger idx, BOOL *stop) {
        obj.frame = CGRectOffset(obj.frame, 0, tallest.frame.origin.y - obj.frame.origin.y);
    }];
}

@end
