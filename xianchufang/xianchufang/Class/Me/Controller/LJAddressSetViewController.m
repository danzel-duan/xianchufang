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
}

#pragma mark --添加新地址
- (void)addNewAddressBtn {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 48, SCREEN_WIDTH , 48)];
    button.backgroundColor = LJColorFromRGB(0x849cf6);
    [button setTitle:@"添加新地址" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"my_add_icon"] forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    button.titleLabel.textColor = [UIColor whiteColor];
    [button.titleLabel setFont:LJFontSize];
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
    return 9;
}

- (UITableViewCell  *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJAddressSetTableViewCell *cell = [LJAddressSetTableViewCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    __weak LJAddressSetViewController *weakSelf =self;
    cell.opeartionBlock = ^(NSInteger tag) {
        if (tag == 3001) {
            UIViewController *Vc = [NSClassFromString(@"LJNewAddressViewController") new];
            Vc.navigationItem.title = @"修改地址";
            [self.navigationController pushViewController:Vc animated:YES];
        }else if(tag == 3002){
            NSLog(@"3002");
        }else if(tag == 3003){
            NSLog(@"3003");
        }
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 144;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
