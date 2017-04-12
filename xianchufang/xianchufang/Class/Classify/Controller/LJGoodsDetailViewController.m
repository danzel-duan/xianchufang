//
//  LJGoodsDetailViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 17/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJGoodsDetailViewController.h"

@interface LJGoodsDetailViewController ()

#pragma mark --简介背景下的
/*** 简介背景 ***/
@property (nonatomic,strong) UIView *bgView1;
/*** 商品名称 ***/
@property (nonatomic,strong) UILabel *goodsNameLabel;
/*** 商品简介 ***/
@property (nonatomic,strong) UILabel *goodsBriefLabel;
/*** 商品图片 ***/
@property (nonatomic,strong) UIImageView *goodsPriceView;

#pragma mark --产地信息下的
/*** 产地图片 ***/
@property (nonatomic,strong) UIImageView *productPlaceView;
/*** 产地名称 ***/
@property (nonatomic,strong) UILabel *productPlaceNameLabel;
/*** 产地简介 ***/
@property (nonatomic,strong) UILabel *productPlaceBriefLabel;

#pragma mark --栽种方式背景
@property (nonatomic,strong) UIView *bgView3;
#pragma mark --包装运输背景
@property (nonatomic,strong) UIView *bgView4;
#pragma mark --食用方法背景
@property (nonatomic,strong) UIView *bgView5;
#pragma mark --商品规格
@property (nonatomic,strong) UIView *bgView6;

/*** 商品编号 ***/
@property (nonatomic,strong) UILabel *goodsNumLabel;
/*** 储存方式 ***/
@property (nonatomic,strong) UILabel *wayLabel;
/*** 售卖方式 ***/
@property (nonatomic,strong) UILabel *soldWayLabel;
/*** 保质期 ***/
@property (nonatomic,strong) UILabel *timeLabel;


/*** 授权证书图片 ***/
@property (nonatomic,strong) UIImageView *certificateView;

#pragma mark --基本信息
@property (nonatomic,strong) UIScrollView *ScrollView;


@end

@implementation LJGoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 1)];
    line.backgroundColor = LJCutLineColor;
    [self.view addSubview:line];
    
    self.ScrollView = [[UIScrollView alloc] init];    //2.设置ScrollView的属性
    self.ScrollView.backgroundColor = LJCommonBgColor;
    self.ScrollView.frame = CGRectMake(0, 66, SCREEN_WIDTH, self.view.lj_height - spaceEdgeH(49) - 64);
    self.ScrollView.contentSize = CGSizeMake(0, spaceEdgeH(1300));
    [self.view addSubview:self.ScrollView];
    
    [self addGoodsBriefInfo];
    [self addProductPlaceInfo];
    [self addBgView3];
    [self addBgView4];
    [self addBgView5];
    [self addBgView6];
    
    ///--------------->>>>>>>获取数据说明，除栽种方式、包装运输、食用方法需要传入数组赋值外，其它无可直接赋值；
    
}

#pragma mark --添加简介
- (void)addGoodsBriefInfo {
    self.bgView1 = [[UIView alloc] initWithFrame:CGRectMake(spaceEdgeW(10), spaceEdgeH(7), SCREEN_WIDTH - spaceEdgeW(10), spaceEdgeH(160))];
    self.bgView1.backgroundColor = LJTheMeColor;
    [self.ScrollView addSubview:self.bgView1];
    
    self.goodsPriceView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(215), spaceEdgeH(5), spaceEdgeW(215), spaceEdgeH(150))];
    self.goodsPriceView.backgroundColor = LJRandomColor;
    [self.bgView1 addSubview:self.goodsPriceView];
    
    self.goodsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, spaceEdgeH(15), spaceEdgeW(150), spaceEdgeH(20))];
    [self.bgView1 addSubview:self.goodsNameLabel];
    self.goodsNameLabel.textColor = [UIColor whiteColor];
    self.goodsNameLabel.font = LJFontSize18;
    self.goodsNameLabel.textAlignment = NSTextAlignmentCenter;
    self.goodsNameLabel.text = @"山药，作为药食";
    
    self.goodsBriefLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(5), self.goodsNameLabel.lj_bottom + spaceEdgeH(10), spaceEdgeW(140), spaceEdgeH(12))];
    self.goodsBriefLabel.lj_right = self.goodsPriceView.lj_x - spaceEdgeW(5);
    [self.bgView1 addSubview:self.goodsBriefLabel];
    self.goodsBriefLabel.textColor = [UIColor whiteColor];
    self.goodsBriefLabel.font = LJFontSize12;
    self.goodsBriefLabel.text = @"区域气候特征、地质特点、生长习性等因素的影响，具有不同的产地特征。山药主产地河南博爱、武陟、温县等地，山西、陕西、山东、河北";
    self.goodsBriefLabel.numberOfLines = 0;
    [self.goodsBriefLabel sizeToFit];
}

#pragma mark --产地信息
- (void)addProductPlaceInfo {
    UILabel *label = [self addForString:@"产地信息" location:self.bgView1.lj_bottom + spaceEdgeH(8)];
    [self.ScrollView addSubview:label];
    
    self.productPlaceView = [[UIImageView alloc] initWithFrame:CGRectMake(spaceEdgeW(10), label.lj_bottom, spaceEdgeW(355), spaceEdgeH(180))];
    self.productPlaceView.backgroundColor = LJRandomColor;
    [self.ScrollView addSubview:self.productPlaceView];
    
    UIImageView *productPlaceInfoView = [[UIImageView alloc] initWithFrame:CGRectMake(self.productPlaceView.lj_right - spaceEdgeW(144), spaceEdgeH(10), spaceEdgeW(124), spaceEdgeH(142))];
    productPlaceInfoView.backgroundColor = LJRandomColor;
    [self.productPlaceView addSubview:productPlaceInfoView];
    
    self.productPlaceNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, spaceEdgeH(16), productPlaceInfoView.lj_width, spaceEdgeH(18))];
    self.productPlaceNameLabel.textColor = LJFontColor26;
    self.productPlaceNameLabel.font = LJFontSize16;
    self.productPlaceNameLabel.textAlignment = NSTextAlignmentCenter;
    self.productPlaceNameLabel.text = @"山药原名薯蓣";
    [productPlaceInfoView addSubview:self.productPlaceNameLabel];
    
    self.productPlaceBriefLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(4), self.productPlaceNameLabel.lj_bottom + spaceEdgeH(5), productPlaceInfoView.lj_width - spaceEdgeW(8), spaceEdgeH(14))];
    self.productPlaceBriefLabel.textColor = LJFontColor26;
    self.productPlaceBriefLabel.font = LJFontSize14;
    self.productPlaceBriefLabel.textAlignment = NSTextAlignmentCenter;
    self.productPlaceBriefLabel.text = @"因避讳改为薯药；北宋时因避宋英宗赵曙讳而更名山药";
    [productPlaceInfoView addSubview:self.productPlaceBriefLabel];
    self.productPlaceBriefLabel.numberOfLines = 0;
    [self.productPlaceBriefLabel sizeToFit];
}

#pragma mark --栽种方式
- (void)addBgView3 {
    UILabel *label = [self addForString:@"栽种方式" location:self.productPlaceView.lj_bottom + spaceEdgeH(8)];
    [self.ScrollView addSubview:label];
    
    CGFloat x = spaceEdgeW(10);
    CGFloat y = label.lj_bottom;
    CGFloat w = spaceEdgeW(174);
    CGFloat h = spaceEdgeH(210);
    for (int i = 0; i < 2; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x + i * w + i * spaceEdgeW(8), y, w, h)];
        view.backgroundColor = [UIColor whiteColor];
        [self.ScrollView addSubview:view];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(spaceEdgeW(4), spaceEdgeH(4), spaceEdgeW(166), spaceEdgeH(140))];
        imageView.backgroundColor = LJRandomColor;
        [view addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(4), imageView.lj_bottom + spaceEdgeH(8), view.lj_width - spaceEdgeW(8), spaceEdgeH(15))];
        label.text = @"山药，受区域气候特征、地质特点、生长习性等因素的影响";
        label.textColor = LJFontColor39;
        label.font = LJFontSize14;
        label.numberOfLines = 0;
        [label sizeToFit];
        [view addSubview:label];
        
        self.bgView3 = view;
    }
}

#pragma mark --包装运输
- (void)addBgView4 {
    UILabel *label = [self addForString:@"包装运输" location:self.bgView3.lj_bottom + spaceEdgeH(8)];
    [self.ScrollView addSubview:label];
    self.bgView4 = [[UIView alloc] initWithFrame:CGRectMake(spaceEdgeW(10), label.lj_bottom, SCREEN_WIDTH - spaceEdgeW(20), spaceEdgeH(135))];
    self.bgView4.backgroundColor = [UIColor whiteColor];
    [self.ScrollView addSubview:self.bgView4];
    
    CGFloat x = spaceEdgeW(20);
    CGFloat y = spaceEdgeH(10);
    CGFloat w = spaceEdgeW(90);
    CGFloat h = w;
    for (int  i = 0; i <3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x + i* w + i * spaceEdgeW(22), y, w, h)];
        [imageView setLayerWithCr:w / 2];
        imageView.backgroundColor = LJRandomColor;
        [self.bgView4 addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imageView.lj_x, imageView.lj_bottom + spaceEdgeH(8), imageView.lj_width, spaceEdgeH(15))];
        label.textColor = LJFontColor39;
        label.font = LJFontSize14;
        label.text = @"包装运输";
        label.textAlignment = NSTextAlignmentCenter;
        [self.bgView4 addSubview:label];
    }
}

#pragma mark --食用方法
- (void)addBgView5 {
    UILabel *label = [self addForString:@"食用方法" location:self.bgView4.lj_bottom + spaceEdgeH(8)];
    [self.ScrollView addSubview:label];
    
    self.bgView5 = [[UIView alloc] initWithFrame:CGRectMake(spaceEdgeW(10), label.lj_bottom, SCREEN_WIDTH - spaceEdgeW(20), spaceEdgeH(140))];
    self.bgView5.backgroundColor = [UIColor whiteColor];
    [self.ScrollView addSubview:self.bgView5];
    
    CGFloat x = spaceEdgeW(10);
    CGFloat y = spaceEdgeH(10);
    CGFloat w = spaceEdgeW(80);
    CGFloat h = spaceEdgeW(90);
    for (int  i = 0; i < 4; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x + i* w + i * spaceEdgeW(5), y, w, h)];
        imageView.backgroundColor = LJRandomColor;
        [self.bgView5 addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imageView.lj_x, imageView.lj_bottom + spaceEdgeH(8), imageView.lj_width, spaceEdgeH(15))];
        label.textColor = LJFontColor39;
        label.font = LJFontSize14;
        label.text = @"包装运输";
        label.textAlignment = NSTextAlignmentCenter;
        [self.bgView5 addSubview:label];
    }
}

#pragma mark --商品规格
- (void)addBgView6 {
    UILabel *label = [self addForString:@"商品规格" location:self.bgView5.lj_bottom + spaceEdgeH(8)];
    [self.ScrollView addSubview:label];
    self.bgView6 = [[UIView alloc] initWithFrame:CGRectMake(spaceEdgeW(10), label.lj_bottom, SCREEN_WIDTH - spaceEdgeW(20), spaceEdgeH(117))];
    self.bgView6.backgroundColor = [UIColor whiteColor];
    [self.ScrollView addSubview:self.bgView6];
    
    self.goodsNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), spaceEdgeH(10), self.bgView6.lj_width - spaceEdgeW(20), spaceEdgeH(18))];
    self.goodsNumLabel.textColor = LJFontColor4c;
    self.goodsNumLabel.font = LJFontSize18;
    self.goodsNumLabel.text = @"商品编号:3242384";
    [self.bgView6 addSubview:self.goodsNumLabel];
    
    self.wayLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.goodsNumLabel.lj_bottom + spaceEdgeH(10), self.bgView6.lj_width - spaceEdgeW(20), spaceEdgeH(18))];
    self.wayLabel.textColor = LJFontColor4c;
    self.wayLabel.font = LJFontSize18;
    self.wayLabel.text = @"储存方式:通风、阴凉";
    [self.bgView6 addSubview:self.wayLabel];
    
    self.soldWayLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.wayLabel.lj_bottom + spaceEdgeH(10), self.bgView6.lj_width - spaceEdgeW(20), spaceEdgeH(18))];
    self.soldWayLabel.textColor = LJFontColor4c;
    self.soldWayLabel.font = LJFontSize18;
    self.soldWayLabel.text = @"售卖方式:散装称重";
    [self.bgView6 addSubview:self.soldWayLabel];
    
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.soldWayLabel.lj_bottom + spaceEdgeH(10), self.bgView6.lj_width - spaceEdgeW(20), spaceEdgeH(18))];
    self.timeLabel.textColor = LJFontColor4c;
    self.timeLabel.font = LJFontSize18;
    self.timeLabel.text = @"保质期:30天";
    [self.bgView6 addSubview:self.timeLabel];
    
    
    /*** 证书展示 ***/
    self.certificateView = [[UIImageView alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.bgView6.lj_bottom + spaceEdgeH(10), self.bgView6.lj_width ,spaceEdgeH(140))];
    self.certificateView.backgroundColor = LJRandomColor;
    [self.ScrollView addSubview:self.certificateView];
}

#pragma mark --标识
- (UILabel *)addForString:(NSString *)string location:(CGFloat)y {
    UILabel *Label = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(-15), y, spaceEdgeW(120), spaceEdgeH(30))];
    Label.backgroundColor = LJTheMeColor;
    Label.text = string;
    Label.textAlignment = NSTextAlignmentCenter;
    Label.textColor = [UIColor whiteColor];
    Label.font = LJFontSize18;
    [Label setLayerWithCr:spaceEdgeH(15)];
    return Label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
