//
//  LJDeliverOreViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 21/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//     待配送

#import "LJDeliverOreViewController.h"

@interface LJDeliverOreViewController ()

@end

@implementation LJDeliverOreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"待配送";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (OrderStatus)orderStatus {
    return OrderStatus2;
}
@end
