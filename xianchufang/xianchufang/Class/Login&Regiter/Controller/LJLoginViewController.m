//
//  LJLoginViewController.m
//  xianchufang

//  Created by zhenglong duan on 14/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJLoginViewController.h"

@interface LJLoginViewController ()

@end

@implementation LJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configBaseInfo]; //配置信息
}

#pragma mark --初始化控件
- (void)configBaseInfo {
    self.navigationItem.title = @"登录";
    [self.Button setTitle:@"登录" forState:UIControlStateNormal];
    self.secondTextField.lj_width = spaceEdgeW(200);
    //显示密码
    UIButton *showPasswordBtn = [[UIButton alloc] init];
    [showPasswordBtn setImage:[UIImage imageNamed:@"sign_eyes_icon"] forState:UIControlStateNormal];
    [showPasswordBtn setImage:[UIImage imageNamed:@"sign_eyes_selected_icon"] forState:UIControlStateSelected];
    [showPasswordBtn sizeToFit];
    showPasswordBtn.lj_x = self.secondTextField.lj_right + spaceEdgeW(10);
    showPasswordBtn.lj_centerY = self.bgView2.lj_height / 2;
    [showPasswordBtn addTarget:self action:@selector(showPasswordBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView2 addSubview:showPasswordBtn];
    //注册
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(spaceEdgeW(33), self.Button.lj_bottom + spaceEdgeH(12), 0, 0)];
    [registerBtn setTitle:@"注册帐户" forState:UIControlStateNormal];
    [registerBtn.titleLabel setFont:LJFontSize14];
    [registerBtn setTitleColor:LJFontColor61 forState:UIControlStateNormal];
    [registerBtn sizeToFit];
    [registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    //忘记密码
    UIButton *forgetPasswordBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.Button.lj_bottom + spaceEdgeH(12), 0, 0)];
    [forgetPasswordBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetPasswordBtn.titleLabel setFont:LJFontSize14];
    [forgetPasswordBtn setTitleColor:LJFontColor61 forState:UIControlStateNormal];
    [forgetPasswordBtn sizeToFit];
    forgetPasswordBtn.lj_x = SCREEN_WIDTH - registerBtn.lj_width - spaceEdgeW(30);
    [forgetPasswordBtn addTarget:self action:@selector(forgetPasswordBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPasswordBtn];
}

#pragma mark --显示密码按钮点击事件
- (void)showPasswordBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.secondTextField.secureTextEntry = !sender.selected;
}


#pragma mark --登录按钮点击事件
- (void)ButtonClick:(UIButton *)sender {
    if ([self isNull]) {
        [self.tooltip Alert3content:@"手机号或密码不能为空!" location:self.Button.lj_bottom + 25];
    }else {
        if (![LJVerifyInfo isMobile:self.firstTextField.text]) {
            [self.tooltip Alert3content:@"手机号格式不正确!" location:self.Button.lj_bottom + 25];
        }else{
            LJLog(@"登陆");
            [self.navigationController popViewControllerAnimated:YES];
        }  
    }
}

#pragma mark --注册按钮点击事件
- (void)registerBtnClick:(UIButton *)sender {
    UIViewController *vc = [NSClassFromString(@"LJRegisterViewController") new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark --忘记密码按钮点击事件
- (void)forgetPasswordBtnClick:(UIButton *)sender {
    UIViewController *vc = [NSClassFromString(@"LJForgetPasswordViewController") new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
