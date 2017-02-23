//
//  LJBalanceViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 22/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJBalanceViewController.h"

@interface LJBalanceViewController ()

/*** 余额 ***/
@property (nonatomic,strong) UILabel *banlaceLabel;

@property (nonatomic,strong) NSString *balance; //
@end

@implementation LJBalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"余额查询";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationEdit];
    [self addBgView];
}

#pragma mark --添加背景30c246 3ce5bf
- (void)addBgView {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, spaceEdgeH(290))];
    [self.view addSubview:bgView];
    
    /*** 绘制渐变 ***/
    CAGradientLayer *layer = [CAGradientLayer new];
    layer.colors = @[(__bridge id)LJColorFromRGB(0x3de4be).CGColor,(__bridge id)LJColorFromRGB(0x40dd75).CGColor];
    /*** 起终点 ***/
    layer.startPoint = CGPointMake(SCREEN_WIDTH / 2, 0);
    layer.endPoint = CGPointMake(SCREEN_WIDTH / 2, 1);
    layer.frame = bgView.frame;
    [self.view.layer addSublayer:layer];
    
    UILabel *balanceL = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(34), spaceEdgeH(134), 0, 30)];
    balanceL.text = @"账户余额:";
    [balanceL setFont:LJFontSize18];
    [balanceL sizeToFit];
    [balanceL setTextColor:[UIColor whiteColor]];
    [self.view addSubview:balanceL];
    
    self.balance = @"232678.02";
    
    NSString *balanceStr = [NSString stringWithFormat:@"%@元",self.balance];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:balanceStr];
    [attribute addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:60],NSForegroundColorAttributeName:[UIColor whiteColor]} range:NSMakeRange(0, self.balance.length)];
    [attribute addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]} range:NSMakeRange(self.balance.length, 1)];
    self.banlaceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, spaceEdgeH(160), SCREEN_WIDTH, 90)];
    self.banlaceLabel.lj_centerX = SCREEN_WIDTH / 2;
    self.banlaceLabel.textAlignment = NSTextAlignmentCenter;
    self.banlaceLabel.attributedText = attribute;
    [self.view addSubview:self.banlaceLabel];
    
    //充值按钮
    UIButton *rechargeBtn = [[UIButton alloc] initWithFrame:CGRectMake(spaceEdgeW(65), spaceEdgeH(274), spaceEdgeW(245), 40)];
    [rechargeBtn setTitle:@"充值" forState:UIControlStateNormal];
    [rechargeBtn.titleLabel setTextColor:[UIColor whiteColor]];
    [rechargeBtn.titleLabel setFont:LJFontSize18];
    [rechargeBtn setLayerWithCr:20];
    rechargeBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    rechargeBtn.layer.borderWidth = 0.5;
    [rechargeBtn addTarget:self action:@selector(rechargeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rechargeBtn];
    
}

#pragma mark --导航栏编辑
- (void)setNavigationEdit {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithText:@"明细" hightext:nil color:LJColorFromRGB(0x393939)
                                                                 highColor:nil target:self action:@selector(NavigationClick:)];
}

#pragma mark --x编辑事件
- (void)NavigationClick:(UIButton *)sender {
  LJLogFunc
}

#pragma mark --充值
- (void)rechargeBtnClick:(UIButton *)sender {
    LJLogFunc
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
