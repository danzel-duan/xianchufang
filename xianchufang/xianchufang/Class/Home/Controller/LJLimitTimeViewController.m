//
//  LJLimitTimeViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 09/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJLimitTimeViewController.h"
#import "LJLastTimeView.h"
#import "LJLimitTimeTableViewCell.h"

@interface LJLimitTimeViewController ()
/*** banner图片 ***/
@property (nonatomic,strong) UIImageView *bannerImageView;
/*** 计时器 ***/
@property (nonatomic,strong) NSTimer *Timer;
/*** 剩余时间 ***/
@property (nonatomic,assign) NSUInteger lastTime;
/*** 剩余时间Label显示 ***/
@property (nonatomic,strong) LJLastTimeView *LastTimeView;
/*** 提示label ***/
@property (nonatomic,strong) UILabel *tipLabel;
@end

@implementation LJLimitTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigaitonFont];  //1.设置导航栏字体
    [self setupBanner];        //2.设置Banner
    [self activityTime];       //3.活动时间
    [self setupBaseInfo];      //4.tableView基本属性  
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark --setNavigationFont 设置导航栏字体
- (void)setNavigaitonFont {
    UIImageView *titleViewImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    titleViewImage.image = [UIImage imageNamed:@"home_miaosha_icon"];
    [titleViewImage sizeToFit];
    [self.navigationItem setTitleView:titleViewImage];
}

#pragma mark --banner 
- (void)setupBanner {
    self.bannerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, spaceEdgeH(120))];
    self.bannerImageView.backgroundColor = LJRandomColor;
    self.bannerImageView.image = [UIImage imageNamed:@""];
    [self.view addSubview:self.bannerImageView];
}

#pragma mark --activity time 活动时间
- (void)activityTime {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bannerImageView.lj_bottom, SCREEN_WIDTH, spaceEdgeH(45))];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    UILabel *tipLabel  = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), 0, spaceEdgeW(120), spaceEdgeH(20))];
    tipLabel.lj_centerY = bgView.lj_height / 2;
    tipLabel.textColor = LJTheMeColor;
    tipLabel.font = LJFontSize18;
    tipLabel.text = @"活动持续时间";
    [bgView addSubview:tipLabel];
    self.tipLabel = tipLabel;

    self.LastTimeView = [[NSBundle mainBundle] loadNibNamed:@"LJLastTimeView" owner:nil options:nil].lastObject;
    self.LastTimeView.frame = CGRectMake(SCREEN_WIDTH - 140, 0, 120, spaceEdgeH(45));
    [bgView addSubview:self.LastTimeView];
    //从后台获取活动还剩的时间  、、这里模拟数据
    self.lastTime = 10;
    [self startTimer];
}

#pragma mark --tableView 基本属性
- (void)setupBaseInfo {
    self.tableView.lj_y = 64 + spaceEdgeH(170);
    self.tableView.lj_height = SCREEN_HEIGHT - 64 - spaceEdgeH(170);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[LJLimitTimeTableViewCell class] forCellReuseIdentifier:@"LJLimitTimeTableViewCell"];
}

#pragma mark --tableView 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJLimitTimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJLimitTimeTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return spaceEdgeH(110);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = [NSClassFromString(@"LJGoodsDetailFatherViewController") new];
    [self.navigationController pushViewController:vc animated:YES];
}

//倒计时
- (void)startTimer
{
    self.Timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshLessTime) userInfo:@"" repeats:YES];
}

- (void)refreshLessTime {
    NSUInteger time;
    if (self.lastTime == 0) {
        time = 0;
    }else{
        time = self.lastTime --;
    }
    NSString *timeStr = [self lessSecondToDay:time];
    if ([timeStr isEqualToString:@"已结束"]) {timeStr = @"00:00:00";self.tipLabel.text = @"活动已结束！";}
    self.LastTimeView.Hour1Label.text = [timeStr substringWithRange:NSMakeRange(0, 1)];
    self.LastTimeView.Hour2Label.text = [timeStr substringWithRange:NSMakeRange(1, 1)];
    self.LastTimeView.Min1Label.text = [timeStr substringWithRange:NSMakeRange(3, 1)];
    self.LastTimeView.Min2Label.text = [timeStr substringWithRange:NSMakeRange(4, 1)];
    self.LastTimeView.Second1Label.text = [timeStr substringWithRange:NSMakeRange(6, 1)];
    self.LastTimeView.Second2Label.text = [timeStr substringWithRange:NSMakeRange(7, 1)];
}

//根据秒数计算剩余时间：天，小时，分钟，秒
- (NSString *)lessSecondToDay:(NSUInteger)seconds
{
    NSUInteger hour = (NSUInteger)(seconds%(24*3600))/3600;
    NSUInteger min  = (NSUInteger)(seconds%(3600))/60;
    NSUInteger second = (NSUInteger)(seconds%60);
    NSString *timeStr;
    if (seconds == 0) {
        timeStr = @"已结束";
        [self removeTimer];
    }else{
        timeStr = [NSString stringWithFormat:@"%02zd:%02zd:%02zd",(unsigned long)hour,(unsigned long)min,(unsigned long)second];
    }
    return timeStr;
}

//移除计时器
- (void)removeTimer {
    [self.Timer invalidate];
    self.Timer = nil;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSArray *viewControllers = self.navigationController.viewControllers;
    if ([viewControllers indexOfObject:self] == NSNotFound) {
        [self removeTimer]; //当是pop时就消毁计时器
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
