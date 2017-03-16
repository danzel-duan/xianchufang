//
//  LJCommitOrderViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 28/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//   提交订单详情

#import "LJCommitOrderViewController.h"
#import "LJCommitOrderAddressTableViewCell.h"//地址cell
#import "LJCommitOrderGoodsDetailTableViewCell.h"//商品cell
#import "LJPaymentViewController.h" //选择支付界面

@interface LJCommitOrderViewController ()
/*** 实付款金额 ***/
@property (nonatomic,strong) UILabel *payLabel;
/*** 积分 ***/
@property (nonatomic,strong) UILabel *integralLabel;
/*** 最下面显示地址的标签 ***/
@property (nonatomic,strong) UILabel *addressLabel;
/*** 显示地址的背景 ***/
@property (nonatomic,strong) UIView *backBg;
@property (nonatomic,assign) CGFloat contentOffsetY;//偏移量
@end

@implementation LJCommitOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单详情";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 108) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    //注册cell
    [self.tableView registerClass:[LJCommitOrderAddressTableViewCell class] forCellReuseIdentifier:@"LJCommitOrderAddressTableViewCell"];
    [self.tableView registerClass:[LJCommitOrderGoodsDetailTableViewCell class] forCellReuseIdentifier:@"LJCommitOrderGoodsDetailTableViewCell"];
    
    [self addBottomSettlementTabBar];
    
    //测试数据
    NSArray *arr = [NSMutableArray arrayWithObjects:@{@"orderNum":@"AF334FAU564",@"orderStatus":@"1",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]}, nil];
    
    self.dataArray = [LJCommitOrderCarMOder mj_objectArrayWithKeyValuesArray:arr];
    [self.tableView reloadData];
}

#pragma mark --tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 3;
    }else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return spaceEdgeH(93);
        }else if (indexPath.row == 1){
            LJCommitOrderCarMOder *model = self.dataArray[0];
            return model.cellHeight;
        }
    }else if (indexPath.section == 1){
        return spaceEdgeH(50);
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            LJCommitOrderAddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJCommitOrderAddressTableViewCell"];
            return cell;
        }else if (indexPath.row == 1){
            LJCommitOrderGoodsDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJCommitOrderGoodsDetailTableViewCell"];
            LJCommitOrderCarMOder *model = self.dataArray[0];
            cell.orderDataModel = model;
            __weak LJCommitOrderViewController *weakSelf = self;
            cell.dropblock = ^ (NSInteger row){
                [weakSelf.tableView reloadData];
            };
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }else {
        static NSString* cellId = @"cellId";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        }
        [cell.textLabel setFont:LJFontSize16];
        [cell.textLabel setTextColor:LJFontColor39];
        [cell.detailTextLabel setFont:LJFontSize14];
        //分割线
        UIView *cutLine = [[UIView alloc] initWithFrame:CGRectMake(0, cell.lj_bottom, SCREEN_WIDTH, 0.5)];
        cutLine.backgroundColor = LJCutLineColor;
        [cell addSubview:cutLine];
        if (indexPath.section == 1) {  //第二个section
            if (indexPath.row == 0) {
                cell.textLabel.text = @"运险费";
            }else if (indexPath.row == 1){
                cell.textLabel.text = @"配送时间";
                cell.detailTextLabel.text = @"点击查看";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }else if (indexPath.row == 2){
                cell.textLabel.text = @"开具发票";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
        }else{
            cell.textLabel.text = @"拥有2000积分可抵2元";
        }
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            UIViewController * Vc =[NSClassFromString(@"LJAddressSetViewController") new];
            [self.navigationController pushViewController:Vc animated:YES];
        }
    }else if (indexPath.section == 1){
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        if (indexPath.row == 0) {     //运费险
            
        }else if (indexPath.row == 1){  //配送时间
          
        }else if (indexPath.row == 2){  //开具发票
            
        }
    }else {  //积分
      [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

#pragma mark -- 添加底部结算标签
- (void)addBottomSettlementTabBar {
    //////地址显示标签
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44 - spaceEdgeH(40), SCREEN_WIDTH, spaceEdgeH(40))];
    backView.backgroundColor = LJFontColor39;
    backView.alpha = 0;
    [self.view addSubview:backView];
    self.backBg = backView;
    
    UILabel* address = [[UILabel alloc] initWithFrame:CGRectMake(11, 0, spaceEdgeW(60), 20)];
    address.lj_centerY = backView.lj_height / 2;
    [address setTextColor:LJCutLineColor];
    [address setFont:LJFontSize14];
    address.text = @"配送至:";
    [backView addSubview:address];
    
    self.addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(address.lj_right, 0, backView.lj_width - spaceEdgeW(70), 20)];
    self.addressLabel.lj_centerY = backView.lj_height / 2;
    [self.addressLabel setTextColor:LJCutLineColor];
    [self.addressLabel setFont:LJFontSize14];
    self.addressLabel.text = @"上海市宝山区罗泾镇陈川新村180";
    [backView addSubview:self.addressLabel];
    ////////////////
    ////////
    /////最下边的提交标签
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44, SCREEN_WIDTH, 44)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UIButton *settlement = [[UIButton alloc] initWithFrame:CGRectMake(view.lj_width - 94, 0, 94, 44)];
    settlement.backgroundColor = LJFontColored;
    [settlement setTitle:@"提交订单" forState:UIControlStateNormal];
    [settlement setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
    [settlement.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [settlement addTarget:self action:@selector(Settlement:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:settlement];
    
    self.payLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, view.lj_width - spaceEdgeW(134), spaceEdgeH(20))];
    self.payLabel.textAlignment = NSTextAlignmentRight;
    [view addSubview:self.payLabel];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:@"实付款:￥895"];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor26,NSFontAttributeName:LJFontSize16} range:NSMakeRange(0, 5)];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColored,NSFontAttributeName:LJFontSize16} range:NSMakeRange(5, 3)];
    self.payLabel.attributedText = attribute;
    
    self.integralLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.payLabel.lj_bottom + spaceEdgeH(5), SCREEN_WIDTH - spaceEdgeW(155), spaceEdgeH(10))];
    [self.integralLabel setTextAlignment:NSTextAlignmentRight];
    [view addSubview:self.integralLabel];
    NSMutableAttributedString *attribute1 = [[NSMutableAttributedString alloc] initWithString:@"积分:85"];
    [attribute1 addAttributes:@{NSForegroundColorAttributeName:LJFontColor26,NSFontAttributeName:LJFontSize12} range:NSMakeRange(0, 3)];
    [attribute1 addAttributes:@{NSForegroundColorAttributeName:LJFontColored,NSFontAttributeName:LJFontSize12} range:NSMakeRange(3, 2)];
    self.integralLabel.attributedText = attribute1;
}

#pragma mark --提交订单点击事件
- (void)Settlement :(UIButton *)sender {
    LJPaymentViewController *paymentView = [[LJPaymentViewController alloc] init];
    [self.navigationController pushViewController:paymentView animated:YES];
}

#pragma mark-拖拽判断
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {  //手动拖拽
    _contentOffsetY = scrollView.contentOffset.y;
}
/**
 *  手指离开屏幕后
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.dragging) { // 拖拽
        if ((scrollView.contentOffset.y - _contentOffsetY) > 93.0f) {  // 向上拖拽
            self.backBg.alpha = 1; /////地址背景出现
            self.tableView.lj_height = SCREEN_HEIGHT - 108 - spaceEdgeH(40);
        }
        else if ((_contentOffsetY - scrollView.contentOffset.y) > 93.0f)
        {   // 向下拖拽
            self.backBg.alpha = 0;
            self.tableView.lj_height = SCREEN_HEIGHT - 108;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
