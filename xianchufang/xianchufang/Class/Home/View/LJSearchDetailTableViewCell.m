//
//  LJSearchDetailTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 16/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJSearchDetailTableViewCell.h"
@interface LJSearchDetailTableViewCell()
/*** 限时秒杀 ***/
@property (nonatomic,strong) UILabel *limitLabel;
/*** 满减 ***/
@property (nonatomic,strong) UILabel *fullLabel;
@end
@implementation LJSearchDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.goodsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(spaceEdgeW(5), 0, spaceEdgeW(100), spaceEdgeW(100))];
        self.goodsImageView.lj_centerY = spaceEdgeH(110) / 2;
        self.goodsImageView.backgroundColor = LJRandomColor;
        [self.contentView addSubview:self.goodsImageView];
        
        //商品名称
        self.goodsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsImageView.lj_right + spaceEdgeW(10), spaceEdgeH(5), SCREEN_WIDTH *2/3, spaceEdgeH(20))];
        self.goodsNameLabel.font = LJFontSize18;
        self.goodsNameLabel.textColor = LJFontColor26;
        self.goodsNameLabel.text = @"长梗黄心白菜";
        [self.contentView addSubview:self.goodsNameLabel];
        
        /*** 限时秒杀 ***/
        self.limitLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsNameLabel.lj_x, 0, spaceEdgeW(60), spaceEdgeH(21))];
        self.limitLabel.textColor = LJFontColorOr;
        self.limitLabel.font = LJFontSize12;
        self.limitLabel.layer.borderColor = LJFontColorOr.CGColor;
        self.limitLabel.layer.borderWidth = 0.5f;
        self.limitLabel.text = @"限时秒杀";
        self.limitLabel.textAlignment = NSTextAlignmentCenter;
//        [self.limitLabel setCorneradi:UIRectCornerTopRight | UIRectCornerBottomRight radii:spaceEdgeW(10)];
        [self.contentView addSubview:self.limitLabel];
        /*** 满减 ***/
        self.fullLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsNameLabel.lj_x, 0, spaceEdgeW(85), spaceEdgeH(21))];
        self.fullLabel.textColor = LJFontColored;
        self.fullLabel.font = LJFontSize12;
//        [self.fullLabel setCorneradi:UIRectCornerTopRight | UIRectCornerBottomRight radii:spaceEdgeW(10)];
        self.fullLabel.layer.borderColor = LJFontColored.CGColor;
        self.fullLabel.layer.borderWidth = 0.5f;
        self.fullLabel.text = @"满199免运费";
        self.fullLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.fullLabel];
        
        self.currentPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsNameLabel.lj_x, self.goodsNameLabel.lj_bottom + spaceEdgeH(60), SCREEN_WIDTH *2/3, spaceEdgeH(19))];
        [self.contentView addSubview:self.currentPriceLabel];
        self.currentPriceLabel.attributedText = [NSString attrstr:@"￥2.90/500g" dic1:@{NSForegroundColorAttributeName:LJFontColored,NSFontAttributeName:LJFontSize18} dic2:@{NSForegroundColorAttributeName:LJFontColor4c,NSFontAttributeName:LJFontSize14} len1:5 loc2:5 len2:5];
        
        //购物车
        UIButton *shoppingCarBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(42), self.currentPriceLabel.lj_y - spaceEdgeW(20), spaceEdgeW(32), spaceEdgeW(32))];
        [shoppingCarBtn setImage:[UIImage imageNamed:@"home_shoppingcar_icon"] forState:UIControlStateNormal];
        [shoppingCarBtn addTarget:self action:@selector(addShoppingCar) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:shoppingCarBtn];
        
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, spaceEdgeH(109), SCREEN_WIDTH, 0.5)];
        line1.backgroundColor = LJCutLineColor;
        [self.contentView addSubview:line1];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.isLimit) {
        self.limitLabel.hidden = NO;
        self.limitLabel.lj_y = self.goodsNameLabel.lj_bottom + spaceEdgeH(8);
    }else {
        self.limitLabel.hidden = YES;
    }
    if (self.isFull) {
        self.fullLabel.hidden = NO;
        self.fullLabel.lj_y = self.goodsNameLabel.lj_bottom + spaceEdgeH(37);
    }else {
        self.fullLabel.hidden = YES;
    }
}

#pragma mark --加入购物车事件
- (void)addShoppingCar {
    LJLog(@"已经加入购物车！");
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
