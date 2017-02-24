//
//  LJInventoryViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 20/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJInventoryViewController.h"
#import "LJInventoryTableViewCell.h"
#import "LJTooltip.h"
@interface LJInventoryViewController ()
/*** 创建清单按钮 ***/
@property (nonatomic,strong) UIButton *creatBtn;
@property (nonatomic,strong) UIView *viewbg;
@property (nonatomic,strong) UIView *viewbg1;
@property (nonatomic,strong) UIButton *allBtn;
@property (nonatomic,strong) UIButton *delectBtn;
@end

@implementation LJInventoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;  //去留白
    self.navigationItem.title = @"采购清单";
    self.tableView.lj_y = 12;
    self.tableView.lj_height = SCREEN_HEIGHT - 56;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LJInventoryTableViewCell class] forCellReuseIdentifier:@"LJInventoryTableViewCell"];
 
    [self addBottomTabBar];
    
    //测试数据
    NSArray *arr = @[@{@"inventName":@"清单1",@"goodsNum":@"4",@"totalPrice":@"236.0",@"goodsDataArr":@[@{@"goodsName":@"大白菜"},@{@"goodsName":@"大白菜"},@{@"goodsName":@"大白菜"},@{@"goodsName":@"大白菜"}]},@{@"inventName":@"清单1",@"goodsNum":@"4",@"totalPrice":@"236.0",@"goodsDataArr":@[@{@"goodsName":@"大白菜"},@{@"goodsName":@"大白菜"},@{@"goodsName":@"大白菜"},@{@"goodsName":@"大白菜"}]},@{@"inventName":@"清单1",@"goodsNum":@"4",@"totalPrice":@"236.0",@"goodsDataArr":@[@{@"goodsName":@"大白菜"},@{@"goodsName":@"大白菜"},@{@"goodsName":@"大白菜"},@{@"goodsName":@"大白菜"}]}];
    self.dataArray = [LJInventoryModel mj_objectArrayWithKeyValuesArray:arr];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return spaceEdgeH(239);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJInventoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJInventoryTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    LJInventoryModel *model = self.dataArray[indexPath.row];
    cell.inventoryModel = model;      /////数据传值
    
    __weak LJInventoryViewController *weakSelf = self;
    cell.selectblock = ^{
        int num =0;
        for (LJInventoryModel *model in self.dataArray) {
            if (model.isSelected) num++;
        }
        if (num>0) {
            [weakSelf.view addSubview:weakSelf.viewbg];
            [weakSelf.viewbg1 removeFromSuperview];
        }else{
            weakSelf.allBtn.selected = NO;  //将全选按钮的状态设为未选中
            [weakSelf.view addSubview:weakSelf.viewbg1];  //添加创建清单按钮
            [weakSelf.viewbg removeFromSuperview];
        }
    };
    cell.nextblock = ^(NSString *invertoryName){
        UIViewController *Vc = [NSClassFromString(@"LJInventoryDetailViewController") new];
        Vc.navigationItem.title = invertoryName;
        [weakSelf.navigationController pushViewController:Vc animated:YES];
    };
    cell.paymentblock = ^(NSString *money){
        LJLog(@"%@",money);
    };
    return cell;
}

#pragma mark -- 添加底部标签
- (void)addBottomTabBar {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44, SCREEN_WIDTH, 44)];
    view.backgroundColor = [UIColor whiteColor];
    self.viewbg = view;
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44, SCREEN_WIDTH, 44)];
    view2.backgroundColor = [UIColor redColor];
    self.viewbg1 =view2;
    [self.view addSubview:view2];
    
    UIButton *creatBtn = [[ UIButton alloc] initWithFrame:CGRectMake(0, 0, view.lj_width / 2, 44)];
    creatBtn.lj_centerX = view.lj_width / 2;
    [creatBtn setTitle:@"创建清单" forState:UIControlStateNormal];
    [creatBtn setImage:[UIImage imageNamed:@"my_add_icon"] forState:UIControlStateNormal];
    [creatBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
    creatBtn.imageEdgeInsets =UIEdgeInsetsMake(0, -10, 0, 0);
    [creatBtn addTarget:self action:@selector(creatClick:) forControlEvents:UIControlEventTouchUpInside];
    [view2 addSubview:creatBtn];
    self.creatBtn = creatBtn;
    
    UIButton *selectBtn = [[ UIButton alloc] initWithFrame:CGRectMake(0, 0, view.lj_width / 4, 44)];
    [selectBtn setTitle:@"全选" forState:UIControlStateNormal];
    selectBtn.backgroundColor = [UIColor redColor];
    [selectBtn setImage:[UIImage imageNamed:@"my_quan_icon"] forState:UIControlStateNormal];
    [selectBtn setImage:[UIImage imageNamed:@"my_duigou_icon"] forState:UIControlStateSelected];
    [selectBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    selectBtn.imageEdgeInsets =UIEdgeInsetsMake(0, -10, 0, 0);
    [selectBtn addTarget:self action:@selector(selectBtnClicK:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:selectBtn];
    self.allBtn = selectBtn;

    UIButton *delecteBtn = [[UIButton alloc] initWithFrame:CGRectMake(selectBtn.lj_right + 0.5,0 , view.lj_width * 3/ 4 - 0.5 , 44)];
    delecteBtn.backgroundColor = [UIColor redColor];
    [delecteBtn setTitle:@"删除" forState:UIControlStateNormal];
    delecteBtn.contentMode = UIViewContentModeCenter;
    [delecteBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [delecteBtn addTarget:self action:@selector(delecteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.delectBtn = delecteBtn;
    [view addSubview:delecteBtn];
}

#pragma mark --creatBtnClick创建清单 
- (void)creatClick:(UIButton *)sender {
    LJTooltip *tip = [[LJTooltip alloc] initWithToolTipStyle:ToolTipStyleName];
    [tip modifytitle:@"创建清单名称" placeholder:@"请输入新的清单名称"];
    [tip showTooltip];
    tip.okClickBlock = ^(NSString * name){
        LJLog(@"%@",name);
    };
}

#pragma mark --selectBtn 全选事件
- (void)selectBtnClicK:(UIButton *)sender {
    sender.selected = !sender.selected;
    for (LJInventoryModel *model in self.dataArray) {
        model.isSelected = sender.selected;
    }
    if (!sender.selected) {   //如果为未选中状态，则将底部标签栏改为创建清单按钮
        [self.view addSubview:self.viewbg1];
        [self.viewbg removeFromSuperview];
    }
    [self.tableView reloadData];
}

#pragma mark --delecteBtn 
- (void)delecteBtnClick:(UIButton *)sender {
    for (int i = 0; i<self.dataArray.count; i++) {
        LJInventoryModel *model = self.dataArray[i];
        if (model.isSelected) {
            [self.dataArray removeObject:self.dataArray[i]];
        }
    }
    [self.tableView reloadData];
    [self.view addSubview:self.viewbg1];//则将底部标签栏改为创建清单按钮
    [self.viewbg removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
