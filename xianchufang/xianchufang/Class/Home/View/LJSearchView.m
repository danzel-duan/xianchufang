//
//  LJSearchView.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJSearchView.h"

@implementation LJSearchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = LJCommonBgColor;
        [self configureSub];
    }
    return self;
}

#pragma mark --配置子控件
- (void)configureSub {
  
}
- (IBAction)SearchBtnClick:(UIButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
       [self removeFromSuperview];
    }];
}

@end
