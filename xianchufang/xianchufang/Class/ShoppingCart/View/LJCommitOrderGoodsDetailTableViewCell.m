//
//  LJCommitOrderGoodsDetailTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 28/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJCommitOrderGoodsDetailTableViewCell.h"
#import "LJOrderGoodsDetailTableViewCell.h"
@implementation LJCommitOrderGoodsDetailTableViewCell
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
- (void)setOrderDataModel:(LJCommitOrderCarMOder *)orderDataModel {
    _orderDataModel = orderDataModel;
    self.bgView.lj_height = orderDataModel.cellBgHeight; //背景高度重新计算赋值
    
    //将cell上嵌套的goodsTableView赋值
    self.goodsDataArr = [LJGoodsModel mj_objectArrayWithKeyValuesArray:self.orderDataModel.goodsArray];
    self.goodsTableView.lj_height = orderDataModel.cellTableViewHeight;
    [self.goodsTableView reloadData];
    
    self.bottomView.lj_y = self.goodsTableView.lj_bottom;
    /*** 显示或隐藏下拉按钮 ***/
    if (self.orderDataModel.goodsArray.count < 3) {
        self.dropBtn.hidden = YES;                  /////cell上同一个控件用到不同的状态，用数据源的方式，如果让其显示或隐藏：就用：Hidden;不能用remove;
    }else{
        self.dropBtn.hidden = NO;
        self.dropBtn.selected = self.orderDataModel.isExpand;   //二次判断下拉按钮的状态
    }
    //富文本
    NSString *string = [NSString stringWithFormat:@"共%@件商品 总金额:￥%@(%@)",_orderDataModel.goodsNum,_orderDataModel.totalPrice,_orderDataModel.postPticStr];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:string];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor39,NSFontAttributeName:LJFontSize14} range:NSMakeRange(0, _orderDataModel.goodsNum.length + 9)];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor26,NSFontAttributeName:LJFontSize16} range:NSMakeRange(_orderDataModel.goodsNum.length + 9, _orderDataModel.totalPrice.length + 1)];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor61,NSFontAttributeName:LJFontSize12} range:NSMakeRange(_orderDataModel.totalPrice.length + _orderDataModel.goodsNum.length + 10, _orderDataModel.postPticStr.length + 2)];
    self.allLabel.attributedText = attribute;
    self.allLabel.textAlignment = NSTextAlignmentRight;
}

#pragma mark --添加背景
- (void)addBgView {
    if (self.bgView) return;
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.orderDataModel.cellBgHeight)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    //给bgView边框设置阴影
    self.bgView.layer.shadowOffset = CGSizeMake(1,3);
    self.bgView.layer.shadowOpacity = 0.2;
    self.bgView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bgView.layer.masksToBounds = NO;
    [self.contentView addSubview:self.bgView];
}

#pragma mark --设置子控件
- (void)setChildrenFrame {
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
    self.dropBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, spaceEdgeH(35), 30, 30)];
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

//////////////################################################ 添加商品详情的TableView
#pragma mark --添加商品详情的TableView
- (UITableView *)goodsTableView {
    if (!_goodsTableView) {
        _goodsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, spaceEdgeH(10), SCREEN_WIDTH, self.orderDataModel.cellTableViewHeight) style:UITableViewStylePlain];
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
