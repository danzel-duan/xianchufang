//
//  LJTooltip.m
//  xianchufang
//
//  Created by zhenglong duan on 15/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJTooltip.h"
#define selfWidth  SCREEN_WIDTH - 72
@implementation LJTooltip

- (instancetype)initWithToolTipStyle:(ToolTipStyle)toolTilpStyle {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, 44)];
        view.backgroundColor = LJTheMeColor ;
        [self addSubview:view];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 14, selfWidth, 20)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        [self.titleLabel setFont:LJFontSize];
        [view addSubview:self.titleLabel];
        
        switch (toolTilpStyle) {
            case ToolTipStyleHeader:
                [self modifyHeaderImage];       //样式一
                break;
            case ToolTipStyleName:
                [self modifyName];       //样式二
                break;
            case ToolTipStyleSex:
                [self modifyHeaderImage];       //样式三
                break;
            case ToolTipStyleAge:
                [self modifyHeaderImage];       //样式四
                break;
            default:
                break;
        }
    }
    return self;
}

/*** 样式一 ：修改头像 ***/
- (void)modifyHeaderImage {
    self.titleLabel.text = @"修改头像";
    [self addbgroundview];
    [self addCutline:88];
    [self addCutline:132];
    [self addCancelBtn];
}

/*** 样式一 ：修改昵称 ***/
- (void)modifyName {
    self.titleLabel.text = @"修改昵称";
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(22, 74, selfWidth - 44, 20)];
    self.nameTextField.placeholder = @"请输入新的名称";
    [self addSubview:self.nameTextField];
    [self addbgroundview];
    [self addCutline:94];
    [self addCutline];
    [self addOkBtn];
    [self addCancelBtn];
}

#pragma mark --下划线
- (void)addCutline :(CGFloat)y {
    UIView* cutLine = [[UIView alloc] initWithFrame:CGRectMake(20, y, selfWidth - 40, 1)];
    cutLine.backgroundColor = LJCutLineColor;
    [self addSubview:cutLine];
    if (y == 94) {
        cutLine.backgroundColor = LJTheMeColor;
    }
}

- (void)addCutline {
    self.cutLine = [[UIView alloc] initWithFrame:CGRectMake(0, 132, selfWidth, 1)];
    self.cutLine.backgroundColor = LJCutLineColor;
    [self addSubview:self.cutLine];
}

#pragma mark --添加确定按钮
- (void)addOkBtn {
    self.okBtn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 72) / 2 + 1, self.cutLine.lj_bottom, (SCREEN_WIDTH - 72) / 2 - 1, 44)];
    [self.okBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.okBtn setTitleColor:LJFontColor forState:UIControlStateNormal];
    [self.okBtn.titleLabel setFont:LJFontSize];
    self.okBtn.backgroundColor = [UIColor whiteColor];
    [self.okBtn addTarget:self action:@selector(oKClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.okBtn];
}

- (void)oKClick : (UIButton*)sender {
    if (self.okClickBlock) {
        self.okClickBlock(self.nameTextField.text);
    }
    [self hideTooltip];
}

#pragma mark --添加取消按钮
- (void)addCancelBtn {
    if (self.okBtn != nil) {
        self.cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.cutLine.lj_bottom,(SCREEN_WIDTH - 72) / 2 - 1 , 44)];
    }else{
        self.cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.cutLine.lj_bottom, selfWidth , 44)];
    }
    if (self.cutLine == nil) {
        self.cancelBtn.lj_y = 134;
    }else{
       UIView *view = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 72) / 2, self.cutLine.lj_bottom, 1, 44)];
       view.backgroundColor = LJCutLineColor;
       [self addSubview:view];
    }
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:LJFontColor forState:UIControlStateNormal];
    [self.cancelBtn.titleLabel setFont:LJFontSize];
    self.cancelBtn.backgroundColor = [UIColor whiteColor];
    [self.cancelBtn addTarget:self action:@selector(hideTooltip) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cancelBtn];
    
    self.frame =CGRectMake(0, 0, selfWidth, self.cancelBtn.lj_bottom);
    self.lj_centerX = SCREEN_WIDTH / 2;
    self.lj_centerY = SCREEN_HEIGHT / 2 -20;
    [self setLayerWithCr:5];
}

#pragma mark --添加背景
- (void)addbgroundview {
    self.bgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.bgroundView.backgroundColor = [UIColor blackColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideTooltip)];
    self.bgroundView.userInteractionEnabled = YES;
    [self.bgroundView addGestureRecognizer:tap];
    self.bgroundView.alpha = 0;
}

#pragma mark --显示提示框
- (void)showTooltip {
    [LJwindow addSubview:self.bgroundView];
    [LJwindow addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        self.bgroundView.alpha = 0.6;
        self.alpha = 1;
    }];
}

#pragma mark --隐藏提示框
- (void)hideTooltip {
    [UIView animateWithDuration:0.3 animations:^{
        self.bgroundView.alpha = 0;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.bgroundView removeFromSuperview];
    }];
}
@end
