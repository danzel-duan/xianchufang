//
//  LJInventoryTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 20/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^selectBlock)(NSString *,int); //选择回调
typedef void (^nextBlock)();   //详情回调
@interface LJInventoryTableViewCell : UITableViewCell
/*** 清单名称 ***/
@property (nonatomic,strong) UILabel *InventoryNameLabel;
/*** 选择 ***/
@property (nonatomic,strong) UIButton *selectBtn;
/*** 总金额 ***/
@property (nonatomic,strong) UILabel *totalAmountLabel;

@property (nonatomic,strong) selectBlock selectblock;

@property (nonatomic,strong) nextBlock nextblock;
@end
