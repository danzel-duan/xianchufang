//
//  LJInputView.h
//  xianchufang
//
//  Created by zhenglong duan on 24/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJInputView : UIView
/*** 输入框 ***/
@property (nonatomic,strong) UITextField *inputTextField;
/*** 表情按钮 ***/
@property (nonatomic,strong) UIButton *emoticonsBtn;
/*** 发送按钮 ***/
@property (nonatomic,strong) UIButton *sendBtn;
@end
