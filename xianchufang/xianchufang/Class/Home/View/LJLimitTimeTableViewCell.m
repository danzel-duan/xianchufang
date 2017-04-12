//
//  LJLimitTimeTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 09/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJLimitTimeTableViewCell.h"
#import "LJProgressBar.h"

@implementation LJLimitTimeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.goodsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(spaceEdgeW(10), 0, spaceEdgeW(100), spaceEdgeW(100))];
        self.goodsImageView.lj_centerY = spaceEdgeH(110) / 2;
        self.goodsImageView.backgroundColor = LJRandomColor;
        [self.contentView addSubview:self.goodsImageView];
        
        //限量字
        UILabel *limitFontLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, spaceEdgeW(30), spaceEdgeH(20))];
        limitFontLabel.textColor = LJFontColored;
        limitFontLabel.font = LJFontSize12;
        limitFontLabel.text = @"限量";
        limitFontLabel.textAlignment = NSTextAlignmentCenter;
        limitFontLabel.layer.borderColor = LJFontColored.CGColor;
        limitFontLabel.layer.borderWidth = 0.5f;
        [self.goodsImageView addSubview:limitFontLabel];
        
        //商品名称
        self.goodsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsImageView.lj_right + spaceEdgeW(10), spaceEdgeH(8), SCREEN_WIDTH *2/3, spaceEdgeH(20))];
        self.goodsNameLabel.font = LJFontSize18;
        self.goodsNameLabel.textColor = LJFontColor26;
        self.goodsNameLabel.text = @"山东萝卜";
        [self.contentView addSubview:self.goodsNameLabel];
        
        self.currentPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsNameLabel.lj_x, self.goodsNameLabel.lj_bottom + spaceEdgeH(10), SCREEN_WIDTH *2/3, spaceEdgeH(19))];
        [self.contentView addSubview:self.currentPriceLabel];
        self.currentPriceLabel.attributedText = [NSString attrstr:@"￥2.90/500g" dic1:@{NSForegroundColorAttributeName:LJFontColored,NSFontAttributeName:LJFontSize18} dic2:@{NSForegroundColorAttributeName:LJFontColor4c,NSFontAttributeName:LJFontSize14} len1:5 loc2:5 len2:5];
        
        self.marketPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsNameLabel.lj_x, self.currentPriceLabel.lj_bottom + spaceEdgeH(6), SCREEN_WIDTH *2/3, spaceEdgeH(19))];
        [self.contentView addSubview:self.marketPriceLabel];
        self.marketPriceLabel.attributedText = [NSString attrstr:@"￥3.90/500g" dic1:@{NSForegroundColorAttributeName:LJFontColor4c,NSFontAttributeName:LJFontSize16} dic2:@{NSForegroundColorAttributeName:LJFontColor88,NSFontAttributeName:LJFontSize14} len1:5 loc2:5 len2:5];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.marketPriceLabel.lj_width  / 3, 1)];
        line.lj_centerY = self.marketPriceLabel.lj_height / 2;
        line.backgroundColor = [UIColor blackColor];
        [self.marketPriceLabel addSubview:line];
        
        //进度条
        LJProgressBar *progressBar = [[LJProgressBar alloc] initWithFrame:CGRectMake(self.goodsNameLabel.lj_x, self.marketPriceLabel.lj_bottom + spaceEdgeH(8), spaceEdgeW(150), spaceEdgeH(10))];
        [progressBar setValueTotalNum:60 surplusNum:40];
        [self.contentView addSubview:progressBar];
        
        //购物车
        UIButton *shoppingCarBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(42), self.marketPriceLabel.lj_y, spaceEdgeW(32), spaceEdgeW(32))];
        [shoppingCarBtn setImage:[UIImage imageNamed:@"home_shoppingcar_icon"] forState:UIControlStateNormal];
        [shoppingCarBtn addTarget:self action:@selector(addShoppingCar) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:shoppingCarBtn];
        
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, spaceEdgeH(109), SCREEN_WIDTH, 1)];
        line1.backgroundColor = LJCutLineColor;
        [self.contentView addSubview:line1];
    }
    return self;
}

#pragma mark --加入购物车事件
- (void)addShoppingCar {
    LJLog(@"已经加入购物车！");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end


