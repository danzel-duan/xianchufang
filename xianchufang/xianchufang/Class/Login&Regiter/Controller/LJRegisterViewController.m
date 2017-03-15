//
//  LJRegisterViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 14/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJRegisterViewController.h"
#import "LJRegisterNextViewController.h"

@interface LJRegisterViewController ()
/*** 获取验证码的按钮 ***/
@end

@implementation LJRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configBaseInfo];
}

#pragma mark --初始化控件
- (void)configBaseInfo {
    self.navigationItem.title = @"注册";
    self.bgView3.hidden = YES;
    self.secondTextField.placeholder = @"请输入验证码";
    self.secondIconView.image = [UIImage imageNamed:@"sign_key_icon"];
    [self.secondIconView sizeToFit];
    self.secondTextField.lj_width = spaceEdgeW(160);
    self.secondTextField.keyboardType = UIKeyboardTypePhonePad;
    [self.Button setTitle:@"下一步" forState:UIControlStateNormal];
    //获取验证码的按钮
    UIButton *verfityBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.secondTextField.lj_right + spaceEdgeW(10), 0, spaceEdgeW(85), spaceEdgeH(25))];
    [verfityBtn setTitleColor:LJFontColor88 forState:UIControlStateNormal];
    [verfityBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [verfityBtn.titleLabel setFont:LJFontSize14];
    verfityBtn.layer.borderColor = LJFontColor88.CGColor;
    verfityBtn.layer.borderWidth = 0.5f;
    [verfityBtn setLayerWithCr:spaceEdgeW(12)];
    verfityBtn.lj_centerY = self.bgView2.lj_height / 2;
    [verfityBtn addTarget:self action:@selector(verfityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView2 addSubview:verfityBtn];
}

#pragma mark --验证码点击事件
- (void)verfityBtnClick:(UIButton *)sender {
    if ([self.firstTextField.text isEqualToString:@""]) {
        [self.tooltip Alert3content:@"手机号不能为空!" location:self.Button.lj_bottom + 25];return;
    }
    if (![LJVerifyInfo isMobile:self.firstTextField.text]) {
        [self.tooltip Alert3content:@"手机号格式不正确!" location:self.Button.lj_bottom + 25];return;
    }
    __block int timeout = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            sender.userInteractionEnabled = YES;
            dispatch_source_cancel(_timer); //取消倒计时
            dispatch_async(dispatch_get_main_queue(), ^{
                [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
            });
        }else{
            sender.userInteractionEnabled = NO;
            int seconds = timeout % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                [sender setTitle:[NSString stringWithFormat:@"%ds",seconds] forState:UIControlStateNormal];
            }); 
            timeout--;
        } 
    }); 
    dispatch_resume(_timer);
    self._timer = _timer;
}

#pragma mark --下一步
- (void)ButtonClick:(UIButton *)sender {
    if ([self isNull]) {
        [self.tooltip Alert3content:@"手机号或验证码不能为空!" location:self.Button.lj_bottom + 25];
    }else {
        LJRegisterNextViewController *vc = [[LJRegisterNextViewController alloc] init];
        vc.phoneNum = self.firstTextField.text;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    if (!self._timer) return;
    NSArray *viewControllers = self.navigationController.viewControllers;
    if ([viewControllers indexOfObject:self] == NSNotFound) {
        dispatch_source_cancel(self._timer);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
