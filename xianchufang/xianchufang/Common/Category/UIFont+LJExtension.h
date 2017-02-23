//
//  UIFont+LJExtension.h
//  xianchufang
//
//  Created by zhenglong duan on 13/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#define IS_IPHONE_5s ([[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_IPHONE_6_PLUS ([[UIScreen mainScreen] bounds].size.height == 736.0f)
// 这里设置iPhone5s的字号数（iPhone6上字号为17,5s上为15）
#define IPHONE5s_INCREMENT 2

// 这里设置iPhone6Plus放大的字号数（iPhone6上字号为17，6ps上为18）
#define IPHONE6PLUS_INCREMENT 1

@interface UIFont (LJExtension)

+(UIFont *)adjustFont:(CGFloat)fontSize;
@end
