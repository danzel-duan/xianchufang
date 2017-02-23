//
//  LJModifyPhoneNumViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 16/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJModifyPhoneNumViewController.h"
#import "LJTooltip.h"
@interface LJModifyPhoneNumViewController (){
    int time ;//时间
}
/*** 数字文本框 ***/
@property (nonatomic,strong) UITextField *numTextField;
/*** 验证按钮 ***/
@property (nonatomic,strong) UIButton *verifyBtn;
/*** 完成按钮 ***/
@property (nonatomic,strong) UIButton *finishBtn;
/*** 计时器 ***/
@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,strong) LJTooltip *alert; //提示框

@end

@implementation LJModifyPhoneNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"绑定手机号";
    /*** 背景 ***/
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 84, SCREEN_WIDTH, 44)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    self.numTextField = [[UITextField alloc] initWithFrame:CGRectMake(24, 0, 200, 44)];
    self.numTextField.tintColor = LJFontColor88;
    self.numTextField.placeholder = @"请输入验证码";
    self.numTextField.lj_centerY = view.lj_height / 2;
    self.numTextField.keyboardType = UIKeyboardTypePhonePad;
    self.numTextField.delegate =self;
    [view addSubview:self.numTextField];
    time = 60;
    
    self.verifyBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 110, 10, 100, 24)];
    [self.verifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.verifyBtn setTitleColor:LJTheMeColor forState:UIControlStateNormal];
    self.verifyBtn.layer.borderWidth = 1;
    self.verifyBtn.layer.borderColor = LJTheMeColor.CGColor;
    [self.verifyBtn setLayerWithCr:3];
    [self.verifyBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.verifyBtn addTarget:self action:@selector(VerifyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:self.verifyBtn];
    
    [self addFinishBtn];
    
    self.alert = [[LJTooltip alloc] initWithToolTipStyle:ToolTipStyleAlert1]; //设置提示框类型
}

#pragma mark --textField代理
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (string.length == 0) return YES;
    if (textField.text.length - range.length + string.length > 11) {
        return NO;
    }
    return YES;
}

#pragma mark --添加完成按钮
- (void)addFinishBtn {
    self.finishBtn = [[UIButton alloc] initWithFrame:CGRectMake(28, 181, SCREEN_WIDTH - 56, spaceEdgeH(44))];
    [self.finishBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.finishBtn.backgroundColor = LJTheMeColor;
    [self.finishBtn setLayerWithCr:3];
    [self.finishBtn addTarget:self action:@selector(finishBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.finishBtn];
}

- (void)VerifyBtnClick:(UIButton *)sender{
    //获取验证码 --->
    
    //添加计时器
    [self addTimer];
    self.verifyBtn.enabled =NO;
    self.verifyBtn.layer.borderColor = LJFontColor88.CGColor;
    [self.verifyBtn setTitleColor:LJFontColor88 forState:UIControlStateNormal];
}

- (void)finishBtnClick:(UIButton *)sender  {
    if ([self.numTextField.text isEqualToString:@""]){
        self.alert = [[LJTooltip alloc] initWithToolTipStyle:ToolTipStyleAlert3];
        if ([sender.currentTitle isEqualToString:@"下一步"]) {
            [self.alert Alert3content:@"验证码不能为空!" location:self.finishBtn.lj_y - 30];
        }else{
            [self.alert Alert3content:@"手机号不能为空!" location:self.finishBtn.lj_y - 30];
        }
        return;
    }
    
    if ([sender.currentTitle isEqualToString:@"下一步"]) {
        self.numTextField.text = @"";
        self.numTextField.placeholder = @"请输入新的手机号";
        [self.finishBtn setTitle:@"完成" forState:UIControlStateNormal];
        [self.verifyBtn removeFromSuperview];
        [self removeTimer];
    }else{
        //这里上传保存数据 ---->
        if (self.phoneNumblock) {
            self.phoneNumblock(self.numTextField.text);
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark --添加计时器
- (void)addTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(ChangeTime) userInfo:nil repeats:YES];
}

- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark --时间改变
- (void)ChangeTime {
    if (time > 0) {
        NSString *str = [NSString stringWithFormat:@"%ds",time--];
        [self.verifyBtn setTitle:str forState:UIControlStateNormal];
    }else{
        [self.verifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.verifyBtn.enabled = YES;
        self.verifyBtn.layer.borderColor = LJTheMeColor.CGColor;
        [self.verifyBtn setTitleColor:LJTheMeColor forState:UIControlStateNormal];
        [self removeTimer];
        time = 60;
    }
}

//bolck -------->>>>
- (void)returnPhoneNum:(phoneNumBlock)block {
    self.phoneNumblock = block;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
