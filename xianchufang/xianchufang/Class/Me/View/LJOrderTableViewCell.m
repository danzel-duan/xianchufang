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
        [self setChildrenFrame];
    }
    self.backgroundColor = LJCommonBgColor;
    return self;
}

#pragma mark --设置子控件
- (void)setChildrenFrame {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 402)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgView];
    
    //订单号
    self.orderNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(11, 0, SCREEN_WIDTH * 2 / 3, 35)];
    [self.orderNumLabel setFont:LJFontSize15];
    [self.orderNumLabel setTextColor:LJFontColor39];
    self.orderNumLabel.text = @"订单号：A123254343543";
    [bgView addSubview:self.orderNumLabel];
    //订单状态
    self.orderStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.orderNumLabel.lj_right, 0, SCREEN_WIDTH / 3, 35)];
    [self.orderStatusLabel setFont:LJFontSize12];
    [self.orderStatusLabel setTextColor:LJFontColored];
    self.orderStatusLabel.text = @"等待买家付款";
    self.orderStatusLabel.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:self.orderStatusLabel];
    //总计
    self.goodsPrice = @"4959999999";
    self.goodsNum= @"3";
    self.postPrice = @"不包含运费";
    
    UILabel *allLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.goodsTableView.lj_bottom, SCREEN_WIDTH - 12, 39)];
    //富文本
    NSString *string = [NSString stringWithFormat:@"共%@件商品 合计:￥%@(%@)",self.goodsNum,self.goodsPrice,self.postPrice];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:string];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor39,NSFontAttributeName:LJFontSize14} range:NSMakeRange(0, 9)];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor26,NSFontAttributeName:LJFontSize16} range:NSMakeRange(9, self.goodsPrice.length + 1)];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor61,NSFontAttributeName:LJFontSize12} range:NSMakeRange(self.goodsPrice.length + 10, self.postPrice.length + 2)];
    allLabel.attributedText = attribute;
    allLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:allLabel];
    //分割线
    UIView *cutLine = [[UIView alloc] initWithFrame:CGRectMake(0, allLabel.lj_bottom, SCREEN_WIDTH, 0.5)];
    cutLine.backgroundColor = LJCutLineColor;
    [self.contentView addSubview:cutLine];
    
//    [self addCancelAndPayBtn];
//    [self addReceiveBtn];
//    [self addEvaluateBtn];
    [self addReturnedGoodsBtn];
}

/*** 取消、付款 ***/
- (void)addCancelAndPayBtn {
    self.payBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 55, self.goodsTableView.lj_bottom + 45, 44, 25)];
    [self.payBtn setTitle:@"付款" forState:UIControlStateNormal];
    [self.payBtn setTitleColor:LJFontColored forState:UIControlStateNormal];
    [self.payBtn.titleLabel setFont:LJFontSize16];
    self.payBtn.layer.borderColor = LJFontColored.CGColor;
    self.payBtn.layer.borderWidth = 1;
    [self.payBtn setLayerWithCr:3];
    [self.payBtn addTarget:self action:@selector(payBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.payBtn];
    
    self.cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 145, self.goodsTableView.lj_bottom + 45, 81, 25)];
    [self.cancelBtn setTitle:@"取消订单" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:LJFontColor88 forState:UIControlStateNormal];
    [self.cancelBtn.titleLabel setFont:LJFontSize16];
    self.cancelBtn.layer.borderColor = LJFontColor88.CGColor;
    self.cancelBtn.layer.borderWidth = 1;
    [self.cancelBtn setLayerWithCr:3];
    [self.cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.cancelBtn];
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
    self.receiveBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 90, self.goodsTableView.lj_bottom + 45, 81, 25)];
    [self.receiveBtn setTitle:@"确认收货" forState:UIControlStateNormal];
    [self.receiveBtn setTitleColor:LJFontColored forState:UIControlStateNormal];
    [self.receiveBtn.titleLabel setFont:LJFontSize16];
    self.receiveBtn.layer.borderColor = LJFontColored.CGColor;
    self.receiveBtn.layer.borderWidth = 1;
    [self.receiveBtn setLayerWithCr:3];
    [self.receiveBtn addTarget:self action:@selector(receiveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.receiveBtn];
}

#pragma mark --确认收货事件
- (void)receiveBtnClick:(UIButton *)sender {
    LJLogFunc
}

#pragma mark --添加待评价
- (void)addEvaluateBtn {
    self.evaluateBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 90, self.goodsTableView.lj_bottom + 45, 81, 25)];
    [self.evaluateBtn setTitle:@"待评价" forState:UIControlStateNormal];
    [self.evaluateBtn setTitleColor:LJFontColored forState:UIControlStateNormal];
    [self.evaluateBtn.titleLabel setFont:LJFontSize16];
    self.evaluateBtn.layer.borderColor = LJFontColored.CGColor;
    self.evaluateBtn.layer.borderWidth = 1;
    [self.evaluateBtn setLayerWithCr:3];
    [self.evaluateBtn addTarget:self action:@selector(EvaluateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.evaluateBtn];
}

#pragma mark --待评价事件
- (void)EvaluateBtnClick:(UIButton *)sender {
    LJLogFunc
}

#pragma mark --添加待评价
- (void)addReturnedGoodsBtn {
    self.returnedGoodsBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 90, self.goodsTableView.lj_bottom + 45, 81, 25)];
    [self.returnedGoodsBtn setTitle:@"申请退货" forState:UIControlStateNormal];
    [self.returnedGoodsBtn setTitleColor:LJFontColored forState:UIControlStateNormal];
    [self.returnedGoodsBtn.titleLabel setFont:LJFontSize16];
    self.returnedGoodsBtn.layer.borderColor = LJFontColored.CGColor;
    self.returnedGoodsBtn.layer.borderWidth = 1;
    [self.returnedGoodsBtn setLayerWithCr:3];
    [self.returnedGoodsBtn addTarget:self action:@selector(ReturnedGoodsBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.returnedGoodsBtn];
}

#pragma mark --待评价事件
- (void)ReturnedGoodsBtnClick:(UIButton *)sender {
    LJLogFunc
}


//////////////################################################ 添加商品详情的TableView
#pragma mark --添加商品详情的TableView 
- (UITableView *)goodsTableView {
    if (!_goodsTableView) {
        _goodsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.orderNumLabel.lj_bottom, SCREEN_WIDTH, 292) style:UITableViewStylePlain];
        _goodsTableView.backgroundColor = LJCommonBgColor;
        _goodsTableView.delegate = self;
        _goodsTableView.dataSource = self;
        [self.contentView addSubview:_goodsTableView];
        [_goodsTableView registerClass:[LJOrderGoodsDetailTableViewCell class] forCellReuseIdentifier:@"LJOrderGoodsDetailTableViewCell"];
        _goodsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _goodsTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 97;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJOrderGoodsDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJOrderGoodsDetailTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
