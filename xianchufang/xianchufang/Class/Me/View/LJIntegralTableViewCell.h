//
//  LJIntegralTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 22/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJIntegralTableViewCell : UITableViewCell
/*** 商品图片 ***/
@property (nonatomic,strong) UIImageView *goodsImageView;
/*** 商品名称 ***/
@property (nonatomic,strong) UILabel *goodsNameLabel;
/*** 送积分提示  扣除的话就移除 ***/
@property (nonatomic,strong) UIButton *tipIntegralBtn;
/*** 时间 ***/
@property (nonatomic,strong) UILabel *timeLabel;
/*** 积分 ***/
@property (nonatomic,strong) UILabel *integralLabel;
@end
