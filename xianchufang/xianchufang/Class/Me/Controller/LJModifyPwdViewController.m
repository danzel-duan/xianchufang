//
//  LJModifyPwdViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 17/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJModifyPwdViewController.h"
#import "LJVerifyInfo.h"
@interface LJModifyPwdViewController ()
/*** okBtn ***/
@property (nonatomic,strong) UIButton *okBtn;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UITextField *oldPwdTextField;
@property (nonatomic,strong) UITextField *nePwdTextField1;
@property (nonatomic,strong) UITextField *nePwdTextField2;
@end

@implementation LJModifyPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"修改密码";
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 84, SCREEN_WIDTH, 135)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bgView];
    
    self.oldPwdTextField = [self addTextFieldsPlaceholder:@"当前登陆密码" y:0];
    self.nePwdTextField1 = [self addTextFieldsPlaceholder:@"新登陆密码" y:45];
    self.nePwdTextField2 = [self addTextFieldsPlaceholder:@"确认新登陆密码" y:90];
    
    [self addOkBtn];
}

#pragma mark --确认按钮
- (void)addOkBtn {
    self.okBtn = [[UIButton alloc] initWithFrame:CGRectMake(42, self.bgView.lj_bottom + 45, SCREEN_WIDTH - 84, 44)];
    self.okBtn.backgroundColor = LJColorFromRGB(0xc3c3c3);
    self.okBtn.enabled = NO;
    [self.okBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    [self.okBtn.titleLabel setTextColor:[UIColor whiteColor]];
    [self.okBtn.titleLabel setFont:LJFontSize];
    [self.okBtn setLayerWithCr:5];
    [self.okBtn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.okBtn];
}

#pragma mark --添加textField
- (UITextField *)addTextFieldsPlaceholder:(NSString *)placeholder y:(CGFloat)y {
    UITextField * textfield = [[UITextField alloc] initWithFrame:CGRectMake(24, y, SCREEN_WIDTH -24, 44)];
    textfield.placeholder = placeholder;
    [textfield setFont:LJFontSize];
    textfield.delegate = self;
    [textfield addTarget:self action:@selector(edingChange) forControlEvents:UIControlEventEditingChanged];
    textfield.keyboardType = UIKeyboardTypeASCIICapable;
    textfield.tintColor = LJFontColor;
    [textfield setSecureTextEntry:YES];
    [self.bgView addSubview:textfield];
    UIView *cutLine = [[UIView alloc] initWithFrame:CGRectMake(0, textfield.lj_bottom, SCREEN_WIDTH, 1)];
    
    cutLine.backgroundColor = LJCutLineColor;
    [self.bgView addSubview:cutLine];
    return textfield;
}

#pragma mark --监听保存按钮的状态
- (void)edingChange {
    if (self.oldPwdTextField.text.length > 0 && self.nePwdTextField1.text.length > 0 &&self.nePwdTextField2.text.length >0) {
        self.okBtn.backgroundColor = LJTheMeColor;
        self.okBtn.enabled =YES;
    }else{
        self.okBtn.backgroundColor = LJColorFromRGB(0xc3c3c3);
        self.okBtn.enabled =NO;
    }
}

#pragma mark --textField代理
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [LJVerifyInfo isPassWord:[textField.text stringByAppendingString:string]];
}

#pragma mark --okBtnClick
- (void)okBtnClick {
    //这里获取原有密码进行比较
    
    //这是比较两次的新密码是否一致
    if (![self.nePwdTextField2.text isEqualToString:self.nePwdTextField1.text]) {
        
    }
    ///这里上传数据 ------->>>>>>>>>>
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
