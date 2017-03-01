//
//  LJOrderTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 21/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJOrderModel.h"
#import "LJGoodsModel.h"
typedef void (^dropBlock)(NSInteger); //展开回调

typedef void (^ClickBlock)(NSInteger);//按钮点击事件

@interface LJOrderTableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
/*** 订单号 ***/
@property (nonatomic,strong) UILabel *orderNumLabel;
/*** 订单状态 ***/
@property (nonatomic,strong) UILabel *orderStatusLabel;
/*** 商品详情 ***/
@property (nonatomic,strong) UITableView *goodsTableView;

/*** 商品数量、商品价格 、 是否包含运费 ***/
@property (nonatomic,strong) UILabel *allLabel;

/*** 付款Button ***/
@property (nonatomic,strong) UIButton *payBtn;   //3010
/*** 取消订单Button ***/
@property (nonatomic,strong) UIButton *cancelBtn; //3011
/*** 待收货 ***/
@property (nonatomic,strong) UIButton *receiveBtn; //3012
/*** 评价 ***/
@property (nonatomic,strong) UIButton *evaluateBtn; //3013
/*** 退货 ***/
@property (nonatomic,strong) UIButton *returnedGoodsBtn; //3014
/*** cell白色背景 ***/
@property (nonatomic,strong) UIView *bgView;
/*** bottomView ***/
@property (nonatomic,strong) UIView *bottomView;
/*** dropBtn下拉展开按钮 ***/
@property (nonatomic,strong) UIButton *dropBtn;
/*** 当前cell所在的行 ***/
@property (nonatomic,assign) NSInteger row;
/*** 展开回调 ***/
@property (nonatomic,copy) dropBlock dropblock;
/*** 按钮点击事件 ***/
@property (nonatomic,copy) ClickBlock clickblock;
/*** 数据数组 ***/
@property (nonatomic,strong) LJOrderModel *orderDataModel;
/*** 存放商品Model的数组 ***/
@property (nonatomic,strong) NSMutableArray *goodsDataArr;
#pragma mark --下拉展开按钮
- (void)addDropBtn;

@end
