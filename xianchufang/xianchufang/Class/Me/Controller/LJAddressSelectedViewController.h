//
//  LJAddressSelectedViewController.h
//  xianchufang
//
//  Created by zhenglong duan on 27/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJBaseViewController.h"
typedef void (^addressInfoBlock)(NSString *);
@interface LJAddressSelectedViewController : LJBaseViewController
@property (nonatomic,strong) addressInfoBlock addressInfoblock;  //地址返回
@end
