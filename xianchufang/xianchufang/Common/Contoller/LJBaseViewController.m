//
//  LJBaseViewController.m
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJBaseViewController.h"

@interface LJBaseViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation LJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LJCommonBgColor;
    self.automaticallyAdjustsScrollViewInsets = NO;  //去留白
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.backgroundColor = LJCommonBgColor;
    self.tableView.allowsMultipleSelection = YES; //允许多选
    
}

#pragma mark --数据获取
- (void)loadData {
    
}

#pragma mark --代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld行",indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
