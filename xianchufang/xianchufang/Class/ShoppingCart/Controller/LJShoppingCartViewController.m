//
//  LJFoodCircleViewController.m
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJShoppingCartViewController.h"

@interface LJShoppingCartViewController ()
/*** 结算按钮 ***/
@property (nonatomic,strong) UIButton *settlementBtn;
/*** 金额 ***/
@property (nonatomic,strong) UILabel *priceLabel;
@end

@implementation LJShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;  //去留白
    self.navigationItem.title = @"购物车";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self addBottomSettlementTabBar];
}


#pragma mark -- 添加底部结算标签
- (void)addBottomSettlementTabBar {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 93, SCREEN_WIDTH, 44)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, view.lj_height)];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:@"全选" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:LJFontColor forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"my_circle_icon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"my_duihao_icon"] forState:UIControlStateSelected];
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
    
    UILabel *L1 = [[UILabel alloc] initWithFrame:CGRectMake(button.lj_right + 10, 5, 40, 20)];
    L1.text = @"合计:";
    L1.backgroundColor = [UIColor whiteColor];
    [view addSubview:L1];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(L1.lj_right, 5, 0, 20)];
    self.priceLabel.text = @"￥40000.0";
    [self.priceLabel setFont:[UIFont systemFontOfSize:18]];
    [self.priceLabel setTextAlignment:NSTextAlignmentLeft];
    [self.priceLabel setTextColor:[UIColor redColor]];
    self.priceLabel.backgroundColor = [UIColor whiteColor];
    [self.priceLabel sizeToFit];
    [view addSubview:self.priceLabel];
    
    UILabel *L2 = [[UILabel alloc] initWithFrame:CGRectMake(button.lj_right + 10, L1.lj_bottom , 20, 10)];
    L2.text = @"不含运费";
    [L2 setFont:[UIFont systemFontOfSize:13]];
    L2.backgroundColor = [UIColor whiteColor];
    L2.textColor = LJFontColor;
    [L2 sizeToFit];
    [view addSubview:L2];
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
