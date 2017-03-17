//
//  LJGoodsCommentViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 02/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJGoodsCommentViewController.h"
#import "LJGoodsCommentTableViewCell.h"
@interface LJGoodsCommentViewController ()

@end

@implementation LJGoodsCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 1)];
    line.backgroundColor = LJCutLineColor;
    [self.view addSubview:line];
    
    self.view.backgroundColor = LJCommonBgColor;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
    self.tableView.lj_y = 65;
    self.tableView.lj_height = self.view.lj_height - spaceEdgeH(49) - 65;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LJGoodsCommentTableViewCell class] forCellReuseIdentifier:@"LJGoodsCommentTableViewCell"]; //2.注册cell
    
}

#pragma mark --tableView代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return spaceEdgeH(180);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJGoodsCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJGoodsCommentTableViewCell"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
