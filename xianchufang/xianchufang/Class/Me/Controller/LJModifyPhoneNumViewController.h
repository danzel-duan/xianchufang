//
//  LJModifyPhoneNumViewController.h
//  xianchufang
//
//  Created by zhenglong duan on 16/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJBaseViewController.h"
typedef void (^phoneNumBlock)(NSString * phoneNum);  //用block 将手机号返回
@interface LJModifyPhoneNumViewController : LJBaseViewController
@property (nonatomic,copy) phoneNumBlock phoneNumblock;

- (void)returnPhoneNum :(phoneNumBlock)block;

@end
