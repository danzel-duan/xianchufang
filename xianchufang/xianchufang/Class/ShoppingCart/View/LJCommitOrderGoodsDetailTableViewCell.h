//
//  LJCommitOrderGoodsDetailTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 28/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJOrderTableViewCell.h"
#import "LJCommitOrderCarMOder.h"
@interface LJCommitOrderGoodsDetailTableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
/*** 商品详情 ***/
@property (nonatomic,strong) UITableView *goodsTableView;
/*** 商品数量、商品价格 、 是否包含运费 ***/
@property (nonatomic,strong) UILabel *allLabel;
/*** cell白色背景 ***/
@property (nonatomic,strong) UIView *bgView;
/*** bottomView ***/
@property (nonatomic,strong) UIView *bottomView;
/*** dropBtn下拉展开按钮 ***/
@property (nonatomic,strong) UIButton *dropBtn;
/*** 当前cell所在的行 ***/
@property (nonatomic,assign) NSInteger row;
/*** 展开回调 ***/
@property (nonatomic,strong) dropBlock dropblock;
/*** 数据数组 ***/
@property (nonatomic,strong) LJCommitOrderCarMOder *orderDataModel;
/*** 存放商品Model的数组 ***/
@property (nonatomic,strong) NSMutableArray *goodsDataArr;
#pragma mark --下拉展开按钮
- (void)addDropBtn;
@end
