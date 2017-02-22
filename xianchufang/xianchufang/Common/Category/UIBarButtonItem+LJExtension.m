//
//  UIBarButtonItem+LJExtension.m
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "UIBarButtonItem+LJExtension.h"
@implementation UIBarButtonItem (LJExtension)

+ (instancetype)initWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}

+(instancetype)initWithText:(NSString *)text hightext:(NSString*)HighText color:(UIColor *)color highColor:(UIColor *)highColor target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (color == nil) {
       [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }else{
        [button setTitleColor:color forState:UIControlStateNormal];
    }
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitle:HighText forState:UIControlStateSelected];
    [button setTitleColor:highColor forState:UIControlStateSelected];
    [button.titleLabel setFont:LJFontSize15];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}
@end
