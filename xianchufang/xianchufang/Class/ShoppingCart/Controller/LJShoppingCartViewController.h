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
/*** 金额L ***/
@property (nonatomic,strong) UILabel *priceLabel;
/*** 暂时计算的金额 ***/
@property (nonatomic,assign) CGFloat Allprice;
/*** 最终要结算的金额 ***/
@property (nonatomic,assign) CGFloat totalPrice;
/*** 合计一系列背景 ***/
@property (nonatomic,strong) UIView *view1;
/*** 底部标签栏 ***/
@property (nonatomic,strong) UIView *bottomViewBg;

@end
