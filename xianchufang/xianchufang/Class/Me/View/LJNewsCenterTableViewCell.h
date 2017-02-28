//
//  LJNewsCenterTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 28/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJNewsCenterTableViewCell : UITableViewCell
/*** 通知图标 ***/
@property (nonatomic,strong) UIImageView *iconImageView;
/*** 通知类型 ***/
@property (nonatomic,strong) UILabel *notificateTypeLabel;
/*** 时间 ***/
@property (nonatomic,strong) UILabel *timeLabel;
/*** 详情 ***/
@property (nonatomic,strong) UILabel *detailLabel;
@end
