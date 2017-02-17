//
//  LJVerifyInfo.h
//  xianchufang
//
//  Created by zhenglong duan on 17/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJVerifyInfo : NSObject
/*** 验证手机号 ***/
+ (BOOL)isMobile:(NSString*)mobile;
//是否是纯数字
+ (BOOL)isNumText:(NSString *)str;
/*** 是否为中文 ***/
+ (BOOL)isChinese:(NSString*)chinese;
/*** 密码验证：必须是包含大小写字母和数字的组合，不能使用特殊字符，长度在8-15之间。 ***/
+ (BOOL)isPassWord:(NSString *)PassWordStr;
@end
