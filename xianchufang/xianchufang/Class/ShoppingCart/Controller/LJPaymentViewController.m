//
//  LJViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 16/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJPaymentViewController.h"

@interface LJPaymentViewController ()

@end

@implementation LJPaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"支付方式";
    self.view.backgroundColor = LJCommonBgColor;
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 74, SCREEN_WIDTH, spaceEdgeH(50))];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    //订单号
    self.orderNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), 0, 0, 0)];
    self.orderNumLabel.textColor = LJFontColor39;
    self.orderNumLabel.font = LJFontSize18;
    self.orderNumLabel.text = @"订单号:233925398475937";
    [self.orderNumLabel sizeToFit];
    self.orderNumLabel.lj_centerY = bgView.lj_height / 2;
    [bgView addSubview:self.orderNumLabel];
    
    //金额
    self.amountLabel = [[UILabel alloc] init];
    self.amountLabel.textColor = LJFontColored;
    self.amountLabel.font = LJFontSize18;
    self.amountLabel.text = @"￥8475.937";
    [self.amountLabel sizeToFit];
    self.amountLabel.lj_x = SCREEN_WIDTH - self.amountLabel.lj_width - 10;
    self.amountLabel.lj_centerY = bgView.lj_height / 2;
    [bgView addSubview:self.amountLabel];
    
    //提示信息
    UILabel *tip = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), bgView.lj_bottom + spaceEdgeH(8), 0, 0)];
    tip.text = @"请您尽快支付,以便订单尽快处理";
    tip.textColor = LJFontColor88;
    tip.font = LJFontSize12;
    [tip sizeToFit];
    [self.view addSubview:tip];
    
    //支付方式提示选择
    UILabel *payment = [[UILabel alloc] init];
    payment.text = @"选择支付方式";
    payment.textColor = LJFontColor39;
    payment.font = LJFontSize16;
    [payment sizeToFit];
    payment.lj_centerX = SCREEN_WIDTH / 2;
    payment.lj_y = tip.lj_bottom + spaceEdgeH(15);
    [self.view addSubview:payment];
    
    CGFloat y = payment.lj_bottom + spaceEdgeH(40);
    CGFloat x = spaceEdgeW(52);
    CGFloat w = spaceEdgeW(80);
    CGFloat h = spaceEdgeH(102);
    NSArray *imageArray = @[@"me_zhifubaopay_icon",@"me_yuepay_icon",@"me_weixinpay_cion"];
    //三种支付方式
    for (int i = 0; i < 3; i++) {
        UIButton *view = [[UIButton alloc] initWithFrame:CGRectMake(x + i * w + i * 15, y, w, h)];
        [view setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [view setBgShadow];
        [view setLayerWithCr:5];
        view.tag = i;
        [view addTarget:self action:@selector(ClickPayment:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:view];
    }
}

- (void)ClickPayment:(UIButton *)sender {
    if (sender.tag == 0) {
        LJLog(@"支付宝");
    }else if (sender.tag == 1){
        LJLog(@"账户余额");
    }else if (sender.tag == 2){
       LJLog(@"微信");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
