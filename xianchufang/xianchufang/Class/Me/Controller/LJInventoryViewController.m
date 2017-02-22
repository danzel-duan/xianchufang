//
//  LJInventoryViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 20/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJInventoryViewController.h"
#import "LJInventoryTableViewCell.h"
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
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return autoEdgeH(239);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJInventoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJInventoryTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    __weak LJInventoryViewController *weakSelf = self;
    cell.selectblock = ^(NSString *tag,int selectNum ){
        if ([tag isEqualToString:@"1"]) {
            [weakSelf.view addSubview:weakSelf.viewbg];
            [weakSelf.viewbg1 removeFromSuperview];
        }else{
            if (selectNum <= 0) {
                [weakSelf.view addSubview:weakSelf.viewbg1];
                [weakSelf.viewbg removeFromSuperview];
            } 
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

#pragma mark -- 添加底部结算标签
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
    [delecteBtn addTarget:self action:@selector(creatClick:) forControlEvents:UIControlEventTouchUpInside];
    self.delectBtn = delecteBtn;
    [view addSubview:delecteBtn];
}

#pragma mark --creatBtnClick 
- (void)creatClick:(UIButton *)sender {
    LJLogFunc
}

#pragma mark --selectBtn 
- (void)selectBtnClicK:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
    }else{
        sender.selected = YES;
    }
}

#pragma mark --delecteBtn 
- (void)delecteBtnClick:(UIButton *)sender {
    LJLogFunc
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
