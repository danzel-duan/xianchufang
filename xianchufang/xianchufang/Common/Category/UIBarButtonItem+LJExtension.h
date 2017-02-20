//
//  UIBarButtonItem+LJExtension.h
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LJExtension)
/*** 图片形式  ***/
+ (instancetype)initWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
/*** 文字形式  ***/
+(instancetype)initWithText:(NSString *)text hightext:(NSString*)HighText color:(UIColor *)color highColor:(UIColor *)highColor target:(id)target action:(SEL)action;
@end
