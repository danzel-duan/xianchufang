//
//  LJImageLeftButton.m
//  xianchufang
//
//  Created by zhenglong duan on 16/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJImageLeftButton.h"

@implementation LJImageLeftButton
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.lj_centerY= self.lj_height /2;
    self.imageView.lj_x = 42;
    [self.imageView sizeToFit];
    
    self.titleLabel.lj_x = self.imageView.lj_right + 16;
    self.imageView.lj_centerY= self.lj_height /2;
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
    [self.titleLabel setFont:LJFontSize];
    [self.titleLabel sizeToFit];
    [self.titleLabel setTextColor:LJFontColor];
    self.backgroundColor=[UIColor whiteColor];
}
@end
