//
//  LJEvaluateOrderViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 21/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJEvaluateOrderViewController.h"

@interface LJEvaluateOrderViewController ()

@end

@implementation LJEvaluateOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"待评价";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (OrderStatus)orderStatus {
    return OrderStatus4;
}

@end
