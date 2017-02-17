//
//  LJSettingViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 15/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJSettingViewController.h"
@interface LJSettingViewController ()

//@property (nonatomic,strong) UITableView *tavleView;

/*** 版本号 ***/
@property (nonatomic,strong) NSString *versionNum;
@end

@implementation LJSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 84, SCREEN_WIDTH, 220)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO; //去掉弹性效果
    [self.view addSubview:self.tableView];
    /*** 退出操作按钮 ***/
    UIButton *quitBtn = [[UIButton alloc] initWithFrame:CGRectMake(ljEdgeMax, SCREEN_HEIGHT - 124, SCREEN_WIDTH-ljEdgeMax * 2, 44)];
    quitBtn.backgroundColor = [UIColor redColor];
    [quitBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [quitBtn setTitle:@"退出当前用户" forState:UIControlStateNormal];
    [quitBtn addTarget:self action:@selector(ExitCurrentUser) forControlEvents:UIControlEventTouchUpInside];
    [quitBtn setLayerWithCr:5];
    [self.view addSubview:quitBtn];
}

#pragma mark --退出触发
- (void)ExitCurrentUser {
    LJLogFunc
}

#pragma mark --代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)   tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //指示器
    [cell.textLabel setFont:LJFontSize];
    [cell.detailTextLabel setFont:LJFontSize];
    [cell.textLabel setTextColor:LJFontColor];
    [cell.detailTextLabel setTextColor:LJFontColor];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"个人资料";
            break;
        case 1:
            cell.textLabel.text = @"地址管理";
            break;
        case 2:
            cell.textLabel.text = @"修改密码";
            break;
        case 3:
            cell.textLabel.text = @"检查更新";
            //            cell.detailTextLabel.text = self.versionNum;
            cell.detailTextLabel.text = @"v 1.10";
            break;
        case 4:
            cell.textLabel.text = @"意见反馈";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        UIViewController * Vc =[NSClassFromString(@"LJUserInfoViewController") new];
        [self.navigationController pushViewController:Vc animated:YES];
    }else if (indexPath.row == 1){
        UIViewController * Vc =[NSClassFromString(@"LJAddressSetViewController") new];
        [self.navigationController pushViewController:Vc animated:YES];
    }else if (indexPath.row == 2){
        UIViewController * Vc =[NSClassFromString(@"LJModifyPwdViewController") new];
        [self.navigationController pushViewController:Vc animated:YES];
    }else if (indexPath.row == 3){
        UIViewController * Vc =[NSClassFromString(@"LJCheckUpdateViewController") new];
        [self.navigationController pushViewController:Vc animated:YES];
    }else if (indexPath.row == 4){
        UIViewController * Vc =[NSClassFromString(@"LJOpinionViewController") new];
        [self.navigationController pushViewController:Vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
