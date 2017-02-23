//
//  LJReturnGoodsOrderViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 21/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJReturnGoodsOrderViewController.h"

@interface LJReturnGoodsOrderViewController ()

@end

@implementation LJReturnGoodsOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"退换货";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (OrderStatus)orderStatus {
    return OrderStatus3;
}

@end
