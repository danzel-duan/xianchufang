//
//  NSString+LJExtension.h
//  xianchufang
//
//  Created by zhenglong duan on 16/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LJExtension)
/*** 在label显示两种样式的字类型 ***/
+ (NSMutableAttributedString *)attrstr:(NSString *)str dic1:(NSDictionary *)dic1 dic2:(NSDictionary *)dic2  len1:(NSUInteger)len1 loc2:(NSUInteger)loc2 len2:(NSUInteger)len2;
@end
