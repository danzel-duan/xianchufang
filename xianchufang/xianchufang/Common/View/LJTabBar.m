//
//  LJTabBar.m
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJTabBar.h"
#import "LJBaseNavigationController.h"
#import <AVFoundation/AVFoundation.h>

@implementation LJTabBar

#pragma mark--初始化
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {    
    }
    return self;
}

#pragma mark--布局控件
- (void)layoutSubviews {
    [super layoutSubviews];
    for (UIView *subview in self.subviews) {
        // 过滤掉非UITabBarButton
        if (subview.class != NSClassFromString(@"UITabBarButton")) continue;
        UIButton *item = (UIButton *)subview;
        [item addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];  //点击某个按钮实现的事件
    }
}

- (void)tabBarButtonClick:(UIControl *)tabBarButton {
    for (UIView *imageView in tabBarButton.subviews) {
        //需要实现的帧动画
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.keyPath = @"transform.scale";
        animation.values = @[@0.0,@1.0];
        animation.duration = 0.15;
        animation.calculationMode = kCAAnimationCubic;
        //把动画添加上去
        [imageView.layer addAnimation:animation forKey:nil];
    }
}

@end
