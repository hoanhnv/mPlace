//
//  NVYtuongCollectionViewCell.h
//  KRLCollectionViewGridLayoutDemo
//
//  Created by hoanhnv on 17/01/2015.
//  Copyright (c) 2015 Lundbergsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVIdeasAward.h"
@interface NVYtuongCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbDescription;
@property (weak, nonatomic) IBOutlet UILabel *lbComment;

-(void)configCellWithObject:(NVIdeasAward*)obj;
@end
