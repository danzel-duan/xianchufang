//
//  LJTooltip.h
//  xianchufang
//
//  Created by zhenglong duan on 15/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
/*** 提示框类型 ***/
typedef NS_ENUM(NSInteger,ToolTipStyle) {
    ToolTipStyleName = 0,
    ToolTipStyleHeader ,    //头像修改
    ToolTipStyleSex    ,
    ToolTipStyleAge
};
typedef void (^okClickBlock)(NSString *);  //确定点击回调

@interface LJTooltip : UIView
/*** 背景 ***/
@property (nonatomic,strong) UIView *bgroundView;
/*** 确认 ***/
@property (nonatomic,strong) UIButton *okBtn;
/*** 取消 ***/
@property (nonatomic,strong) UIButton *cancelBtn;
/*** 标题 ***/
@property (nonatomic,strong) UILabel *titleLabel;
/*** 样式3里面的选择 『男』的小圈圈 ***/
@property (nonatomic,strong) UIImageView *cricle1;
/*** 样式3里面的选择 『女』的小圈圈 ***/
@property (nonatomic,strong) UIImageView *cricle2;
/*** textField ***/
@property (nonatomic,strong) UITextField *nameTextField;
/*** 分割线 ***/
@property (nonatomic,strong) UIView *cutLine;

@property (nonatomic,strong) okClickBlock okClickBlock;

- (instancetype)initWithToolTipStyle:(ToolTipStyle)toolTilpStyle;

#pragma mark --显示提示框
- (void)showTooltip;
#pragma mark --隐藏提示框
- (void)hideTooltip;
@end
