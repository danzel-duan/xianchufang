//
//  LJFoodCircleViewController.m
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJShoppingCartViewController.h"
#import "LJShoppingCarTableViewCell.h"
@interface LJShoppingCartViewController ()

@end

@implementation LJShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;  //去留白
    self.navigationItem.title = @"购物车";
    self.tableView.lj_y = 12;
    self.tableView.lj_height = SCREEN_HEIGHT - 56;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    //注册cell
    [self.tableView registerClass:[LJShoppingCarTableViewCell class] forCellReuseIdentifier:@"LJShoppingCarTableViewCell"];
    
    [self setNavigationEdit];
    [self addBottomSettlementTabBar];
    [self loadData];
}

/*** 加载数据 ***/
- (void)loadData {
    NSArray *data = @[@{@"postAge":@"满399免运费",@"isPost":@"yes",@"goodsImageViewName":@"",@"brief":@"大青皮 该品种耐寒性特强，高抗病，茎棒粗大且顺直",@"price":@"200",@"goodsNum":@"340"},@{@"postAge":@"满399免运费",@"isPost":@"no",@"goodsImageViewName":@"",@"brief":@"大青皮 该品种耐寒性特强，高抗病，茎棒粗大且顺直",@"price":@"200",@"goodsNum":@"340"},@{@"postAge":@"满399免运费",@"isPost":@"no",@"goodsImageViewName":@"",@"brief":@"大青皮 该品种耐寒性特强，高抗病，茎棒粗大且顺直",@"price":@"200",@"goodsNum":@"340"},@{@"postAge":@"满399免运费",@"isPost":@"yes",@"goodsImageViewName":@"",@"brief":@"大青皮 该品种耐寒性特强，高抗病，茎棒粗大且顺直",@"price":@"200",@"goodsNum":@"340"},@{@"postAge":@"满399免运费",@"isPost":@"no",@"goodsImageViewName":@"",@"brief":@"大青皮 该品种耐寒性特强，高抗病，茎棒粗大且顺直",@"price":@"200",@"goodsNum":@"340"},@{@"postAge":@"满399免运费",@"isPost":@"yes",@"goodsImageViewName":@"",@"brief":@"大青皮 该品种耐寒性特强，高抗病，茎棒粗大且顺直",@"price":@"200",@"goodsNum":@"340"}];
    self.dataArray = [LJShoppingCarModel mj_objectArrayWithKeyValuesArray:data];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJShoppingCarModel *shoppingCarModel = self.dataArray[indexPath.row];
    return shoppingCarModel.cellHegiht;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJShoppingCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJShoppingCarTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.shoppingCarMOdel = self.dataArray [indexPath.row];
    return cell;
}

#pragma mark --导航栏编辑
- (void)setNavigationEdit {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithText:@"编辑" hightext:@"完成" color:LJColorFromRGB(0x393939)
                                                                 highColor:nil target:self action:@selector(NavigationClick:)];
}

#pragma mark --x编辑事件
- (void)NavigationClick:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
        [self.settlementBtn setTitle:@"去结算(0)" forState:UIControlStateNormal];
        [self.bottomViewBg addSubview:self.view1];
    }else{
        sender.selected = YES;
        [self.settlementBtn setTitle:@"删除" forState:UIControlStateNormal];
        [self.view1 removeFromSuperview];
    }
}

#pragma mark -- 添加底部结算标签
- (void)addBottomSettlementTabBar {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 93, SCREEN_WIDTH, 44)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    self.bottomViewBg = view;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, view.lj_height)];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:@"全选" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:LJFontColor forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"my_circle_icon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"my_duihao_icon_selected"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -10)];
    
    UIButton *settlement = [[UIButton alloc] initWithFrame:CGRectMake(view.lj_width - 94, 0, 94, 44)];
    settlement.backgroundColor = [UIColor redColor];
    [settlement setTitle:@"去结算(0)" forState:UIControlStateNormal];
    [settlement setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
    [settlement.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [settlement addTarget:self action:@selector(Settlement:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:settlement];
    self.settlementBtn = settlement;
    
    /*** 合计一系列 ***/
    UIView *view1 =[[ UIView alloc] initWithFrame:CGRectMake(button.lj_right + 10, 0, settlement.lj_x - button.lj_width -10, 44)];
    view1.backgroundColor = [UIColor whiteColor];
    [view addSubview:view1];
    self.view1 = view1;
    
    UILabel *L1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 40, 20)];
    L1.text = @"合计:";
    L1.backgroundColor = [UIColor whiteColor];
    [view1 addSubview:L1];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(L1.lj_right, 5, 0, 20)];
    self.priceLabel.text = @"￥40000.0";
    [self.priceLabel setFont:[UIFont systemFontOfSize:18]];
    [self.priceLabel setTextAlignment:NSTextAlignmentLeft];
    [self.priceLabel setTextColor:[UIColor redColor]];
    self.priceLabel.backgroundColor = [UIColor whiteColor];
    [self.priceLabel sizeToFit];
    [view1 addSubview:self.priceLabel];
    
    UILabel *L2 = [[UILabel alloc] initWithFrame:CGRectMake(0, L1.lj_bottom , 20, 10)];
    L2.text = @"不含运费";
    [L2 setFont:[UIFont systemFontOfSize:13]];
    L2.backgroundColor = [UIColor whiteColor];
    L2.textColor = LJFontColor;
    [L2 sizeToFit];
    [view1 addSubview:L2];
}

#pragma mark --buttonClick
- (void)buttonClick :(UIButton *)sender {
    if (sender.selected == NO) {
        sender.selected = YES;
    }else{
        sender.selected = NO;
    }
}

#pragma mark --结算按钮的点击事件
- (void)Settlement:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"删除"]) {
        LJLog(@"删除");
    }else{
        LJLog(@"结算");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
