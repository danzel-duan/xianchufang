//
//  LJAddressSetTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 16/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJAddressSetTableViewCell.h"

@implementation LJAddressSetTableViewCell


+(instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString* identifier=@"CommentViewCell";
    /***缓存中如果有就直接取***/
    LJAddressSetTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[LJAddressSetTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]; 
    }
    return  cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpChildrenFrame];
    }
    self.backgroundColor = LJCommonBgColor;
    return self;
}

#pragma mark --modifyBtnClick
- (void)modifyBtnClick:(UIButton *)sender {
    if (self.opeartionBlock) {
        self.opeartionBlock(sender.tag);
    }
}

#pragma mark --deleteBtnClick
- (void)deleteBtnClick:(UIButton *)sender {
    if (self.opeartionBlock) {
        self.opeartionBlock(sender.tag);
    }
}

#pragma mark --defaultBtnClick
- (void)defaultBtnClick:(UIButton *)sender {
    if (self.opeartionBlock) {
        self.opeartionBlock(sender.tag);
    }
    if (sender.selected == NO) {
        sender.selected =YES;
    }else{
        sender.selected = NO;
    }
}

#pragma mark --设置子控件
- (void)setUpChildrenFrame {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(8, 12, SCREEN_WIDTH - 16, 125)];
    bgView.backgroundColor = [UIColor whiteColor];
    [bgView setLayerWithCr:4];
    //给bgView边框设置阴影
    bgView.layer.shadowOffset = CGSizeMake(1,3);
    bgView.layer.shadowOpacity = 0.2;
    bgView.layer.shadowColor = [UIColor blackColor].CGColor;
    bgView.layer.masksToBounds = NO;
    [self.contentView addSubview:bgView];
    self.bgView = bgView;
    
    self.nameL = [[UILabel alloc] initWithFrame:CGRectMake(10, 14, 0, 0)];        //名字
    self.nameL.textColor = LJFontColor4c;
    self.nameL.text = @"李四    ";
    [self.nameL setFont:LJFontSize16];
    [self.nameL sizeToFit];
    [bgView addSubview:self.nameL];
    
    self.phoneL = [[UILabel alloc] initWithFrame:CGRectMake(bgView.lj_width - 128, 14, 120, 20)];  //手机号
    self.phoneL.textColor = LJFontColor4c;
    [self.phoneL setFont:LJFontSize16];
    self.phoneL.text = @"15518703027";
    self.phoneL.textAlignment = NSTextAlignmentRight;
    [bgView addSubview:self.phoneL];
    
    self.addressImV = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.nameL.lj_bottom + 16, 0, 0)];  //定位图标
    self.addressImV.image = [UIImage imageNamed:@"my_address"];
    [self.addressImV sizeToFit];
    [bgView addSubview:self.addressImV];
    
    self.addressL = [[UILabel alloc] initWithFrame:CGRectMake(self.addressImV.lj_right + 11, self.nameL.lj_bottom + 17, 0, 0)];    //地址
    self.addressL.textColor = LJFontColor4c;
    [self.addressL setFont:[UIFont systemFontOfSize:15]];
    self.addressL.text = @"上海市宝山区罗泾镇陈川新村180       ";
    [self.addressL sizeToFit];
    [bgView addSubview:self.addressL];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.addressL.lj_bottom + 10, SCREEN_WIDTH - 16, 1)];
    view.backgroundColor = LJCutLineColor;
    [bgView addSubview:view];
    
    self.defaultBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, view.lj_bottom + 12, 0, 0)];   //默认图标
    [self.defaultBtn setImage:[UIImage imageNamed:@"my_duihao_icon"] forState:UIControlStateNormal];
    [self.defaultBtn setImage:[UIImage imageNamed:@"my_duihao_icon_selected"] forState:UIControlStateSelected];
    [self.defaultBtn sizeToFit];
    [self.defaultBtn addTarget:self action:@selector(defaultBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.defaultBtn.tag = 3003;
    [bgView addSubview:self.defaultBtn];
    
    self.defaultL = [[UILabel alloc] initWithFrame:CGRectMake(self.defaultBtn.lj_right + 11,  view.lj_bottom + 13, 0, 0)];   //默认
    self.defaultL.textColor = LJFontColor4c;
    [self.defaultL setFont:LJFontSize16];
    self.defaultL.text = @"默认";
    [self.defaultL sizeToFit];
    [bgView addSubview:self.defaultL];
    
    self.modifyBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 124, view.lj_bottom + 12, 43, 22)];
    [self.modifyBtn setTitle:@"修改" forState:UIControlStateNormal];
    [self.modifyBtn setTitleColor:LJColorFromRGB(0x849cf6) forState:UIControlStateNormal];
    self.modifyBtn.layer.borderWidth = 1;
    self.modifyBtn.layer.borderColor = LJColorFromRGB(0x849cf6).CGColor;
    [self.modifyBtn setLayerWithCr:3];
    [self.modifyBtn.titleLabel setFont:LJFontSize15];
    [self.modifyBtn addTarget:self action:@selector(modifyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.modifyBtn.tag = 3001;
    [bgView addSubview:self.modifyBtn];
    
    self.deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.modifyBtn.lj_right + 15, view.lj_bottom + 12, 43, 22)];
    [self.deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [self.deleteBtn setTitleColor:LJFontColored forState:UIControlStateNormal];
    self.deleteBtn.layer.borderWidth = 1;
    self.deleteBtn.layer.borderColor = LJFontColored.CGColor;
    [self.deleteBtn setLayerWithCr:3];
    [self.deleteBtn.titleLabel setFont:LJFontSize15];
    [self.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.deleteBtn.tag = 3002;
    [bgView addSubview:self.deleteBtn];
}

@end
