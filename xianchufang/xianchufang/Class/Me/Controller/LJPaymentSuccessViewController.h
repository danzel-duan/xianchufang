//
//  LJPaymentSuccessViewController.h
//  xianchufang
//
//  Created by zhenglong duan on 01/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.


#import <UIKit/UIKit.h>

@interface LJPaymentSuccessViewController : UIViewController
/*** 是否交易已完成 ***/
@property (nonatomic,assign) BOOL isSuccess;
/*** 积分 ***/
@property (nonatomic,strong) NSString *integral;
@end
