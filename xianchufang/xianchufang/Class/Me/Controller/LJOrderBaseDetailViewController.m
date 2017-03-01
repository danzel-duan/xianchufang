//
//  LJOrderBaseDetailViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 28/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJOrderBaseDetailViewController.h"    //订单详情页面基本类
#import "LJOrderBaseDetailStatusTableViewCell.h"
#import "LJCommitOrderAddressTableViewCell.h"
#import "LJCommitOrderGoodsDetailTableViewCell.h"//商品cell

@interface LJOrderBaseDetailViewController ()
/*** 商品总价格 ***/
@property (nonatomic,strong) UILabel *goodsPrice;
/*** 运费价格 ***/
@property (nonatomic,strong) UILabel *postPrice;
/*** 实际付款金额 ***/
@property (nonatomic,strong) UILabel *payLabel;
/*** 返回积分 ***/
@property (nonatomic,strong) UILabel *integraLabel;
/*** 订单编号 ***/
@property (nonatomic,strong) UILabel *orderNumLabel;
/*** 创建时间 ***/
@property (nonatomic,strong)  UILabel *orderCreateTimeLabel;
/*** 付款时间 ***/
@property (nonatomic,strong) UILabel *payTimeLael;
/*** 发货时间 ***/
@property (nonatomic,strong) UILabel *deliverTimeLabel;
/*** 底部标签 ***/
@property (nonatomic,strong) UIView *bottomView;
@end

@implementation LJOrderBaseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单详情";
    self.tableView.lj_y = 64;
    self.tableView.lj_height = SCREEN_HEIGHT - 64;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO; //设置所有的cell点击无效果
    
    /*** 后期可能再加物流跟踪  先放这 ***/
//    [self.tableView registerClass:[LJOrderBaseDetailStatusTableViewCell class] forCellReuseIdentifier:@"LJOrderBaseDetailStatusTableViewCell"];
    
    [self.tableView registerClass:[LJCommitOrderAddressTableViewCell class] forCellReuseIdentifier:@"LJCommitOrderAddressTableViewCell"];
    [self.tableView registerClass:[LJCommitOrderGoodsDetailTableViewCell class] forCellReuseIdentifier:@"LJCommitOrderGoodsDetailTableViewCell"];
    [self setHeader];//
    
    //测试数据
    NSArray *arr = [NSMutableArray arrayWithObjects:@{@"orderNum":@"AF334FAU564",@"orderStatus":@"1",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]}, nil];
    
    self.dataArray = [LJCommitOrderCarMOder mj_objectArrayWithKeyValuesArray:arr];
    [self.tableView reloadData];
    
    [self setHeader];
    [self setFoot];
    [self addBottom];
}

#pragma mark --底部标签
- (void)addBottom {
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44, SCREEN_WIDTH, 44)];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    self.bottomView = bottomView;
    UIView *cutLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    cutLine.backgroundColor = LJCutLineColor;
    [self.bottomView addSubview:cutLine];
    
//    [self addBtnWithX:64 Width:44 title:@"退款"];//@"退货"按钮
    
//    [self addBtnWithX:64 Width:44 title:@"付款"];//@"付款"按钮
//    [self addBtnWithX:155 Width:81 title:@"取消订单"];//@"取消订单"按钮
    
//    [self addBtnWithX:101 Width:81 title:@"确认收货"];//@"确认收货"按钮
    
    [self addBtnWithX:64 Width:44 title:@"评价"];//@"评价"按钮
    [self addBtnWithX:155 Width:81 title:@"申请售后"];//@"申请售后"按钮
}

#pragma mark --设置头部
- (void)setHeader {
    UIImageView *header = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, spaceEdgeH(120))];
    header.image = [UIImage imageNamed:@"shopping_order_beijing"];
    self.tableView.tableHeaderView = header;
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(40), 0, SCREEN_WIDTH / 2, spaceEdgeH(20))];
    tipLabel.lj_centerY = header.lj_height / 2;
    tipLabel.textColor = [UIColor whiteColor];
    [header addSubview:tipLabel];
    tipLabel.text = @"等待买家付款";
    tipLabel.text = @"等待卖家发货";
    tipLabel.text = @"卖家已发货";
    tipLabel.text = @"交易完成";
}

#pragma mark --tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        LJCommitOrderCarMOder *model = self.dataArray[0];
        return model.cellHeight;
    }
    return spaceEdgeH(93);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0){
        LJCommitOrderAddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJCommitOrderAddressTableViewCell"];
        cell.isAccess = NO;
        return cell;
    }
    LJCommitOrderGoodsDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJCommitOrderGoodsDetailTableViewCell"];
    LJCommitOrderCarMOder *model = self.dataArray[0];
    cell.orderDataModel = model;
    __weak LJOrderBaseDetailViewController *weakSelf = self;
    cell.dropblock = ^ (NSInteger row){
        [weakSelf.tableView reloadData];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark --添加几个主要按钮
- (void)addBtnWithX:(CGFloat)x Width:(CGFloat)w title:(NSString *)title {
    UIButton *Btn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(x), 0, spaceEdgeW(w), spaceEdgeH(27))];
    Btn.lj_centerY = self.bottomView.lj_height / 2;
    [Btn setTitle:title forState:UIControlStateNormal];
    if ([title isEqualToString:@"取消订单"] ||[title isEqualToString:@"申请售后"]) {
        [Btn setTitleColor:LJFontColor88 forState:UIControlStateNormal];
        Btn.layer.borderColor = LJFontColor88.CGColor;
    }else{
        [Btn setTitleColor:LJFontColored forState:UIControlStateNormal];
        Btn.layer.borderColor = LJFontColored.CGColor;
    }
    [Btn.titleLabel setFont:LJFontSize16];
    Btn.layer.borderWidth = 1;
    [Btn setLayerWithCr:3];
    [Btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:Btn];
}

- (void)BtnClick:(UIButton *)sender {
    LJLogFunc
}

#pragma mark --设置尾部
- (void)setFoot {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, spaceEdgeH(250))];
    bgView.backgroundColor = LJCommonBgColor;
    self.tableView.tableFooterView = bgView;
    
    //背景1：价格背景
    UIView *priceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, spaceEdgeH(50))];
    priceView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:priceView];
    UILabel *goodsPrice = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), spaceEdgeH(10), spaceEdgeW(60), spaceEdgeH(12))];
    [goodsPrice setFont:LJFontSize12];
    [goodsPrice setTextColor:LJFontColor88];
    goodsPrice.text = @"商品总价";
    [priceView addSubview:goodsPrice];
    
    UILabel *postPrice = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10),goodsPrice.lj_bottom + spaceEdgeH(10), spaceEdgeW(60), spaceEdgeH(12))];
    [postPrice setFont:LJFontSize12];
    [postPrice setTextColor:LJFontColor88];
    postPrice.text = @"运费(快递)";
    [priceView addSubview:postPrice];
    
    self.goodsPrice = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(150), spaceEdgeH(10), spaceEdgeW(138), spaceEdgeH(12))];
    [self.goodsPrice setFont:LJFontSize12];
    [self.goodsPrice setTextColor:LJFontColor88];
    self.goodsPrice.text = @"￥2323.83";
    self.goodsPrice.textAlignment = NSTextAlignmentRight;
    [priceView addSubview:self.goodsPrice];
    
    self.postPrice = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(150),self.goodsPrice.lj_bottom + spaceEdgeH(10), spaceEdgeW(138), spaceEdgeH(12))];
    [self.postPrice setFont:LJFontSize12];
    [self.postPrice setTextColor:LJFontColor88];
    self.postPrice.text = @"￥0.00";
    self.postPrice.textAlignment = NSTextAlignmentRight;
    [priceView addSubview:self.postPrice];
   
    //背景2：实付金额背景
    UIView *acount = [[UIView alloc] initWithFrame:CGRectMake(0, priceView.lj_bottom + spaceEdgeH(4), SCREEN_WIDTH, spaceEdgeH(46))];
    acount.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:acount];
    
    UILabel *pay = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), 0, spaceEdgeW(100), spaceEdgeH(16))];
    pay.lj_centerY = acount.lj_height / 2;
    [pay setTextColor:LJFontColor26];
    [pay setFont:LJFontSize15];
    pay.text = @"实际付款";
    [acount addSubview:pay];
    
    self.payLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(180), spaceEdgeH(5), spaceEdgeW(168), spaceEdgeH(17))];
    [self.payLabel setTextColor:LJFontColored];
    [self.payLabel setFont:LJFontSize16];
    self.payLabel.textAlignment = NSTextAlignmentRight;
    self.payLabel.text = @"￥234.33";
    [acount addSubview:self.payLabel];
    
    self.integraLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(180), self.payLabel.lj_bottom + spaceEdgeH(5), spaceEdgeW(168), spaceEdgeH(17))];
    [self.integraLabel setTextColor:LJColorFromRGB(0xf36681)];
    [self.integraLabel setFont:LJFontSize12];
    self.integraLabel.textAlignment = NSTextAlignmentRight;
    self.integraLabel.text = @"返回积分:234.33";
    [acount addSubview:self.integraLabel];
    
    //背景3：有关订单信息
    UIView *order = [[UIView alloc] initWithFrame:CGRectMake(0, acount.lj_bottom + spaceEdgeH(4), SCREEN_WIDTH, spaceEdgeH(85))];
    order.backgroundColor = [UIColor whiteColor ];
    [bgView addSubview:order];
    
    self.orderNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), spaceEdgeH(9), SCREEN_WIDTH - spaceEdgeW(10), spaceEdgeH(12))];
    [self.orderNumLabel setTextColor:LJFontColor88];
    [self.orderNumLabel setFont:LJFontSize12];
    self.orderNumLabel.textAlignment = NSTextAlignmentLeft;
    self.orderNumLabel.text = @"订单编号:DEAF23DFKDAAFLD";
    [order addSubview:self.orderNumLabel];
    
    self.orderCreateTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.orderNumLabel.lj_bottom + spaceEdgeH(7), SCREEN_WIDTH - spaceEdgeW(10), spaceEdgeH(12))];
    [self.orderCreateTimeLabel setTextColor:LJFontColor88];
    [self.orderCreateTimeLabel setFont:LJFontSize12];
    self.orderCreateTimeLabel.textAlignment = NSTextAlignmentLeft;
    self.orderCreateTimeLabel.text = @"创建时间:2017-2-28 19:23:08";
    [order addSubview:self.orderCreateTimeLabel];
    
    self.payTimeLael = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.orderCreateTimeLabel.lj_bottom + spaceEdgeH(7), SCREEN_WIDTH - spaceEdgeW(10), spaceEdgeH(12))];
    [self.payTimeLael setTextColor:LJFontColor88];
    [self.payTimeLael setFont:LJFontSize12];
    self.payTimeLael.textAlignment = NSTextAlignmentLeft;
    self.payTimeLael.text = @"付款时间:2017-2-28 19:23:08";
    [order addSubview:self.payTimeLael];
    
    self.deliverTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.payTimeLael.lj_bottom + spaceEdgeH(7), SCREEN_WIDTH - spaceEdgeW(10), spaceEdgeH(12))];
    [self.deliverTimeLabel setTextColor:LJFontColor88];
    [self.deliverTimeLabel setFont:LJFontSize12];
    self.deliverTimeLabel.textAlignment = NSTextAlignmentLeft;
    self.deliverTimeLabel.text = @"发货时间:2017-2-28 19:23:08";
    [order addSubview:self.deliverTimeLabel]; 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
