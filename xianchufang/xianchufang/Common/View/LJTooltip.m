//
//  LJTooltip.m
//  xianchufang
//
//  Created by zhenglong duan on 15/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJTooltip.h"
#import "LJImageLeftButton.h"
#define selfWidth  SCREEN_WIDTH - 72
@implementation LJTooltip

- (instancetype)initWithToolTipStyle:(ToolTipStyle)toolTilpStyle {
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.okLocationMiddle = YES;
        
        switch (toolTilpStyle) {
            case ToolTipStyleHeader:
                [self modifyHeaderImage];       //样式一
                break;
            case ToolTipStyleName:
                [self modifyName];       //样式二
                break;
            case ToolTipStyleSex:
                [self modifySex];       //样式三
                break;
            case ToolTipStyleAge:
                [self modifyAge];       //样式四
                break;
            case ToolTipStyleAlert1:
                [self alert1];       //样式五
                break;
            case ToolTipStyleAlert2:
                [self alert2];       //样式六
                break;
            case ToolTipStyleAddress:
                [self Address];       //样式七
                break;
            case ToolTipStyleAlert3:
                [self alert3];       //样式八
                break;
            default:
                break;
        }
    }
    return self;
}

/*** 样式一 ：修改头像 ***/
- (void)modifyHeaderImage {
    [self addTitle];
    self.titleLabel.text = @"修改头像";
    [self addbgroundview];
    [self addOtherBtn:43 title:@"相机" image:@"my_camera_icon" imageH:@"" tag:2001];
    [self addCutline:88];
    [self addOtherBtn:89 title:@"图库" image:@"my_picture_icon" imageH:@"" tag:2002];
    [self addCutline:132];
    [self addCancelBtn];
}

/*** 样式一 ：修改昵称 ***/
- (void)modifyName {
    [self addTitle];
    self.titleLabel.text = @"修改昵称";
    self.okLocationMiddle =NO;
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(22, 74, selfWidth - 44, 20)];
    self.nameTextField.placeholder = @"请输入新的名称";
    [self addSubview:self.nameTextField];
    [self addbgroundview];
    [self addCutline:94];
    [self addBottomCutline:132];
    [self addOkBtn];
    [self addCancelBtn];
}

/*** 样式三 ：修改性别 ***/
- (void)modifySex {
    [self addTitle];
    self.titleLabel.text = @"性别";
    [self addbgroundview];
    [self addOtherBtn:43 title:@"男" image:@"my_circle_icon" imageH:@"my_circle_icon_selected" tag:2003];
    [self addOtherBtn:89 title:@"女" image:@"my_circle_icon" imageH:@"my_circle_icon_selected" tag:2004];
    [self addCutline:88];
    [self setSelfLocation:132];
}

/*** 样式四 ：修改年龄 ***/
- (void)modifyAge {
    [self addTitle];
    self.titleLabel.text = @"生日";
    [self addbgroundview];
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 44, selfWidth, 150)];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self addSubview:self.datePicker];
    [self addBottomCutline:self.datePicker.lj_bottom + 1];
    [self addOkBtn];
    [self setSelfLocation:self.okBtn.lj_bottom];
}

/*** 样式五 ：警告样式一 ***/
- (void)alert1 {
    [self addTitle];
    self.titleLabel.text = @"提示";
    self.titleLabel.lj_x = 0;
    [self addbgroundview];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

/*** 样式六 ：警告样式二 ***/
- (void)alert2 {
    [self addTitle];
    self.titleLabel.text = @"提示";
    self.titleLabel.lj_x = 0;
    [self addbgroundview];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

/*** 样式八 ：警告样式三 ***/
- (void)alert3 {
    self.frame =CGRectMake(0, 0, selfWidth, 30);
    self.backgroundColor = [UIColor lightGrayColor];
    self.lj_centerX = SCREEN_WIDTH / 2;
    [self setLayerWithCr:10];
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, selfWidth - 10, 30)];
    self.contentLabel.backgroundColor = [UIColor clearColor];
    self.contentLabel.textColor = [UIColor whiteColor];
    self.contentLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentLabel setFont:LJFontSize];
    [self addSubview:self.contentLabel];
}

/*** 样式七 ***/
- (void)Address {
    self.regionArr =@[@{@"key":@[@"1",@"2",@"3",@"4",@"5"]},@{@"key":@[@"1",@"2",@"3"]}];
    [self addTitle];
    self.titleLabel.text = @"请选择区域";
    self.okLocationMiddle = NO;
    [self addbgroundview];
    [self addAddressPicker];
    [self addBottomCutline:self.AddressPicker.lj_bottom + 1];
    [self addOkBtn];
    [self addCancelBtn];
    [self setSelfLocation:self.okBtn.lj_bottom];
}

#pragma mark --添加title
- (void)addTitle {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, 44)];
    view.backgroundColor = LJTheMeColor ;
    [self addSubview:view];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 14, selfWidth, 20)];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    [self.titleLabel setTextColor:[UIColor whiteColor]];
    [self.titleLabel setFont:LJFontSize];
    [view addSubview:self.titleLabel];
    
}

#pragma mark --添加内容
- (void)addContent {
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 54, selfWidth - 44, 20)];
    self.contentLabel.backgroundColor = [UIColor whiteColor];
    self.contentLabel.textColor = LJFontColor;
    self.contentLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.contentLabel setFont:LJFontSize];
    [self addSubview:self.contentLabel];
}

#pragma mark --地区选择器
- (void)addAddressPicker {
    self.AddressPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, selfWidth, 100)];
    self.AddressPicker.backgroundColor = [UIColor whiteColor];
    self.AddressPicker.delegate =self;
    self.AddressPicker.dataSource = self;
    [self addSubview:self.AddressPicker];
}

/////////// PickerView代理 ////////
-  (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return 1;
    }else{
        NSDictionary *dic = self.regionArr[component -1];
        NSArray *ar =[dic objectForKey:@"key"];
        return ar.count;
    }
        
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return @"上海";
    }else{
        NSDictionary *dic = self.regionArr[component - 1];
        NSArray *ar =[dic objectForKey:@"key"];
        return ar[row];
    }
        
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
//    self.address = self.regionArr[component][row];
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
//self.cutLine
- (void)addBottomCutline :(CGFloat)y {
    self.cutLine = [[UIView alloc] initWithFrame:CGRectMake(0, y, selfWidth, 1)];
    self.cutLine.backgroundColor = LJCutLineColor;
    [self addSubview:self.cutLine];
}

#pragma mark --其它按钮
- (void)addOtherBtn :(CGFloat)y title:(NSString *)title image:(NSString *)image imageH:(NSString *)imageH tag :(NSInteger)tag{
    LJImageLeftButton *otherBth = [[LJImageLeftButton alloc] initWithFrame:CGRectMake(0,y , selfWidth, 44)];
    [otherBth setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [otherBth setImage:[UIImage imageNamed:imageH] forState:UIControlStateHighlighted];
    [otherBth setTitle:title forState:UIControlStateNormal];
    otherBth.tag = tag;    //2001:相机 2002：图库 2003：男 2004：女
    otherBth.backgroundColor = [UIColor clearColor];
    [otherBth addTarget:self action:@selector(otherBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:otherBth];
}

#pragma mark --otherBtn Click
- (void)otherBtnClick :(UIButton *)sender {
    if (_okClickBlock) {
        switch (sender.tag) {
            case 2001:
                _okClickBlock(@"相机");
                break;
            case 2002:
                _okClickBlock(@"图库");
                break;
            case 2003:
                _okClickBlock(@"男");
                break;
            case 2004:
                _okClickBlock(@"女");
                break;
            default:
                break;
        }
    }
    [self hideTooltip];
}

#pragma mark --添加确定按钮
- (void)addOkBtn {
    self.okBtn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 72) / 2 + 1, self.cutLine.lj_bottom, (SCREEN_WIDTH - 72) / 2 - 1, 44)];
    if (self.okLocationMiddle) {
        self.okBtn.lj_x= 0;
        self.okBtn.lj_y =self.cutLine.lj_bottom + 1;
        self.okBtn.lj_width = selfWidth;
    }
    [self.okBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.okBtn setTitleColor:LJFontColor forState:UIControlStateNormal];
    [self.okBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.okBtn.titleLabel setFont:LJFontSize];
    self.okBtn.backgroundColor = [UIColor whiteColor];
    [self.okBtn addTarget:self action:@selector(oKClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.okBtn];
    self.okLocationMiddle = YES;
}

- (void)oKClick : (UIButton*)sender {
    if (self.okClickBlock) {
        if (self.datePicker == nil && self.nameTextField) {
            self.okClickBlock(self.nameTextField.text);
        }else if(self.datePicker != nil){
            NSString *strDate = [self dateToString:self.datePicker.date withDateFormat:@"yyy/MM/dd"];
            self.okClickBlock(strDate);
        }else if(self.AddressPicker != nil){
            self.okClickBlock(self.address);
        }else{
            self.okClickBlock(self.okBtn.titleLabel.text);
        }
    }
    [self hideTooltip];
}

//日期格式转字符串
- (NSString *)dateToString:(NSDate *)date withDateFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
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
    [self.cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.cancelBtn.titleLabel setFont:LJFontSize];
    self.cancelBtn.backgroundColor = [UIColor whiteColor];
    [self.cancelBtn addTarget:self action:@selector(hideTooltip) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cancelBtn];
    
    [self setSelfLocation:self.cancelBtn.lj_bottom];
}

#pragma mark --设置self 大小位置
- (void)setSelfLocation:(CGFloat)height {
    self.frame =CGRectMake(0, 0, selfWidth, height);
    self.lj_centerX = SCREEN_WIDTH / 2;
    self.lj_centerY = SCREEN_HEIGHT / 2 -20;
    [self setLayerWithCr:5];
}

#pragma mark --添加背景
- (void)addbgroundview {
    self.bgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.bgroundView.backgroundColor = [UIColor blackColor];
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


//////////
////////
/////
#pragma mark --Alert1更改属性
- (void)Alert1content:(NSString *)content {
    [self addContent];
    self.contentLabel.text = content;
    [self addBottomCutline:self.contentLabel.lj_bottom + 10];
    [self addOkBtn];
    [self setSelfLocation:self.okBtn.lj_bottom];
}

- (void)Alert2content:(NSString *)content {
    self.okLocationMiddle = NO;
    [self addContent];
    self.contentLabel.text = content;
    [self.contentLabel setTextAlignment:NSTextAlignmentCenter];
    self.contentLabel.numberOfLines = 0;
    [self addBottomCutline:self.contentLabel.lj_bottom + 10];
    [self addOkBtn];
    [self addCancelBtn];
    [self setSelfLocation:self.okBtn.lj_bottom];
}

- (void)Alert3content:(NSString *)content location:(CGFloat)location {
    self.lj_centerY = location;
    self.contentLabel.text = content;
    [LJwindow addSubview:self];
    self.alpha = 1;
    [UIView animateWithDuration:2 animations:^{
        self.alpha = 0;
    }];
}
@end
