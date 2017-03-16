//
//  NSString+LJExtension.m
//  xianchufang
//
//  Created by zhenglong duan on 16/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "NSString+LJExtension.h"

@implementation NSString (LJExtension)

#pragma mark --富文本
+ (NSMutableAttributedString *)attrstr:(NSString *)str dic1:(NSDictionary *)dic1 dic2:(NSDictionary *)dic2  len1:(NSUInteger)len1 loc2:(NSUInteger)loc2 len2:(NSUInteger)len2 {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:str];
    [attr addAttributes:dic1 range:NSMakeRange(0, len1)];
    [attr addAttributes:dic2 range:NSMakeRange(loc2, len2)];
    return attr;
}
@end
