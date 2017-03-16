//
//  LJSearchDetailView.m
//  xianchufang
//
//  Created by zhenglong duan on 16/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJSearchDetailView.h"
#import "LJGoodsDetailFatherViewController.h"
#import "LJSearchDetailTableViewCell.h"

@interface LJSearchDetailView ()<UITableViewDelegate,UITableViewDataSource,LJGoodsDetailFatherViewControllerDelegate>

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
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableview registerClass:[LJSearchDetailTableViewCell class] forCellReuseIdentifier:@"LJSearchDetailTableViewCell"];
    }
    return _tableview;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return spaceEdgeH(120);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJSearchDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJSearchDetailTableViewCell"];
    cell.isFull = YES;
    cell.isLimit = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITabBarController *tabBarVc = (UITabBarController *)self.window.rootViewController;
    UINavigationController *nav = tabBarVc.selectedViewController;
    LJGoodsDetailFatherViewController *Vc = [[LJGoodsDetailFatherViewController alloc] init];
    Vc.delegate = self;
    [nav pushViewController:Vc animated:YES];
    self.superview.hidden = YES;
}

#pragma mark --LJGoodsDetailFatherViewController 代理
- (void)showSearchView {
   self.superview.hidden = NO;
}

@end
