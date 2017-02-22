//
//  LJMyCollectDetailViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 22/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJMyCollectDetailViewController.h"

@interface LJMyCollectDetailViewController ()
/*** 底部标签 ***/
@property (nonatomic,strong) UIView *bottomView;
@end

@implementation LJMyCollectDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"收藏分类";
    [self addBottomSettlementTabBar];//
    [self setNavigationEdit]; ///
    self.tableView.lj_y = 14;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}





#pragma mark --导航栏编辑
- (void)setNavigationEdit {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithText:@"编辑" hightext:@"完成" color:LJColorFromRGB(0x393939)
                                                                 highColor:nil target:self action:@selector(NavigationClick:)];
}

#pragma mark --x编辑事件
- (void)NavigationClick:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
        [self.bottomView removeFromSuperview];
    }else{
        sender.selected = YES;
        [self.view addSubview:self.bottomView];
    }
}

#pragma mark -- 添加底部结算标签
- (void)addBottomSettlementTabBar {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44, SCREEN_WIDTH, 44)];
    view.backgroundColor = [UIColor whiteColor];
    self.bottomView = view;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 60, view.lj_height)];
    [button setTitle:@"全选" forState:UIControlStateNormal];
    [button.titleLabel setFont:LJFontSize15];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [button setTitleColor:LJFontColor88 forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"my_circle_icon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"my_duihao_icon_selected"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -10)];
    
    UIButton *settlement = [[UIButton alloc] initWithFrame:CGRectMake(view.lj_width - 94, 0, 94, 44)];
    settlement.backgroundColor = [UIColor redColor];
    [settlement setTitle:@"删除" forState:UIControlStateNormal];
    [settlement setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
    [settlement.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [settlement addTarget:self action:@selector(Settlement:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:settlement];
}

#pragma mark --全选
- (void)buttonClick:(UIButton *)sender {
    LJLogFunc
}

#pragma mark --删除
- (void)Settlement:(UIButton *)sender {
    LJLogFunc
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
