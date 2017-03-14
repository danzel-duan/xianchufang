//
//  LJRegisterNextViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 14/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJRegisterNextViewController.h"

@interface LJRegisterNextViewController ()

@end

@implementation LJRegisterNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configBaseInfo];
}

#pragma mark --初始化控件
- (void)configBaseInfo {
    self.navigationItem.title = @"注册";
    self.firstIconView.image = [UIImage imageNamed:@"sign_password_icon"];
    [self.firstIconView sizeToFit];
    self.firstTextField.placeholder = @"请设置您的密码";
    self.secondTextField.placeholder = @"确认您的密码";
    self.firstTextField.secureTextEntry = YES;
    self.firstTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    self.firstTextField.delegate = self;
    self.secondTextField.delegate = self;
    [self.Button setTitle:@"注册" forState:UIControlStateNormal];
}

#pragma mark --textField代理 判断长度
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (string.length == 0) return YES;
    if (textField.text.length - range.length + string.length > 16) {
        [self.tooltip Alert3content:@"密码不能超过16位!" location:self.Button.lj_bottom + 25];
        return NO;
    }
    return YES;
}

#pragma mark --完成注册
- (void)ButtonClick:(UIButton *)sender {
    if ([self isNull]) {
        [self.tooltip Alert3content:@"密码不能为空!" location:self.Button.lj_bottom + 25];
    }else {
        if (![self.firstTextField.text isEqualToString:self.secondTextField.text]) {
            [self.tooltip Alert3content:@"两次输入的密码不一致!" location:self.Button.lj_bottom + 25];
        }else {
            LJLog(@"self.phoneNum:%@  self.firstTextField.text:%@  self.secondTextField.text:%@",self.phoneNum,self.firstTextField.text,self.secondTextField.text);
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
