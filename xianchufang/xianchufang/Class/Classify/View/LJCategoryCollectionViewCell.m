//
//  LJCategoryCollectionViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 06/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJCategoryCollectionViewCell.h"

@implementation LJCategoryCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, spaceEdgeH(5), spaceEdgeW(70), spaceEdgeH(65))];
        self.imageView.backgroundColor = LJRandomColor;
        self.imageView.lj_centerX = self.contentView.lj_centerX;
        [self.contentView addSubview:self.imageView];
        self.goodsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.imageView.lj_bottom, self.contentView.lj_width, self.contentView.lj_height - self.imageView.lj_height)];
        self.goodsNameLabel.textAlignment = NSTextAlignmentCenter;
        [self.goodsNameLabel setTextColor:LJFontColor39];
        [self.goodsNameLabel setFont:LJFontSize15];
        self.goodsNameLabel.text = @"白菜";
        [self.contentView addSubview:self.goodsNameLabel];
    }
    return self;
}

@end
