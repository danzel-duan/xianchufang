//
//  LJRegisterNextViewController.h
//  xianchufang
//
//  Created by zhenglong duan on 14/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJBaseLoginRegiterViewController.h"

@interface LJRegisterNextViewController : LJBaseLoginRegiterViewController
/*** 接收的手机号 ***/
@property (nonatomic,strong) NSString *phoneNum;
#pragma mark --完成注册
- (void)ButtonClick:(UIButton *)sender;
@end
