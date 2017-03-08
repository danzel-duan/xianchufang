//
//  LJMenuItemCollectionViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJMenuItemCollectionViewCell.h"

@implementation LJMenuItemCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.itemImageView = [[UIImageView alloc] init];
        self.itemImageView.backgroundColor = LJRandomColor;
        [self.contentView addSubview:self.itemImageView];
        
        self.itemNameLabel = [[UILabel alloc] init];
        self.itemNameLabel.textColor = LJFontColor39;
        self.itemNameLabel.font = LJFontSize16;
        self.itemNameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.itemNameLabel];
        
        [self addConstranint]; //添加约束
    }
    return self;
}

#pragma mark --addConstranint 添加约束
- (void)addConstranint {
    self.itemImageView.frame = CGRectMake(0, spaceEdgeH(13), spaceEdgeW(45), spaceEdgeW(45));
    [self.itemImageView setLayerWithCr:spaceEdgeW(45) / 2];
    self.itemImageView.lj_centerX = self.contentView.lj_centerX;
    
    self.itemNameLabel.frame = CGRectMake(0, self.itemImageView.lj_bottom + spaceEdgeH(5), self.contentView.lj_width, spaceEdgeH(20));
    self.itemNameLabel.text = @"欢乐麻将";
    self.itemNameLabel.lj_centerX = self.contentView.lj_centerX;
}

@end
