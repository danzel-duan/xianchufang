//
//  LJBaseLoginRegiterViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 14/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJBaseLoginRegiterViewController.h"


@interface LJBaseLoginRegiterViewController ()

@end

@implementation LJBaseLoginRegiterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LJCommonBgColor;
    self.tooltip = [[LJTooltip alloc] initWithToolTipStyle:ToolTipStyleAlert3];
    [self initialization]; //1.初始化控件
}

#pragma mark --初始化控件
- (void)initialization {
    //logo图标
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64 + spaceEdgeH(30), spaceEdgeW(45), spaceEdgeW(45))];
    logoView.lj_centerX = self.view.lj_width / 2;
    logoView.image = [UIImage imageNamed:@"my_logo_icon"];
    [self.view addSubview:logoView];
    //标语
    UIImageView *sloganView = [[UIImageView alloc] initWithFrame:CGRectMake(0, logoView.lj_bottom + spaceEdgeH(10), SCREEN_WIDTH / 2, spaceEdgeH(25))];
    sloganView.lj_centerX = self.view.lj_width / 2;
    sloganView.image = [UIImage imageNamed:@"sign_slogan_icon"];
    [self.view addSubview:sloganView];
    //背景1
    UIView *bgView1 = [[UIView alloc] initWithFrame:CGRectMake(0, sloganView.lj_bottom + spaceEdgeH(10), spaceEdgeW(310), spaceEdgeH(44))];
    bgView1.lj_centerX = self.view.lj_centerX;
    bgView1.backgroundColor = [UIColor whiteColor];
    [bgView1 setLayerWithCr:spaceEdgeH(20)];
    [self.view addSubview:bgView1];
    //背景2
    UIView *bgView2 = [[UIView alloc] initWithFrame:CGRectMake(0, bgView1.lj_bottom + spaceEdgeH(10), spaceEdgeW(310), spaceEdgeH(44))];
    bgView2.lj_centerX = self.view.lj_centerX;
    bgView2.backgroundColor = [UIColor whiteColor];
    [bgView2 setLayerWithCr:spaceEdgeH(20)];
    [self.view addSubview:bgView2];
    self.bgView2 = bgView2;
    //按钮
    self.Button = [[UIButton alloc] initWithFrame:CGRectMake(0, bgView2.lj_bottom + spaceEdgeH(10), spaceEdgeW(310), spaceEdgeH(44))];
    self.Button.lj_centerX = self.view.lj_centerX;
    self.Button.backgroundColor = LJTheMeColor;
    [self.Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.Button.titleLabel setFont:LJFontSize18];
    [self.Button addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.Button setLayerWithCr:spaceEdgeH(20)];
    [self.view addSubview:self.Button];
    //icon 1
    self.firstIconView = [[UIImageView alloc] initWithFrame:CGRectMake(spaceEdgeW(15), 0, 0, 0)];
    self.firstIconView.image = [UIImage imageNamed:@"signin_mobilephone_icon"];
    [self.firstIconView sizeToFit];
    self.firstIconView.lj_centerY = bgView1.lj_height / 2;
    [bgView1 addSubview:self.firstIconView];
    //icon 2
    self.secondIconView = [[UIImageView alloc] initWithFrame:CGRectMake(spaceEdgeW(15), 0, 0, 0)];
    self.secondIconView.image = [UIImage imageNamed:@"sign_password_icon"];
    [self.secondIconView sizeToFit];
    self.secondIconView.lj_centerY = bgView2.lj_height / 2;
    [bgView2 addSubview:self.secondIconView];
    //textField 1
    self.firstTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.firstIconView.lj_right + spaceEdgeW(10), 0, spaceEdgeW(246), spaceEdgeH(20))];
    self.firstTextField.lj_centerY = bgView1.lj_height / 2;
    self.firstTextField.borderStyle = UITextBorderStyleNone;
    self.firstTextField.placeholder = @"输入您的手机号";
    self.firstTextField.keyboardType = UIKeyboardTypePhonePad;
    self.firstTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.firstTextField.font = LJFontSize15;
    self.firstTextField.tintColor = LJTheMeColor;
    self.firstTextField.delegate = self;
    [bgView1 addSubview:self.firstTextField];
    //textField 2
    self.secondTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.secondIconView.lj_right + spaceEdgeW(9), 0, spaceEdgeW(246), spaceEdgeH(20))];
    self.secondTextField.lj_centerY = bgView2.lj_height / 2;
    self.secondTextField.borderStyle = UITextBorderStyleNone;
    self.secondTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.secondTextField.secureTextEntry = YES;
    self.secondTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    self.secondTextField.placeholder = @"输入您的密码";
    self.secondTextField.font = LJFontSize15;
    self.secondTextField.tintColor = LJTheMeColor;
    self.secondTextField.delegate = self;
    [bgView2 addSubview:self.secondTextField];
    //协议背景
    self.bgView3 = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.lj_bottom - spaceEdgeH(55), spaceEdgeW(210), spaceEdgeH(16))];
    self.bgView3.lj_centerX = self.view.lj_width / 2;
    [self.view addSubview:self.bgView3];
    //协议同意按钮
    self.protocolAgreeBtn = [[UIButton alloc] init];
    [self.protocolAgreeBtn setImage:[UIImage imageNamed:@"sign_duihao_icon"] forState:UIControlStateNormal];
    [self.protocolAgreeBtn setImage:[UIImage imageNamed:@"sign_duihao_selected_icon"] forState:UIControlStateSelected];
    [self.protocolAgreeBtn sizeToFit];
    self.protocolAgreeBtn.lj_centerY = self.bgView3.lj_height / 2;
    [self.protocolAgreeBtn addTarget:self action:@selector(protocolAgreeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.protocolAgreeBtn.selected = YES;
    self.isAgreement = YES;
    [self.bgView3 addSubview:self.protocolAgreeBtn];
    //协议字
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.protocolAgreeBtn.lj_right + spaceEdgeW(3), 0, self.bgView3.lj_width - self.protocolAgreeBtn.lj_width - spaceEdgeW(5), spaceEdgeH(15))];
    label.text = @"我已阅读并同意鲜厨坊协议";
    label.font = LJFontSize14;
    label.textColor = LJFontColor88;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:tap];
    [self.bgView3 addSubview:label];
    //下划线
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(label.lj_x, label.lj_bottom, label.lj_width - spaceEdgeW(10), spaceEdgeH(1))];
    line.backgroundColor = LJFontColor88;
    [self.bgView3 addSubview:line];
}

#pragma mark --点击查看协议
- (void)tapClick:(UITapGestureRecognizer *)tap {
    UIViewController *vc = [NSClassFromString(@"LJProtocolViewController") new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark --协议同意按钮点击事件
- (void)protocolAgreeBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (!sender.selected) {
        self.Button.userInteractionEnabled = NO;
        self.Button.backgroundColor = LJFontColor88;
    }else{
        self.Button.userInteractionEnabled = YES;
        self.Button.backgroundColor = LJTheMeColor;
    }
    self.isAgreement = sender.selected;//是否同意
}

#pragma mark --判断是否为空
- (BOOL)isNull {
    if ([self.firstTextField.text isEqualToString:@""] ||[self.secondTextField.text isEqualToString:@""]) {return YES;}
    return NO;
}

#pragma mark --textField代理 判断长度
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (string.length == 0) return YES;
    if (textField == self.firstTextField) {
        if (textField.text.length - range.length + string.length > 11) {
            [self.tooltip Alert3content:@"手机号不能超过11位!" location:self.Button.lj_bottom + 25];
            return NO;
        }
    }else {
        if (textField.text.length - range.length + string.length > 16) {
            [self.tooltip Alert3content:@"密码不能超过16位!" location:self.Button.lj_bottom + 25];
            return NO;
        }
    }
    return YES;
}

- (void)ButtonClick:(UIButton *)sender {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
