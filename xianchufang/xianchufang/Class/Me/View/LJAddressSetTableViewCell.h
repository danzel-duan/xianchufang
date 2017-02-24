//
//  LJAddressSetTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 16/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJBaseTableViewCell.h"
#import "LJAddressModel.h"
typedef void (^opeartionBlock)(NSInteger tag ,NSInteger row); //回调
@interface LJAddressSetTableViewCell : LJBaseTableViewCell
/*** 名字 ***/
@property (nonatomic,strong) UILabel *nameL;
/*** 手机号 ***/
@property (nonatomic,strong) UILabel *phoneL;
@property (nonatomic,strong) UILabel *addressL;
@property (nonatomic,strong) UIImageView *addressImV;
@property (nonatomic,strong) UILabel *defaultL;  //设置默认
@property (nonatomic,strong) UIButton *defaultBtn; //设置默认图标
@property (nonatomic,strong) UIButton *modifyBtn;  //修改
@property (nonatomic,strong) UIButton *deleteBtn; //删除
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,assign) NSInteger row;   ///当前所在的行
/*** 创建cell ***/
+(instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic,strong) opeartionBlock opeartionBlock;

@property (nonatomic,strong) LJAddressModel *addressModel;
@end
