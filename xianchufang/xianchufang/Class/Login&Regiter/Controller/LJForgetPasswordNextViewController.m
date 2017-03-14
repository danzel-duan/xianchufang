//
//  LJForgetPasswordNextViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 14/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJForgetPasswordNextViewController.h"

@interface LJForgetPasswordNextViewController ()

@end

@implementation LJForgetPasswordNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"忘记密码";
    [self.Button setTitle:@"完成" forState:UIControlStateNormal];
}

#pragma mark --重置密码
- (void)ButtonClick:(UIButton *)sender {
    if ([self isNull]) {
        [self.tooltip Alert3content:@"密码不能为空!" location:self.Button.lj_bottom + 25];
    }else {
        if (![self.firstTextField.text isEqualToString:self.secondTextField.text]) {
            [self.tooltip Alert3content:@"两次输入的密码不一致!" location:self.Button.lj_bottom + 25];
        }else {
            LJLog(@"self.phoneNum:%@  self.firstTextField.text:%@  self.secondTextField.text:%@",self.phoneNum,self.firstTextField.text,self.secondTextField.text);
            LJLog(@"重置密码");
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
