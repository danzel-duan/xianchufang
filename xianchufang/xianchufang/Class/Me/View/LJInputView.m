//
//  LJInputView.m
//  xianchufang
//
//  Created by zhenglong duan on 24/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJInputView.h"

@implementation LJInputView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.lj_width, self.lj_height)];
        bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:bgView];
        //输入框
        self.inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(spaceEdgeW(12),0, spaceEdgeW(269), spaceEdgeH(30))];
        self.inputTextField.lj_centerY = self.lj_height / 2;
        self.inputTextField.borderStyle = UITextBorderStyleRoundedRect;
        self.inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.inputTextField.placeholder = @"这蔬菜....";
        [self addSubview:self.inputTextField];
        //表情按钮
        self.emoticonsBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.inputTextField.lj_right + spaceEdgeW( 6), 0, 20, 20)];
        self.emoticonsBtn.lj_centerY = self.lj_height / 2;
        [self.emoticonsBtn setImage:[UIImage imageNamed:@"my_biaoqing_icon"] forState:UIControlStateNormal];
        [self addSubview:self.emoticonsBtn];
        //发送按钮
        self.sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.emoticonsBtn.lj_right + spaceEdgeW(6), 0, spaceEdgeW(46), spaceEdgeH(30))];
        self.sendBtn.lj_centerY = self.lj_height / 2;
        [self.sendBtn setTitle:@"发送" forState:UIControlStateNormal];
        [self.sendBtn.titleLabel setFont: LJFontSize14];
        self.sendBtn.backgroundColor = LJTheMeColor;
        [self.sendBtn setLayerWithCr:5];
        [self addSubview:self.sendBtn];   
    }
    return self;
}

@end
