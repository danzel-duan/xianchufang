//
//  LJClassifyViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 13/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJClassifyViewController.h"

@interface LJClassifyViewController ()

@end

@implementation LJClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIViewController *vc = [NSClassFromString(@"LJGoodsDetailFatherViewController") new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
