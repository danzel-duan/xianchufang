//
//  LJBaseLoginRegiterViewController.h
//  xianchufang
//
//  Created by zhenglong duan on 14/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJTooltip.h"
#import "LJVerifyInfo.h"
@interface LJBaseLoginRegiterViewController : UIViewController<UITextFieldDelegate>
/*** 输入框里第一个图标 ***/
@property (nonatomic,strong) UIImageView *firstIconView;
/*** 输入框里第二个图标 ***/
@property (nonatomic,strong) UIImageView *secondIconView;
/*** 第一个输入框 ***/
@property (nonatomic,strong) UITextField *firstTextField;
/*** 第二个输入框 ***/
@property (nonatomic,strong) UITextField *secondTextField;
/*** 按钮 ***/
@property (nonatomic,strong) UIButton *Button;
/*** 提示文字 ***/
@property (nonatomic,strong) LJTooltip *tooltip;
/*** 第二个背景 ***/
@property (nonatomic,strong) UIView *bgView2;
/*** 协议背景 ***/
@property (nonatomic,strong) UIView *bgView3;
/*** 协议同意按钮 ***/
@property (nonatomic,strong) UIButton *protocolAgreeBtn;
/*** 是否同意协议 ***/
@property (nonatomic,assign) BOOL isAgreement;

- (void)ButtonClick:(UIButton *)sender;
#pragma mark --判断是否为空
- (BOOL)isNull;
@end
