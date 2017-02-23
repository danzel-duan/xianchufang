//
//  LJReceiveOrderViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 21/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJReceiveOrderViewController.h"

@interface LJReceiveOrderViewController ()

@end

@implementation LJReceiveOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"待收货";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (OrderStatus)orderStatus {
    return OrderStatus3;
}

@end
