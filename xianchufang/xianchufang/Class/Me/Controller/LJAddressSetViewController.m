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
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addNewAddressBtn];
}

#pragma mark --添加新地址
- (void)addNewAddressBtn {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(42, SCREEN_HEIGHT - 64, SCREEN_WIDTH -84, 48)];
    button.backgroundColor = LJColorFromRGB(0x849cf6);
    [button setLayerWithCr:5];
    [button setTitle:@"添加新地址" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button.titleLabel setFont:LJFontSize];
    [button addTarget:self action:@selector(NewAddressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark --NewAddressBtn Click
- (void)NewAddressBtn:(UIButton *)sender {
    LJLogFunc
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
            NSLog(@"3001");
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
