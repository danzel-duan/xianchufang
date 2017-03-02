//
//  LJGoodsCommentTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 02/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJGoodsCommentTableViewCell : UITableViewCell
/*** 用户头像 ***/
@property (nonatomic,strong) UIImageView *userImageView;
/*** 用户名称 ***/
@property (nonatomic,strong) UILabel *userNameLabel;
/*** 评论内容 ***/
@property (nonatomic,strong) UILabel *contentLabel;
/*** 图片数组 ***/
@property (nonatomic,strong) NSArray *pictureArr;
@end
