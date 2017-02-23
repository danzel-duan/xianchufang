//
//  LJIntefralViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 22/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJIntefralViewController.h"
#import "LJIntegralTableViewCell.h"
@interface LJIntefralViewController ()
/*** 积分 ***/
@property (nonatomic,strong) UILabel *IntefralLabel;

@property (nonatomic,strong) NSString *Intefral; //
@end

@implementation LJIntefralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.navigationItem.title = @"积分查询";
    self.tableView.lj_y = spaceEdgeH(200);
    self.tableView.lj_height= SCREEN_HEIGHT - spaceEdgeH(205);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO; 
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LJIntegralTableViewCell class] forCellReuseIdentifier:@"LJIntegralTableViewCell"];
    
    [self setNavigationEdit];
    [self addBgView];
}

#pragma mark --导航栏编辑
- (void)setNavigationEdit {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithText:@"积分规则" hightext:nil color:LJColorFromRGB(0x4c4c4c)
                                                                 highColor:nil target:self action:@selector(NavigationClick:)];
}

#pragma mark --x编辑事件
- (void)NavigationClick:(UIButton *)sender {
    UIViewController *Vc = [NSClassFromString(@"LJIntefralRuleViewController") new];
    [self.navigationController pushViewController:Vc animated:YES];
}

#pragma mark --添加背景30c246 3ce5bf
- (void)addBgView {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, spaceEdgeH(160))];
    [self.view addSubview:bgView];
    
    /*** 绘制渐变 ***/
    CAGradientLayer *layer = [CAGradientLayer new];
    layer.colors = @[(__bridge id)LJColorFromRGB(0x3de4be).CGColor,(__bridge id)LJColorFromRGB(0x40dd75).CGColor];
    /*** 起终点 ***/
    layer.startPoint = CGPointMake(SCREEN_WIDTH / 2, 0);
    layer.endPoint = CGPointMake(SCREEN_WIDTH / 2, 1);
    layer.frame = bgView.frame;
    [self.view.layer addSublayer:layer];
    
    UILabel *balanceL = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(40), spaceEdgeH(98), 0, 30)];
    balanceL.text = @"账户积分:";
    [balanceL setFont:LJFontSize18];
    [balanceL sizeToFit];
    [balanceL setTextColor:[UIColor whiteColor]];
    [self.view addSubview:balanceL];
    
    self.Intefral = @"45.02";
    
    self.IntefralLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, spaceEdgeH(125), SCREEN_WIDTH, 90)];
    [self.IntefralLabel setTextColor:[UIColor whiteColor]];
    [self.IntefralLabel setFont:[UIFont systemFontOfSize:50]];
    self.IntefralLabel.lj_centerX = SCREEN_WIDTH / 2;
    self.IntefralLabel.textAlignment = NSTextAlignmentCenter;
    self.IntefralLabel.text = self.Intefral;
    [self.view addSubview:self.IntefralLabel];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, bgView.lj_bottom - 1, SCREEN_WIDTH, spaceEdgeH(40))];
    label.text = @"   积分明细";
    label.backgroundColor = LJCommonBgColor;
    [label setFont:LJFontSize16];
    [label setTextColor:LJFontColor4c];
    [self.view addSubview:label];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return spaceEdgeH(79);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJIntegralTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJIntegralTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
