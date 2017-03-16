//
//  LJSearchDetailView.m
//  xianchufang
//
//  Created by zhenglong duan on 16/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJSearchDetailView.h"
#import "LJGoodsDetailFatherViewController.h"

@interface LJSearchDetailView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableview;

@end

@implementation LJSearchDetailView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = LJCommonBgColor;
        [self addSubview:self.tableview];
    }
    return self;
}

- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableview.backgroundColor = LJCommonBgColor;
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITabBarController *tabBarVc = (UITabBarController *)self.window.rootViewController;
    UINavigationController *nav = tabBarVc.selectedViewController;
    LJGoodsDetailFatherViewController *Vc = [[LJGoodsDetailFatherViewController alloc] init];
    [nav pushViewController:Vc animated:YES];
    
    [self.superview removeFromSuperview];
    
}

@end
