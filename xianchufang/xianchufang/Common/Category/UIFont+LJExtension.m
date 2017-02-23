//
//  UIFont+LJExtension.m
//  xianchufang
//
//  Created by zhenglong duan on 13/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "UIFont+LJExtension.h"

@implementation UIFont (LJExtension)
+(void)load{
    //获取替换后的类方法
    Method newMethod = class_getClassMethod([self class], @selector(adjustFont:));
    //获取替换前的类方法
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    //然后交换类方法
    method_exchangeImplementations(newMethod, method);
}

+(UIFont *)adjustFont:(CGFloat)fontSize{
    UIFont *newFont=nil;
    if (IS_IPHONE_5s){
        newFont = [UIFont adjustFont:fontSize - IPHONE5s_INCREMENT];
    }else if (IS_IPHONE_6_PLUS){
        newFont = [UIFont adjustFont:fontSize + IPHONE6PLUS_INCREMENT];
    }else{
        newFont = [UIFont adjustFont:fontSize];
    }
    return newFont;
}

/*
 
 load方法只会走一次，利用runtime的method进行方法的替换
 替换的方法里面（把系统的方法替换成我们自己写的方法），这里要记住写自己的方法，不然会死循环
 之后凡是用到systemFontOfSize方法的地方，都会被替换成我们自己的方法，即可改字体大小了
 注意：此方法只能替换 纯代码 写的控件字号，如果你用xib创建的控件且在xib里面设置的字号，那么替换不了！你需要在xib的
 
 awakeFromNib方法里面手动设置下控件字体
*/
@end
