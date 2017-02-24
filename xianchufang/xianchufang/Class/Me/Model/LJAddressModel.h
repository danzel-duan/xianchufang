//
//  LJAddressModel.h
//  xianchufang
//
//  Created by zhenglong duan on 24/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJAddressModel : NSObject
/*** 姓名 ***/
@property (nonatomic,strong) NSString *name;
/*** 手机号 ***/
@property (nonatomic,strong) NSString *phone;
/*** 地址信息 ***/
@property (nonatomic,strong) NSString *address;
/*** 是否该地址为默认 ***/
@property (nonatomic,assign) BOOL isDefault;
@end
