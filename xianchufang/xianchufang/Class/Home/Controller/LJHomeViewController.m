//
//  LJHomeViewController.m
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJHomeViewController.h"

@interface LJHomeViewController ()

@end

@implementation LJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
    
}

#pragma mark--设置导航控制器
- (void)setUpNav {
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithText:@"定位" color:nil highColor:nil target:self action:@selector(LeftBarButtonClick)];
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithText:@"搜索" color:[UIColor redColor]  highColor:[UIColor blueColor] target:self action:@selector(RightBarButtonClick)];
}

#pragma mark--leftBarButtonClick
- (void)LeftBarButtonClick {
    LJLogFunc
}

#pragma mark--rightBarButtonClick
- (void)RightBarButtonClick {
    LJLogFunc
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
