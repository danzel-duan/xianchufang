//
//  LJOrderTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 21/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJOrderTableViewCell.h"
#import "LJOrderGoodsDetailTableViewCell.h"
@implementation LJOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addBgView];
        [self setChildrenFrame]; //加载子控件
        [self addDropBtn];
    }
    self.backgroundColor = LJCommonBgColor;
    return self;
}

#pragma mark --数据源值传
- (void)setOrderDataModel:(LJOrderModel *)orderDataModel {
    _orderDataModel = orderDataModel;
    self.bgView.lj_height = orderDataModel.cellBgHeight; //背景高度重新计算赋值
    
    //将cell上嵌套的goodsTableView赋值
    self.goodsDataArr = [LJGoodsModel mj_objectArrayWithKeyValuesArray:self.orderDataModel.goodsArray];
    self.goodsTableView.lj_height = orderDataModel.cellTableViewHeight;
    [self.goodsTableView reloadData];
    
    self.bottomView.lj_y = self.goodsTableView.lj_bottom;
    /*** 控件文本赋值 ***/
    self.orderNumLabel.text = [NSString stringWithFormat:@"订单号：%@",_orderDataModel.orderNum];
    /*** 原有的子控件移除 ***/
    [self removeAllChildren];
    /*** 判断订单状态 ***/
    if (orderDataModel.orderStatus == OrderStatus0) {
        [self addCancelAndPayBtn];
        self.orderStatusLabel.text = @"等待买家付款";
    }else if (orderDataModel.orderStatus == OrderStatus1){
        self.orderStatusLabel.text = @"等待卖家配送";
        [self addReturnedGoodsBtn];
    }else if (orderDataModel.orderStatus == OrderStatus2){
        self.orderStatusLabel.text = @"等待买家收货";
        [self addReceiveBtn];
    }else if (orderDataModel.orderStatus == OrderStatus3){
        self.orderStatusLabel.text = @"订单正在处理";   ////////////////
    }else if (orderDataModel.orderStatus == OrderStatus4){
        self.orderStatusLabel.text = @"等待买家评论";
        [self addEvaluateBtn];
    }
    /*** 显示或隐藏下拉按钮 ***/
    if (self.orderDataModel.goodsArray.count < 3) {
        self.dropBtn.hidden = YES;                  /////cell上同一个控件用到不同的状态，用数据源的方式，如果让其显示或隐藏：就用：Hidden;不能用remove;
    }else{
        self.dropBtn.hidden = NO;
        self.dropBtn.selected = self.orderDataModel.isExpand;   //二次判断下拉按钮的状态
    }
    //富文本
    NSString *string = [NSString stringWithFormat:@"共%@件商品 合计:￥%@(%@)",_orderDataModel.goodsNum,_orderDataModel.totalPrice,_orderDataModel.postPticStr];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:string];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor39,NSFontAttributeName:LJFontSize14} range:NSMakeRange(0, 9)];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor26,NSFontAttributeName:LJFontSize16} range:NSMakeRange(9, _orderDataModel.totalPrice.length + 1)];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor61,NSFontAttributeName:LJFontSize12} range:NSMakeRange(_orderDataModel.totalPrice.length + 10, _orderDataModel.postPticStr.length + 2)];
    self.allLabel.attributedText = attribute;
    self.allLabel.textAlignment = NSTextAlignmentRight;
}

#pragma mark --添加背景
- (void)addBgView {
    if (self.bgView) return;
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.orderDataModel.cellBgHeight)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bgView];
}

#pragma mark --移除所有按钮
- (void)removeAllChildren {
    [self.payBtn removeFromSuperview];
    [self.cancelBtn removeFromSuperview];
    [self.receiveBtn removeFromSuperview];
    [self.evaluateBtn removeFromSuperview];
    [self.returnedGoodsBtn removeFromSuperview];
}

#pragma mark --设置子控件
- (void)setChildrenFrame {
    //订单号
    self.orderNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(11, 0, SCREEN_WIDTH * 2 / 3, spaceEdgeH(35))];
    [self.orderNumLabel setFont:LJFontSize15];
    [self.orderNumLabel setTextColor:LJFontColor39];
    [self.bgView addSubview:self.orderNumLabel];
    //订单状态
    self.orderStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.orderNumLabel.lj_right, 0, SCREEN_WIDTH / 3, spaceEdgeH(35))];
    [self.orderStatusLabel setFont:LJFontSize12];
    [self.orderStatusLabel setTextColor:LJFontColored];
    self.orderStatusLabel.textAlignment = NSTextAlignmentCenter;
    [self.bgView addSubview:self.orderStatusLabel];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.goodsTableView.lj_bottom, SCREEN_WIDTH, spaceEdgeH(80))];
    [self.bgView addSubview:bottomView];
    self.bottomView = bottomView;
    
    UILabel *allLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 12, spaceEdgeH(39))];
    [bottomView addSubview:allLabel];
    self.allLabel = allLabel;
    //分割线
    UIView *cutLine = [[UIView alloc] initWithFrame:CGRectMake(0, allLabel.lj_bottom, SCREEN_WIDTH, 0.5)];
    cutLine.backgroundColor = LJCutLineColor;
    [self.bottomView addSubview:cutLine];
}

#pragma mark --下拉展开按钮
- (void)addDropBtn {
    if (self.dropBtn) return;
    self.dropBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, spaceEdgeH(40), 40, 40)];
    self.dropBtn.lj_centerX = SCREEN_WIDTH / 2;
    [self.dropBtn setImage:[UIImage imageNamed:@"my_down_icon"] forState:UIControlStateNormal];
    [self.dropBtn setImage:[UIImage imageNamed:@"my_up_icon"] forState:UIControlStateSelected];
    [self.dropBtn addTarget:self action:@selector(dropBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:self.dropBtn];
}

#pragma mark --下拉按钮事件
- (void)dropBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.orderDataModel.isExpand = sender.selected;
    if (self.dropblock) {
        self.dropblock (self.row);
    }
}

/*** 取消、付款 ***/
- (void)addCancelAndPayBtn {
//    if (self.payBtn) return; //如果存在就直接返回
    self.payBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(55), spaceEdgeH(45), spaceEdgeW(44), spaceEdgeH(25))];
    [self.payBtn setTitle:@"付款" forState:UIControlStateNormal];
    [self.payBtn setTitleColor:LJFontColored forState:UIControlStateNormal];
    [self.payBtn.titleLabel setFont:LJFontSize16];
    self.payBtn.layer.borderColor = LJFontColored.CGColor;
    self.payBtn.layer.borderWidth = 1;
    [self.payBtn setLayerWithCr:3];
    [self.payBtn addTarget:self action:@selector(payBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:self.payBtn];
//     if (self.cancelBtn) return;
    self.cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(145),spaceEdgeH(45), spaceEdgeW(81), spaceEdgeH(25))];
    [self.cancelBtn setTitle:@"取消订单" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:LJFontColorc3 forState:UIControlStateNormal];
    [self.cancelBtn.titleLabel setFont:LJFontSize16];
    self.cancelBtn.layer.borderColor = LJFontColorc3.CGColor;
    self.cancelBtn.layer.borderWidth = 1;
    [self.cancelBtn setLayerWithCr:3];
    [self.cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:self.cancelBtn];
}

#pragma mark --付款事件
- (void)payBtnClick:(UIButton *)sender {
    LJLogFunc
}

#pragma mark --取消订单事件
- (void)cancelBtnClick:(UIButton *)sender {
    LJLogFunc
}

#pragma mark --添加确认收货 
- (void)addReceiveBtn {
//     if (self.receiveBtn) return;
    self.receiveBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(90), self.goodsTableView.lj_bottom + spaceEdgeH(45), spaceEdgeW(81), spaceEdgeH(25))];
    [self.receiveBtn setTitle:@"确认收货" forState:UIControlStateNormal];
    [self.receiveBtn setTitleColor:LJFontColored forState:UIControlStateNormal];
    [self.receiveBtn.titleLabel setFont:LJFontSize16];
    self.receiveBtn.layer.borderColor = LJFontColored.CGColor;
    self.receiveBtn.layer.borderWidth = 1;
    [self.receiveBtn setLayerWithCr:3];
    [self.receiveBtn addTarget:self action:@selector(receiveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:self.receiveBtn];
}

#pragma mark --确认收货事件
- (void)receiveBtnClick:(UIButton *)sender {
    LJLogFunc
}

#pragma mark --添加待评价
- (void)addEvaluateBtn {
//    if (self.evaluateBtn) return;
    self.evaluateBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(90), self.goodsTableView.lj_bottom + spaceEdgeH(45), spaceEdgeW(81), spaceEdgeH(25))];
    [self.evaluateBtn setTitle:@"待评价" forState:UIControlStateNormal];
    [self.evaluateBtn setTitleColor:LJFontColored forState:UIControlStateNormal];
    [self.evaluateBtn.titleLabel setFont:LJFontSize16];
    self.evaluateBtn.layer.borderColor = LJFontColored.CGColor;
    self.evaluateBtn.layer.borderWidth = 1;
    [self.evaluateBtn setLayerWithCr:3];
    [self.evaluateBtn addTarget:self action:@selector(EvaluateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:self.evaluateBtn];
}

#pragma mark --待评价事件
- (void)EvaluateBtnClick:(UIButton *)sender {
    LJLogFunc
}

#pragma mark --添加申请退货
- (void)addReturnedGoodsBtn {
//    if (self.returnedGoodsBtn) return;
    self.returnedGoodsBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(90), self.goodsTableView.lj_bottom + spaceEdgeH(45), spaceEdgeW(81), spaceEdgeH(25))];
    [self.returnedGoodsBtn setTitle:@"申请退货" forState:UIControlStateNormal];
    [self.returnedGoodsBtn setTitleColor:LJFontColored forState:UIControlStateNormal];
    [self.returnedGoodsBtn.titleLabel setFont:LJFontSize16];
    self.returnedGoodsBtn.layer.borderColor = LJFontColored.CGColor;
    self.returnedGoodsBtn.layer.borderWidth = 1;
    [self.returnedGoodsBtn setLayerWithCr:3];
    [self.returnedGoodsBtn addTarget:self action:@selector(ReturnedGoodsBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:self.returnedGoodsBtn];
}

#pragma mark --申请退货
- (void)ReturnedGoodsBtnClick:(UIButton *)sender {
    LJLogFunc
}


//////////////################################################ 添加商品详情的TableView
#pragma mark --添加商品详情的TableView 
- (UITableView *)goodsTableView {
    if (!_goodsTableView) {
        _goodsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, spaceEdgeH(35), SCREEN_WIDTH, self.orderDataModel.cellTableViewHeight) style:UITableViewStylePlain];
        _goodsTableView.backgroundColor = LJCommonBgColor;
        _goodsTableView.delegate = self;
        _goodsTableView.dataSource = self;
        [self.bgView addSubview:_goodsTableView];
        [_goodsTableView registerClass:[LJOrderGoodsDetailTableViewCell class] forCellReuseIdentifier:@"LJOrderGoodsDetailTableViewCell"];
        _goodsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _goodsTableView.bounces = NO;
        _goodsTableView.userInteractionEnabled = NO;
    }
    return _goodsTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goodsDataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return spaceEdgeH(97);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJOrderGoodsDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJOrderGoodsDetailTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    LJGoodsModel *model = self.goodsDataArr[indexPath.row];
    cell.goodsDataModel = model;
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
