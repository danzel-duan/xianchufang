//
//  LJOrderBaseViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 21/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJOrderBaseViewController.h"
#import "LJOrderTableViewCell.h"
#import "LJPaymentSuccessViewController.h" //支付成功页面
#import "LJEvaluateViewController.h" //待评价页面
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
    //OrderStatus0 = 0,  //待付款
//    OrderStatus1 ,     //待配送
//    OrderStatus2,      //待收货
//    OrderStatus3,      //退换货
//    OrderStatus4       //待评价
    NSArray *arr = [NSMutableArray arrayWithObjects:@{@"orderNum":@"AF334FAU564",@"orderStatus":@"4",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]},@{@"orderNum":@"AF334FAU564",@"orderStatus":@"4",@"goodsNum":@"3",@"totalPrice":@"564",@"postPticStr":@"不包含运费",@"goodsArray":@[@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"},@{@"goodsName":@"宝山大樱桃",@"goodsWeight":@"64",@"goodsPrice":@"2.6"}]}, nil];
    
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
    cell.clickblock = ^ (NSInteger tag) {
        //若是付款、确认收货按钮，则需要跳转到支付成功页面
        //tag = 3010 付款      3011:取消       3012:待收货       3013:评价      3014:退货
        if (tag == 3010) {  
            LJPaymentSuccessViewController *Vc = [[LJPaymentSuccessViewController alloc] init];
            Vc.isSuccess = NO;
            [weakSelf.navigationController pushViewController:Vc animated:YES];
        }else if (tag == 3012) { //确认收货
            LJPaymentSuccessViewController *Vc = [[LJPaymentSuccessViewController alloc] init];
            Vc.isSuccess = YES;
            [weakSelf.navigationController pushViewController:Vc animated:YES];
        }else if (tag == 3013) {  //待评价
            LJEvaluateViewController *evaluateView = [[LJEvaluateViewController alloc] init];
            [weakSelf.navigationController pushViewController:evaluateView animated:YES];
        }
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController * Vc =[NSClassFromString(@"LJOrderBaseDetailViewController") new];
    [self.navigationController pushViewController:Vc animated:YES];
}

- (OrderStatus)orderStatus {
    return 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
