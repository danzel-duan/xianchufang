//
//  LJCheckUpdateViewController.h
//  xianchufang
//
//  Created by zhenglong duan on 17/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJBaseViewController.h"
typedef void (^CheckBlock)(NSString *);
@interface LJCheckUpdateViewController : LJBaseViewController
@property (nonatomic,copy) CheckBlock checkblock;
@end
