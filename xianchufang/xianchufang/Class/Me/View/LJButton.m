//
//  LJButton.m
//  xianchufang
//
//  Created by zhenglong duan on 13/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJButton.h"

@implementation LJButton
#pragma mark-重写Button 图片在上，文字在下
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.lj_y=14;
    self.imageView.lj_height = self.lj_height * 0.3;
    self.imageView.lj_width = self.imageView.lj_height;
    self.imageView.lj_centerX = self.lj_width * 0.5;
    
    self.titleLabel.lj_x = 0;
    self.titleLabel.lj_y = self.imageView.lj_bottom;
    self.titleLabel.lj_width = self.lj_width;
    self.titleLabel.lj_height = self.lj_height - self.titleLabel.lj_y;
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
    [self.titleLabel setFont:[ UIFont systemFontOfSize:13 weight:UIFontWeightLight]];
    [self.titleLabel setTextColor:[UIColor blackColor]];
    self.backgroundColor=[UIColor whiteColor];
}

@end
