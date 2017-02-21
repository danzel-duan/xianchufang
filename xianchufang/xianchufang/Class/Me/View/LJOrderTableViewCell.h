//
//  LJOrderTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 21/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJOrderTableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
/*** 订单号 ***/
@property (nonatomic,strong) UILabel *orderNumLabel;
/*** 订单状态 ***/
@property (nonatomic,strong) UILabel *orderStatusLabel;
/*** 商品详情 ***/
@property (nonatomic,strong) UITableView *goodsTableView;
/*** 商品数量 ***/
@property (nonatomic,strong) NSString *goodsNum;
/*** 商品价格 ***/
@property (nonatomic,strong) NSString *goodsPrice;
/*** 是否包含运费 ***/
@property (nonatomic,strong) NSString *postPrice;

/*** 付款Button ***/
@property (nonatomic,strong) UIButton *payBtn;
/*** 取消订单Button ***/
@property (nonatomic,strong) UIButton *cancelBtn;
/*** 待收货 ***/
@property (nonatomic,strong) UIButton *receiveBtn;
/*** 评价 ***/
@property (nonatomic,strong) UIButton *evaluateBtn;
/*** 退货 ***/
@property (nonatomic,strong) UIButton *returnedGoodsBtn;
/*** 数据数组 ***/
@property (nonatomic,strong) NSMutableArray *orderCellData;
@end
