//
//  UIView+LJExtenion.h
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LJExtenion)
@property (nonatomic, assign) CGSize lj_size;
@property (nonatomic, assign) CGFloat lj_width;
@property (nonatomic, assign) CGFloat lj_height;
@property (nonatomic, assign) CGFloat lj_x;
@property (nonatomic, assign) CGFloat lj_y;
@property (nonatomic, assign) CGFloat lj_centerX;
@property (nonatomic, assign) CGFloat lj_centerY;

@property (nonatomic, assign) CGFloat lj_right;
@property (nonatomic, assign) CGFloat lj_bottom;


/*** 设置圆角 ***/
- (void)setLayerWithCr:(CGFloat)cornerRadius;
#pragma mark --设置阴影
- (void)setBgShadow;

#pragma mark --设置某几个角为圆角
/**
 @param corner 哪几个角
 @param radii 半径
 */
- (void)setCorneradi:(UIRectCorner)corner radii:(CGFloat)radii;
@end
