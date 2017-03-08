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
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark--设置导航控制器
- (void)setUpNav {

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
