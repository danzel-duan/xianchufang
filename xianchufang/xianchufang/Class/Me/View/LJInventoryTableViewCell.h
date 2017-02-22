//
//  LJInventoryTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 20/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^selectBlock)(NSString *,int); //选择回调
typedef void (^nextBlock)(NSString * );   //详情回调
typedef void (^paymentBlock)(NSString * money); //支付回调
@interface LJInventoryTableViewCell : UITableViewCell
/*** 清单名称 ***/
@property (nonatomic,strong) UILabel *InventoryNameLabel;
/*** 选择 ***/
@property (nonatomic,strong) UIButton *selectBtn;
/*** 总金额 ***/
@property (nonatomic,strong) NSString *totalAmount;
/*** 商品数量 ***/
@property (nonatomic,strong) NSString *goodsNum;

@property (nonatomic,copy) selectBlock selectblock;

@property (nonatomic,copy) nextBlock nextblock;

@property (nonatomic,copy) paymentBlock paymentblock;
@end
