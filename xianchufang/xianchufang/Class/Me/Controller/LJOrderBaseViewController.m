//
//  LJOrderBaseViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 21/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJOrderBaseViewController.h"
#import "LJOrderTableViewCell.h"

@interface LJOrderBaseViewController ()

@end

@implementation LJOrderBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView.lj_y = 9.0;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[LJOrderTableViewCell class] forCellReuseIdentifier:@"LJOrderTableViewCell"];
    
    //测试数据
    NSArray *arr = [NSMutableArray arrayWithObjects:@{@"orderNum":@"AF334FAU564",@"orderStatus":@"1",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]},@{@"orderNum":@"AF334FAU564",@"orderStatus":@"1",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]},@{@"orderNum":@"AF334FAU564",@"orderStatus":@"2",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]},@{@"orderNum":@"AF334FAU564",@"orderStatus":@"1",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]},@{@"orderNum":@"AF334FAU564",@"orderStatus":@"1",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]},@{@"orderNum":@"AF334FAU564",@"orderStatus":@"3",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]},@{@"orderNum":@"AF334FAU564",@"orderStatus":@"1",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]},@{@"orderNum":@"AF334FAU564",@"orderStatus":@"1",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]},@{@"orderNum":@"AF334FAU564",@"orderStatus":@"1",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]},@{@"orderNum":@"AF334FAU564",@"orderStatus":@"1",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]}, nil];
    
    self.dataArray = [LJOrderModel mj_objectArrayWithKeyValuesArray:arr];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJOrderModel *model = self.dataArray[indexPath.row];
    return model.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJOrderTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    LJOrderModel *model = self.dataArray[indexPath.row];
    cell.orderDataModel = model;
    __weak LJOrderBaseViewController *weakSelf = self;
    cell.dropblock = ^ (NSInteger row){
        [weakSelf.tableView reloadData];
    };
    return cell;
}

- (OrderStatus)orderStatus {
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
