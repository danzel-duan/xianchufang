//
//  LJOnlineServiceTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 26/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJOnlineServiceModel.h"
@interface LJOnlineServiceTableViewCell : UITableViewCell
/*** 用户头像 ***/
@property (nonatomic,strong) UIImageView *headerImageView;
/*** 气泡 ***/
@property (nonatomic,strong) UIImageView *bubble;
/*** 文本内容 ***/
@property (nonatomic,strong) UILabel *contentLabel;
/*** 时间 ***/
@property (nonatomic,strong) UILabel *timeLabel;

@property (nonatomic,strong) LJOnlineServiceModel *onlineSericeModel;
@end
