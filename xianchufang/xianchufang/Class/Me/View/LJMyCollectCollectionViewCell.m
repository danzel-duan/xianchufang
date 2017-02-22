//
//  LJMyCollectCollectionViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 22/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJMyCollectCollectionViewCell.h"

@implementation LJMyCollectCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame  {
    if (self = [super initWithFrame:frame]) {
        self.cateNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame)  / 2, 40)];
        [self.cateNameLabel setFont:LJFontSize16];
        [self.cateNameLabel setTextColor:LJFontColor26];
        self.cateNameLabel.text = @"水生蔬菜";
        self.cateNameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.cateNameLabel];
        
        self.cateNumLabel = [[UILabel alloc ] initWithFrame:CGRectMake(self.cateNameLabel.lj_right, 0, CGRectGetWidth(self.frame) / 2, 40)];
        [self.cateNumLabel setFont:LJFontSize14];
        [self.cateNumLabel setTextColor:LJFontColor61];
        self.cateNumLabel.textAlignment = NSTextAlignmentRight;
        self.cateNumLabel.text = @"2个菜品";
        [self addSubview:self.cateNumLabel];
        
        self.cateImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.cateNumLabel.lj_bottom, CGRectGetWidth(self.frame), spaceEdgeH(160))];
        self.cateImageView.backgroundColor = LJRandomColor;
        [self addSubview:self.cateImageView];
        
        CGFloat imgaeViewW = (CGRectGetWidth(self.frame) - 10) / 3;
        CGFloat imgaeViewH = (CGRectGetHeight(self.frame) - spaceEdgeH(208));
        for (int i = 0; i < 3; i++) {
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * 5 + imgaeViewW * i, self.cateImageView.lj_bottom + 8, imgaeViewW, imgaeViewH)];
            imageView.backgroundColor = LJRandomColor;
            [self addSubview:imageView];
        }
    }
    self.backgroundColor = [UIColor whiteColor];
    return self;
}

@end
