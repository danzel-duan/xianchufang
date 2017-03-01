//
//  LJPaymentSuccessViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 01/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
////    支付成功界面 （1.付款成功 2.确认收货成功）

#import "LJPaymentSuccessViewController.h"

@interface LJPaymentSuccessViewController ()



/**
 提示信息
 */
@property (nonatomic,strong) UILabel *tipLabel;
/*** 第二个背景 ***/
@property (nonatomic,strong) UIView *bga2;
@end

@implementation LJPaymentSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"付款成功";
    self.view.backgroundColor = LJCommonBgColor;
}


#pragma mark --子控件 
- (void)addChildren {
    UIImageView *header = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, spaceEdgeH(120))];
    header.image = [UIImage imageNamed:@"shopping_order_beijing"];
    [self.view addSubview:header];
    UILabel *tipL = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(15), 0, SCREEN_WIDTH / 2, spaceEdgeH(20))];
    tipL.lj_centerY = header.lj_height / 2;
    tipL.textColor = [UIColor whiteColor];
    [header addSubview:tipL];
    tipL.text = @"交易完成，货款已到账";
    
    UIView *bg1 = [[UIView alloc] initWithFrame:CGRectMake(0, header.lj_bottom + spaceEdgeH(10), SCREEN_WIDTH, spaceEdgeH(40))];
    bg1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bg1];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickTap:)];
    bg1.userInteractionEnabled = YES;
    [bg1 addGestureRecognizer:tap];
    self.tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), 0, SCREEN_WIDTH / 2, spaceEdgeH(40))];
    [self.tipLabel setFont:LJFontSize15];
    [self.tipLabel setTextColor:LJFontColor4c];
    [bg1 addSubview:self.tipLabel];
    
    UIImageView *imgaeView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(20), spaceEdgeH(10), 0, 0)];
    imgaeView.image = [UIImage imageNamed:@"my_go_icon"];
    [imgaeView sizeToFit];
    [bg1 addSubview:imgaeView];
    
    self.bga2= [[UIView alloc] initWithFrame:CGRectMake(0, bg1.lj_bottom + spaceEdgeH(2), SCREEN_WIDTH, spaceEdgeH(40))];
    self.bga2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bga2];
    
    UIButton *Btn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(100), 0, spaceEdgeW(75), spaceEdgeH(27))];
    Btn.lj_centerY = self.bga2.lj_height / 2;
    [Btn setTitle:@"立即评价" forState:UIControlStateNormal];
    [Btn setTitleColor:LJFontColored forState:UIControlStateNormal];
    Btn.layer.borderColor = LJFontColored.CGColor;
    [Btn.titleLabel setFont:LJFontSize16];
    Btn.layer.borderWidth = 1;
    [Btn setLayerWithCr:3];
    [Btn addTarget:self action:@selector(ClickCommit:) forControlEvents:UIControlEventTouchUpInside];
    [self.bga2 addSubview:Btn];
}

- (void)setIsSuccess:(BOOL)isSuccess {
    _isSuccess = isSuccess;
    [self addChildren];//
    if (_isSuccess == NO) {
        [self.bga2 removeFromSuperview];
        self.tipLabel.text = @"查看订单";
    }else{
        self.tipLabel.text = [NSString stringWithFormat:@"本次交易获得%@积分",self.integral];
    }
}

#pragma mark --点击查看已付款订单或积分详情
- (void)ClickTap:(UITapGestureRecognizer *)tapGesture {
    if (self.isSuccess) {
        ///交易完成，进入积分明细页面
    }else{
        //付款成功，进入待发货页面
        LJLogFunc
    }
}

#pragma mark --点击查看待评价订单
- (void)ClickCommit:(UIButton *)sender {
    LJLogFunc
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
