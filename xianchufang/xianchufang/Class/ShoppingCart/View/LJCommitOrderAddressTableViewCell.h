//
//  LJCommitOrderAddressTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 28/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJCommitOrderAddressTableViewCell : UITableViewCell
/*** 收货人姓名 ***/
@property (nonatomic,strong) UILabel *nameLabel;
/*** 收货人电话 ***/
@property (nonatomic,strong) UILabel *phoneLabel;
/*** 收货人地址 ***/
@property (nonatomic,strong) UILabel *addressLabel;
/*** 是否要出现右指示箭头 ***/
@property (nonatomic,assign) BOOL isAccess;
/*** 指示图标 ***/
@property (nonatomic,strong) UIImageView *access;
/*** 底部线条 ***/
@property (nonatomic,strong) UIImageView *bottomimage;
@end
