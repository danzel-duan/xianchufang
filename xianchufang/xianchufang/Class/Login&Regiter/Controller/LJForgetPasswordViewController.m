//
//  LJForgetPasswordViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 14/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJForgetPasswordViewController.h"
#import "LJForgetPasswordNextViewController.h"

@interface LJForgetPasswordViewController ()

@end

@implementation LJForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"忘记密码";
}

#pragma mark --下一步
- (void)ButtonClick:(UIButton *)sender {
    if ([self isNull]) {
        [self.tooltip Alert3content:@"手机号或验证码不能为空!" location:self.Button.lj_bottom + 25];
    }else {
        LJForgetPasswordNextViewController *vc = [[LJForgetPasswordNextViewController alloc] init];
        vc.phoneNum = self.firstTextField.text;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
