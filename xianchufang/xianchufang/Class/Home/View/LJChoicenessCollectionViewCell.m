//
//  LJChoicenessCollectionViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 10/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJChoicenessCollectionViewCell.h"

@implementation LJChoicenessCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, spaceEdgeW(124), spaceEdgeH(100))];
        self.imageView.backgroundColor = LJRandomColor;
        [self.contentView addSubview:self.imageView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.imageView.lj_bottom, spaceEdgeW(124), spaceEdgeH(40))];
        self.nameLabel.textColor = LJFontColor26;
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.font = LJFontSize16;
        self.nameLabel.text = @"皮皮虾";
        [self.contentView addSubview:self.nameLabel];
        
        self.contentView.layer.borderWidth = 1.0f;
        self.contentView.layer.borderColor = LJCutLineColor.CGColor;
    }
    return self;
}
@end
