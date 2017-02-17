//
//  LJVerifyInfo.m
//  xianchufang
//
//  Created by zhenglong duan on 17/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJVerifyInfo.h"

@implementation LJVerifyInfo
/*** 验证手机号 ***/
+ (BOOL)isMobile:(NSString*)mobile
{
    NSString *regex = @"^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:mobile];
}

//是否是纯数字
+ (BOOL)isNumText:(NSString *)str {
    NSString * regex = @"^[0-9]*$";
    NSPredicate * pred  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:str];
}


/*** 密码验证：必须是包含大小写字母和数字的组合，不能使用特殊字符，长度在8-15之间。 ***/
+ (BOOL)isPassWord:(NSString *)PassWordStr {
    NSString * regex = @"^[A-Za-z0-9]+$";
    NSPredicate * pred  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:PassWordStr];
}

/*** 是否为中文 ***/
+ (BOOL)isChinese:(NSString*)chinese
{
    NSString *regex = @"^[\\u4e00-\\u9fa5]{0,}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject: chinese];
}

@end
