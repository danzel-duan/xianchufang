//
//  LJFoodCircleViewController.h
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJBaseViewController.h"

@interface LJShoppingCartViewController : LJBaseViewController
/*** 结算按钮 ***/
@property (nonatomic,strong) UIButton *settlementBtn;
/*** 金额 ***/
@property (nonatomic,strong) UILabel *priceLabel;
/*** 合计一系列背景 ***/
@property (nonatomic,strong) UIView *view1;
/*** 底部标签栏 ***/
@property (nonatomic,strong) UIView *bottomViewBg;
@end
