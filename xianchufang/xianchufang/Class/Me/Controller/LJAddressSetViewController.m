//
//  LJAddressSetViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 16/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJAddressSetViewController.h"
#import "LJAddressSetTableViewCell.h"

@interface LJAddressSetViewController ()

@end

@implementation LJAddressSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"地址管理";
    /*** 添加tableView ***/
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView.lj_height = SCREEN_HEIGHT - 48;
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addNewAddressBtn];
    
    //测试数据
    NSArray *arr = @[@{@"name":@"张三",@"phone":@"123423984",@"address":@"上海市宝山区罗泾镇陈川新村180",@"isDefault":@"yes"},@{@"name":@"张三",@"phone":@"123423984",@"address":@"上海市宝山区罗泾镇陈川新村180",@"isDefault":@""},@{@"name":@"张三",@"phone":@"123423984",@"address":@"上海市宝山区罗泾镇陈川新村180",@"isDefault":@""},@{@"name":@"张三",@"phone":@"123423984",@"address":@"上海市宝山区罗泾镇陈川新村180",@"isDefault":@""}];
    self.dataArray = [LJAddressModel mj_objectArrayWithKeyValuesArray:arr];
    [self.tableView reloadData];
}

#pragma mark --添加新地址
- (void)addNewAddressBtn {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 48, SCREEN_WIDTH , 48)];
    button.backgroundColor = LJColorFromRGB(0x849cf6);
    [button setTitle:@"添加新地址" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"my_add_icon"] forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    button.titleLabel.textColor = [UIColor whiteColor];
    [button.titleLabel setFont:LJFontSize16];
    [button addTarget:self action:@selector(NewAddressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark --NewAddressBtn Click
- (void)NewAddressBtn:(UIButton *)sender {
    UIViewController *Vc= [NSClassFromString(@"LJNewAddressViewController") new];
    Vc.navigationItem.title = @"新增地址管理";
    [self.navigationController pushViewController:Vc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell  *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJAddressSetTableViewCell *cell = [LJAddressSetTableViewCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    LJAddressModel *model = self.dataArray[indexPath.row];
    cell.addressModel = model;
    cell.row = indexPath.row;
    __weak LJAddressSetViewController *weakSelf = self;
    __weak LJAddressSetTableViewCell *weakCell = cell;
    cell.opeartionBlock = ^(NSInteger tag ,NSInteger row) {
        if (tag == 3001) {
            UIViewController *Vc = [NSClassFromString(@"LJNewAddressViewController") new];
            Vc.navigationItem.title = @"修改地址";
            [self.navigationController pushViewController:Vc animated:YES];
        }else if(tag == 3002){  //删除
            if (weakCell.addressModel.isDefault) return ;
            [weakSelf.dataArray removeObject:weakSelf.dataArray[row]];  ///////////后期在这删除数据进行上传 ----->>
            NSIndexPath *index = [NSIndexPath indexPathForRow:row inSection:0];
            [weakSelf.tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationTop];
        }else if(tag == 3003){
            //后期在这数据进行上传,更改默认地址 ----->>
        }
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LJLogFunc
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return spaceEdgeH(144);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
