//
//  UIView+LJExtenion.m
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "UIView+LJExtension.h"

@implementation UIView (LJExtenion)
- (CGSize)lj_size
{
    return self.frame.size;
}

- (void)setLj_size:(CGSize)lj_size
{
    CGRect frame = self.frame;
    frame.size = lj_size;
    self.frame = frame;
}

- (CGFloat)lj_width
{
    return self.frame.size.width;
}

- (CGFloat)lj_height
{
    return self.frame.size.height;
}

- (void)setLj_width:(CGFloat)lj_width
{
    CGRect frame = self.frame;
    frame.size.width = lj_width;
    self.frame = frame;
}

- (void)setLj_height:(CGFloat)lj_height
{
    CGRect frame = self.frame;
    frame.size.height = lj_height;
    self.frame = frame;
}

- (CGFloat)lj_x
{
    return self.frame.origin.x;
}

- (void)setLj_x:(CGFloat)lj_x
{
    CGRect frame = self.frame;
    frame.origin.x = lj_x;
    self.frame = frame;
}

- (CGFloat)lj_y
{
    return self.frame.origin.y;
}

- (void)setLj_y:(CGFloat)lj_y
{
    CGRect frame = self.frame;
    frame.origin.y = lj_y;
    self.frame = frame;
}

- (CGFloat)lj_centerX
{
    return self.center.x;
}

- (void)setLj_centerX:(CGFloat)lj_centerX
{
    CGPoint center = self.center;
    center.x = lj_centerX;
    self.center = center;
}

- (CGFloat)lj_centerY
{
    return self.center.y;
}

- (void)setLj_centerY:(CGFloat)lj_centerY
{
    CGPoint center = self.center;
    center.y = lj_centerY;
    self.center = center;
}

- (CGFloat)lj_right
{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)lj_bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setLj_right:(CGFloat)lj_right
{
    self.lj_x = lj_right - self.lj_width;
}

- (void)setLj_bottom:(CGFloat)lj_bottom
{
    self.lj_y = lj_bottom - self.lj_height;
}

/*** 设置圆角 ***/
- (void)setLayerWithCr:(CGFloat)cornerRadius
{
    self.layer.masksToBounds = YES; //没这句话它圆不起来
    self.layer.cornerRadius = cornerRadius; //设置图片圆角的尺度。
}

#pragma mark --设置阴影
- (void)setBgShadow {
    //给bgView边框设置阴影
    self.layer.shadowOffset = CGSizeMake(1,3);
    self.layer.shadowOpacity = 0.2;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.masksToBounds = NO;
}

@end
