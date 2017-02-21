//
//  LJMeViewController.m
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJMeViewController.h"
#import "LJOrderStatusTableViewCell.h"
#import "LJOrderBaseViewController.h"
#import "LJRadDot.h"
@interface LJMeViewController ()<UINavigationControllerDelegate>
#define headerSize  SCREEN_WIDTH/5   //头像大小
#define bgImageH    SCREEN_HEIGHT*2/5 +0.5  //背景图片高度
#define orderHight  SCREEN_HEIGHT/11   //订单行高
#define orderHight1  SCREEN_HEIGHT*2/13
#define cellFontSize  [UIFont systemFontOfSize:15 weight:UIFontWeightLight]
/*** 背景视图 ***/
@property (nonatomic,strong) UIView *backgroundView;
/*** 背景图片 ***/
@property (nonatomic,strong) UIImageView *backgroundImageView;
/*** 用户头像 ***/
@property (nonatomic,strong) UIImageView *headerImageView;
/*** 用户昵称 ***/
@property (nonatomic,strong) UILabel *userNameLabel;
/*** 导航栏背景 ***/
@property (nonatomic,strong) UIView *barView;
/*** 余额 ***/
@property (nonatomic,strong) UILabel *balanceLabel;
/*** 积分 ***/
@property (nonatomic,strong) UILabel *integralLabel;
/*** 消息button ***/
@property (nonatomic,strong) UIButton *messageBtn;
@end
/*** 声明cell  ***/
static NSString *const LJOrderStatusCellID = @"LJOrderStatusCell";

@implementation LJMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLayoutHeaderImageView];
    [self setNavigationStatus];
    [self setBalanceAndIntegral];
}

#pragma mark --懒加载
- (UIView *)backgroundView {
    if (!_backgroundView){
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, bgImageH)];
    }
    return _backgroundView;
}

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, bgImageH-50)];
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        _backgroundImageView.clipsToBounds = YES;
        _backgroundImageView.image = [UIImage imageNamed:@"my_bj_pic"];
        [self.backgroundView addSubview:_backgroundImageView];
    }
    return _backgroundImageView;
}

- (UILabel *)userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.textAlignment = NSTextAlignmentCenter;
        _userNameLabel.font = [UIFont systemFontOfSize:15];
        _userNameLabel.text = @"沙县小吃罗泾店";
        [_userNameLabel sizeToFit];
        _userNameLabel.textColor = [UIColor whiteColor];
        [self.backgroundImageView addSubview:_userNameLabel];
    }
    return _userNameLabel;
}

- (UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc ] init];
        _headerImageView.contentMode = UIViewContentModeScaleAspectFit;
        _headerImageView.backgroundColor = LJRandomColor;
        [self.backgroundImageView addSubview:_headerImageView];
    }
    return _headerImageView;
}

#pragma mark --设置背景头像位置
- (void)setLayoutHeaderImageView {
    self.automaticallyAdjustsScrollViewInsets = YES;// 当tableView充满整个View时，这个要为YES
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.backgroundView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    /*** 注册自定义cell ***/
    [self.tableView registerClass:[LJOrderStatusTableViewCell class] forCellReuseIdentifier:LJOrderStatusCellID];
    
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(headerSize);
        make.centerX.mas_equalTo(self.backgroundImageView.mas_centerX);
        make.centerY.mas_equalTo(self.backgroundImageView.mas_centerY);
    }];
    self.headerImageView.layer.masksToBounds = YES; //没这句话它圆不起来
    self.headerImageView.layer.cornerRadius = headerSize / 2;
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerImageView.mas_bottom).offset(10);
        make.centerX.mas_equalTo(self.headerImageView.mas_centerX);
        make.height.mas_equalTo(25);
    }];
}

#pragma mark --导航栏设置 
- (void)setNavigationStatus {
    self.navigationItem.title = @"";
    self.navigationController.delegate = self;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    view.backgroundColor = [UIColor blueColor];
    view.alpha = 0;
    [self.view addSubview:view];
    self.barView = view;
    /*** 左边消息图标 ***/
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame= CGRectMake(0, 15, 50, 50);
    button.tag =1111;
    [button setImage:[UIImage imageNamed:@"tabbar_news_icon"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(messageBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.messageBtn =button;
    LJRadDot *radDot = [[LJRadDot alloc] init]; //小红点
    /*** 获取消息值 ***/
    [radDot showRadDotOnObject:button text:@"101"];
    [self.view addSubview:button];
  
    /*** 右边设置图标 ***/
    UIButton *button1 = [[UIButton alloc] init];
    button1.frame= CGRectMake(0, 15, 50, 50);
    button1.lj_right =self.view.lj_right+5 ;
    [button1 setImage:[UIImage imageNamed:@"tabbar_set_icon"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

#pragma mark --判断是否为当前控制器 
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isShowSelf = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowSelf animated:NO];
}

#pragma mark --余额、积分
-(void)setBalanceAndIntegral {
    UILabel *balance = [[UILabel alloc] initWithFrame:CGRectMake(0, self.backgroundImageView.lj_bottom, SCREEN_WIDTH/4, 50)];
    balance.text = @"余额:";
    [balance setTextAlignment:NSTextAlignmentRight];
    [self.backgroundView addSubview:balance];
    balance.backgroundColor = [UIColor whiteColor];
    [balance setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightLight]];
    [balance setTextColor:LJFontColor39];
    
    self.balanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(balance.lj_right, self.backgroundImageView.lj_bottom, SCREEN_WIDTH/4, 50)];
    self.balanceLabel.text = @"0.00";
    [self.balanceLabel setTextAlignment:NSTextAlignmentLeft];
    [self.balanceLabel setTextColor:LJFontColored];
    [self.balanceLabel setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightLight]];
    [self.backgroundView addSubview:self.balanceLabel];
    self.balanceLabel.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BalanceLabelClick)];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BalanceLabelClick)];
    self.balanceLabel.userInteractionEnabled = YES;
    balance.userInteractionEnabled = YES;
    [balance addGestureRecognizer:tap];
    [self.balanceLabel addGestureRecognizer:tap1];
    /*** 分割线 ***/
    UIView *CutLine = [[UIView alloc] initWithFrame:CGRectMake(self.balanceLabel.lj_right, self.backgroundImageView.lj_bottom, 1, 50)];
    CutLine.backgroundColor = LJCutLineColor;
    [self.backgroundView addSubview:CutLine];
    
    UILabel *integral = [[UILabel alloc] initWithFrame:CGRectMake(CutLine.lj_right, self.backgroundImageView.lj_bottom, SCREEN_WIDTH/4 - 1, 50)];
    integral.text = @"积分:";
    [integral setTextAlignment:NSTextAlignmentRight];
    [self.backgroundView addSubview:integral];
    integral.backgroundColor = [UIColor whiteColor];
    [integral setFont:[UIFont systemFontOfSize:17 weight:UIFontWeightLight]];
    [integral setTextColor:LJFontColor39];
    
    self.integralLabel = [[UILabel alloc] initWithFrame:CGRectMake(integral.lj_right, self.backgroundImageView.lj_bottom, SCREEN_WIDTH/4, 50)];
    self.integralLabel.text = @"1.25千";
    [self.integralLabel setTextAlignment:NSTextAlignmentLeft];
    [self.backgroundView addSubview:self.integralLabel];
    [self.integralLabel setTextColor:LJFontColored];
    [self.integralLabel setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightLight]];
    self.integralLabel.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(IntegralLabelClick)];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(IntegralLabelClick)];
    self.integralLabel.userInteractionEnabled = YES;
    integral.userInteractionEnabled = YES;
    [integral addGestureRecognizer:tap3];
    [self.integralLabel addGestureRecognizer:tap2];
    /*** 分割线 ***/
    UIView *CutLine1 = [[UIView alloc] initWithFrame:CGRectMake(0, self.self.integralLabel.lj_bottom, SCREEN_WIDTH, 0.65)];
    CutLine1.backgroundColor = LJCutLineColor;
    [self.backgroundView addSubview:CutLine1];
}

#pragma mark --消息触发
- (void)messageBtnClick {
    LJLogFunc
}

#pragma mark --设置触发
- (void)settingBtnClick {
    UIViewController * Vc =[NSClassFromString(@"LJSettingViewController") new];
    [self.navigationController pushViewController:Vc animated:YES];
}

#pragma mark --余额点击触发
- (void)BalanceLabelClick {
    UIViewController * Vc =[NSClassFromString(@"") new];
    [self.navigationController pushViewController:Vc animated:YES];
}

#pragma mark --积分点击触发
- (void)IntegralLabelClick {
    LJLogFunc
}

/*** tableView代理方法 ***/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 4;
            break;
        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return orderHight;
        }else{
            return orderHight1;
        }
    }else{
        return orderHight;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 &&indexPath.row ==1) {
        /*** 自定义订单cell ***/
        LJOrderStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LJOrderStatusCellID];
        __weak LJMeViewController* weakSelf = self;
        cell.myOrderBlock = ^(NSInteger tag){
            [weakSelf MyOrderStatusClick:tag];
        };
        return cell;
    }else{
        static NSString* cellId = @"cellId";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell.textLabel setFont:cellFontSize];
        /*** 分割线 ***/
        UIView *CutLine = [[UIView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, 0.5)];
        CutLine.backgroundColor = LJCutLineColor;
        [cell addSubview:CutLine];
        
        if (indexPath.section ==0) {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"我的订单";
                cell.detailTextLabel.text = @"查看全部订单";
                [cell.detailTextLabel setTextColor:LJFontColor39];
                [cell.detailTextLabel setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightLight]];
            }
        }else {
            switch (indexPath.row) {
                case 0:
                    cell.imageView.image = [UIImage imageNamed:@"my_evaluate_icon"];
                    cell.textLabel.text = @"采购清单";
                    break;
                case 1:
                    cell.imageView.image = [UIImage imageNamed:@"my_collect_icon"];
                    cell.textLabel.text = @"我的收藏";
                    break;
                case 2:
                    cell.imageView.image = [UIImage imageNamed:@"my_service_icon"];
                    cell.textLabel.text = @"在线客服";
                    break;
                case 3:
                    cell.imageView.image = [UIImage imageNamed:@"my_aboutus_icon"];
                    cell.textLabel.text = @"关于我们";
                    break;
                default:
                    break;
            }
        }
        return cell;
    }
}

#pragma mark --查看我的订单状态
- (void)MyOrderStatusClick:(NSInteger)tag {
    if (tag == 0) { //待付款
        UIViewController *Vc = [NSClassFromString(@"LJPayOrderViewController") new];
        [self.navigationController pushViewController:Vc animated:YES];
    }else if (tag == 1){ //待配送
        UIViewController *Vc = [NSClassFromString(@"LJDeliverOreViewController") new];
        [self.navigationController pushViewController:Vc animated:YES];
    }else if (tag == 2){ //待收货
        UIViewController *Vc = [NSClassFromString(@"LJReceiveOrderViewController") new];
        [self.navigationController pushViewController:Vc animated:YES];
    }else if (tag == 3){//退换货
        UIViewController *Vc = [NSClassFromString(@"LJReturnGoodsOrderViewController") new];
        [self.navigationController pushViewController:Vc animated:YES];
    }else if (tag == 4){ //待评价
        UIViewController *Vc = [NSClassFromString(@"LJEvaluateOrderViewController") new];
        [self.navigationController pushViewController:Vc animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section ==0) {
        if (indexPath.row == 0) {//全部订单
            UIViewController *Vc = [NSClassFromString(@"LJAllOrderViewController") new];
            [self.navigationController pushViewController:Vc animated:YES];
        }
    }else {
        if (indexPath.row == 0) {
            UIViewController *Vc = [NSClassFromString(@"LJInventoryViewController") new];
            [self.navigationController pushViewController:Vc animated:YES];
        }else if (indexPath.row == 1){
            
        }else if (indexPath.row == 2){
            
        }else if (indexPath.row == 3){
            
        }
    }
}

#pragma mark --ScrollView 代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset_Y = scrollView.contentOffset.y;
    /*** 图片放大 ***/
    CGFloat imageH = self.backgroundView.lj_height;
    CGFloat imageW = SCREEN_WIDTH;
    if (offset_Y < 0) {
        CGFloat totalOffset = imageH + ABS(offset_Y);  //ABS 是整数绝对值
        CGFloat f = totalOffset / imageH;
        self.backgroundImageView.frame = CGRectMake(-(imageW*f - imageW)*0.5, offset_Y, imageW*f, totalOffset-50);
    }else{
        self.backgroundImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.backgroundView.lj_height-50);
    }
    if (offset_Y > -20) {
        CGFloat alpha = MIN(1, 1-(64 -offset_Y)/64);
        self.barView.alpha =alpha;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    /*** 将tableView恢复到初始位置 ***/
    [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
}
@end
