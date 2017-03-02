//
//  LJGoodsInfoViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 02/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJGoodsInfoViewController.h"
#import "LJGoodsCommentTableViewCell.h"
@interface LJGoodsInfoViewController ()
/*** 商品名称 ***/
@property (nonatomic,strong) UILabel *goodsNameLabel;
/*** 发货时间提示 ***/
@property (nonatomic,strong) UILabel *deliveTipLabel;
/*** 现价格 ***/
@property (nonatomic,strong) UILabel *currentPriceLabel;
/*** 市场价格 ***/
@property (nonatomic,strong) UILabel *marketPriceLabel;
/*** 已售多少 ***/
@property (nonatomic,strong) UILabel *soldNum;
/*** 是否有满减活动 ***/
@property (nonatomic,assign) BOOL isFull;
/*** 满减背景 ***/
@property (nonatomic,strong) UIView *fullBgView;
/*** 满减 ***/
@property (nonatomic,strong) UILabel *fullLabel;
/*** 积分 ***/
@property (nonatomic,strong)  UILabel *integralLabel;
/*** 产地 ***/
@property (nonatomic,strong) UILabel *placeLabel;
/*** 储存环境 ***/
@property (nonatomic,strong) UILabel *reserveLabel;
/*** 规格 ***/
@property (nonatomic,strong) UILabel *standardLabel;
@end

@implementation LJGoodsInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.lj_height = self.view.lj_height - spaceEdgeH(49);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    self.isFull = YES;
    [self setUpTableViewHeaderContent]; //1.设置tableView头部内容
    [self.tableView registerClass:[LJGoodsCommentTableViewCell class] forCellReuseIdentifier:@"LJGoodsCommentTableViewCell"]; //2.注册cell
}

#pragma mark --tableView代理 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 0) {
//        return spaceEdgeH(38);
//    }
    return 163;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJGoodsCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJGoodsCommentTableViewCell"];
    return cell;
}

#pragma mark --设置tableView头部内容
- (void)setUpTableViewHeaderContent {
    //1.让tableView的头部等于headerView
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, spaceEdgeH(695))];
    headerView.backgroundColor = LJCommonBgColor;
    self.tableView.tableHeaderView = headerView;
    //2.预留出上面轮播图的位置
    UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, spaceEdgeH(351))];
    imageview.backgroundColor = LJRandomColor;
    [headerView addSubview:imageview];
    //3.价格、已售详情背景
    UIView *viewbg1 = [[UIView alloc] initWithFrame:CGRectMake(0, imageview.lj_bottom, SCREEN_WIDTH, spaceEdgeH(100))];
    viewbg1.backgroundColor = [UIColor whiteColor];
    [viewbg1 setBgShadow];
    [headerView addSubview:viewbg1];
    
    self.goodsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), spaceEdgeH(8), headerView.lj_width / 2, spaceEdgeH(16))];
    [self.goodsNameLabel setFont:LJFontSize16];
    [self.goodsNameLabel setTextColor:LJFontColor26];
    self.goodsNameLabel.textAlignment = NSTextAlignmentLeft;
    self.goodsNameLabel.text = @"大白菜";
    [viewbg1 addSubview:self.goodsNameLabel];
    
    self.deliveTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.goodsNameLabel.lj_bottom + spaceEdgeH(8), headerView.lj_width - spaceEdgeW(20), spaceEdgeH(12))];
    [self.deliveTipLabel setFont:LJFontSize12];
    [self.deliveTipLabel setTextColor:LJColorFromRGB(0xf36681)];
    self.deliveTipLabel.textAlignment = NSTextAlignmentLeft;
    self.deliveTipLabel.text = @"此商品当日23:59:00前下单，可明日送达，逾期后日送达";
    [viewbg1 addSubview:self.deliveTipLabel];
    
    self.currentPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.deliveTipLabel.lj_bottom + spaceEdgeH(8), headerView.lj_width - spaceEdgeW(20), spaceEdgeH(19))];
    [viewbg1 addSubview:self.currentPriceLabel];
    self.currentPriceLabel.attributedText = [self attrstr:@"￥2.90/500g" dic1:@{NSForegroundColorAttributeName:LJFontColored,NSFontAttributeName:LJFontSize16} dic2:@{NSForegroundColorAttributeName:LJFontColor88,NSFontAttributeName:LJFontSize14} loc1:0 len1:5 loc2:5 len2:5];
    
    self.marketPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.currentPriceLabel.lj_bottom + spaceEdgeH(8), headerView.lj_width / 2, spaceEdgeH(16))];
    [viewbg1 addSubview:self.marketPriceLabel];
    self.marketPriceLabel.attributedText = [self attrstr:@"￥3.90/500g(市场价)" dic1:@{NSForegroundColorAttributeName:LJFontColor61,NSFontAttributeName:LJFontSize16} dic2:@{NSForegroundColorAttributeName:LJFontColor88,NSFontAttributeName:LJFontSize14} loc1:0 len1:5 loc2:5 len2:10];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.marketPriceLabel.lj_width * 2 / 3, 1)];
    line.lj_centerY = self.marketPriceLabel.lj_height / 2;
    line.backgroundColor = [UIColor blackColor];
    [self.marketPriceLabel addSubview:line];
    
    self.soldNum = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - SCREEN_WIDTH / 2, self.marketPriceLabel.lj_y, headerView.lj_width / 2 - 10, spaceEdgeH(14))];
    [self.soldNum setTextColor:LJFontColor88];
    [self.soldNum setFont:LJFontSize14];
    self.soldNum.textAlignment = NSTextAlignmentRight;
    self.soldNum.text = @"已售:323243kg";
    [viewbg1 addSubview:self.soldNum];
    //4.满减
    if (self.isFull) {
        self.fullBgView = [[UIView alloc] initWithFrame:CGRectMake(0, viewbg1.lj_bottom + spaceEdgeH(10), SCREEN_WIDTH, spaceEdgeH(40))];
        self.fullBgView.backgroundColor = [UIColor whiteColor];
        [headerView addSubview:self.fullBgView];
        [self.fullBgView setBgShadow];
        UILabel *fullL = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), 0, spaceEdgeW(34), spaceEdgeH(20))];
        fullL.lj_centerY = self.fullBgView.lj_height / 2;
        fullL.textColor = LJFontColored;
        [fullL setFont:LJFontSize14];
        fullL.layer.borderColor = LJFontColored.CGColor;
        fullL.layer.borderWidth = 1;
        fullL.text = @"满减";
        fullL.textAlignment = NSTextAlignmentCenter;
        [fullL setLayerWithCr:3];
        [self.fullBgView addSubview:fullL];
        self.fullLabel = [[UILabel alloc] initWithFrame:CGRectMake(fullL.lj_right + 5, 0, self.fullBgView.lj_width - fullL.lj_width, spaceEdgeH(40))];
        self.fullLabel.textColor = LJFontColor61;
        [self.fullLabel setFont:LJFontSize14];
        self.fullLabel.text = @"实际支付999元，可免减99元";
        [self.fullBgView addSubview:self.fullLabel];
    }
    //5.积分
    UIView *integralView = [[UIView alloc] init];
    integralView.backgroundColor = [UIColor whiteColor];
    integralView.lj_x = 0;
    integralView.lj_width = headerView.lj_width;
    integralView.lj_height = spaceEdgeH(40);
    [headerView addSubview:integralView];
    [integralView setBgShadow];
    if (self.fullBgView) {
        integralView.lj_y = self.fullBgView.lj_bottom + spaceEdgeH(0.5);
    }else{
        integralView.lj_y = viewbg1.lj_bottom + spaceEdgeH(10);
        headerView.lj_height = spaceEdgeH(695) - spaceEdgeH(40);
    }
    UILabel *integraL = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), 0, spaceEdgeW(34), spaceEdgeH(20))];
    integraL.lj_centerY = integralView.lj_height / 2;
    integraL.textColor = LJFontColored;
    [integraL setFont:LJFontSize14];
    [integraL setLayerWithCr:3];
    integraL.textAlignment = NSTextAlignmentCenter;
    integraL.layer.borderColor = LJFontColored.CGColor;
    integraL.layer.borderWidth = 1;
    integraL.text = @"获得";
    [integralView addSubview:integraL];
    self.integralLabel = [[UILabel alloc] initWithFrame:CGRectMake(integraL.lj_right + 5, 0, integralView.lj_width - integraL.lj_width, spaceEdgeH(40))];
    self.integralLabel.textColor = LJFontColor61;
    [self.integralLabel setFont:LJFontSize14];
    self.integralLabel.text = @"您将获得与实际支付金额同等数值的积分";
    [integralView addSubview:self.integralLabel];
    //6.商品一些主要信息
    UIView *goodsInfoView = [[UIView alloc] initWithFrame:CGRectMake(0, integralView.lj_bottom + spaceEdgeH(10), headerView.lj_width, spaceEdgeH(135))];
    goodsInfoView.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:goodsInfoView];
    [goodsInfoView setBgShadow];
    
    UILabel *nameL = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), spaceEdgeH(8), goodsInfoView.lj_width - spaceEdgeW(18), spaceEdgeH(16))];
    nameL.attributedText = [self attrstr:@"品名:大白菜" dic1:@{NSForegroundColorAttributeName:LJFontColor61,NSFontAttributeName:LJFontSize15} dic2:@{NSForegroundColorAttributeName:LJFontColor39,NSFontAttributeName:LJFontSize16} loc1:0 len1:3 loc2:3 len2:3];
    [goodsInfoView addSubview:nameL];
    
    self.placeLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), nameL.lj_bottom + spaceEdgeH(8), goodsInfoView.lj_width - spaceEdgeW(18), spaceEdgeH(16))];
    self.placeLabel.attributedText = [self attrstr:@"产地:山东省" dic1:@{NSForegroundColorAttributeName:LJFontColor61,NSFontAttributeName:LJFontSize15} dic2:@{NSForegroundColorAttributeName:LJFontColor39,NSFontAttributeName:LJFontSize16} loc1:0 len1:3 loc2:3 len2:3];
    [goodsInfoView addSubview:self.placeLabel];
    
    self.reserveLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.placeLabel.lj_bottom + spaceEdgeH(8), goodsInfoView.lj_width - spaceEdgeW(18), spaceEdgeH(16))];
    self.reserveLabel.attributedText = [self attrstr:@"储存:-3~5C" dic1:@{NSForegroundColorAttributeName:LJFontColor61,NSFontAttributeName:LJFontSize15} dic2:@{NSForegroundColorAttributeName:LJFontColor39,NSFontAttributeName:LJFontSize16} loc1:0 len1:3 loc2:3 len2:5];
    [goodsInfoView addSubview:self.reserveLabel];
    
    self.standardLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.reserveLabel.lj_bottom + spaceEdgeH(8), goodsInfoView.lj_width - spaceEdgeW(18), spaceEdgeH(16))];
    self.standardLabel.attributedText = [self attrstr:@"规格:4kg左右" dic1:@{NSForegroundColorAttributeName:LJFontColor61,NSFontAttributeName:LJFontSize15} dic2:@{NSForegroundColorAttributeName:LJFontColor39,NSFontAttributeName:LJFontSize16} loc1:0 len1:3 loc2:3 len2:5];
    [goodsInfoView addSubview:self.standardLabel];
    
    UILabel *serveL = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.standardLabel.lj_bottom + spaceEdgeH(8), spaceEdgeW(45), spaceEdgeH(20))];
    serveL.text = @"服务:";
    [serveL setFont:LJFontSize15];
    serveL.textColor = LJFontColor61;
    [goodsInfoView addSubview:serveL];
    NSArray *titleArr = @[@"售后",@"自提",@"次日达"];
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(serveL.lj_width + spaceEdgeW(10) + i * spaceEdgeW(90), self.standardLabel.lj_bottom + spaceEdgeH(10), spaceEdgeW(70), spaceEdgeH(20))];
        [btn.titleLabel setFont:LJFontSize15];
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:LJFontColor39 forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"classify_duihao_green_icon"] forState:UIControlStateNormal];
        [goodsInfoView addSubview:btn];
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
    }
}

#pragma mark --富文本
- (NSMutableAttributedString *)attrstr:(NSString *)str dic1:(NSDictionary *)dic1 dic2:(NSDictionary *)dic2  loc1:(NSUInteger)loc1 len1:(NSUInteger)len1 loc2:(NSUInteger)loc2 len2:(NSUInteger)len2 {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:str];
    [attr addAttributes:dic1 range:NSMakeRange(loc1, len1)];
    [attr addAttributes:dic2 range:NSMakeRange(loc2, len2)];
    return attr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
