//
//  LJVarietyCategoryCollectionViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 06/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJVarietyCategoryCollectionViewCell.h"

@implementation LJVarietyCategoryCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(spaceEdgeW(5), spaceEdgeH(5), spaceEdgeW(170), spaceEdgeH(180))];
        self.imageView.backgroundColor = LJRandomColor;
        [self.contentView addSubview:self.imageView];
        
        self.goodsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.imageView.lj_bottom + spaceEdgeH(10), self.contentView.lj_width * 2 /3, spaceEdgeH(17))];
        [self.goodsNameLabel setTextColor:LJFontColor39];
        [self.goodsNameLabel setFont:LJFontSize15];
        self.goodsNameLabel.text = @"策划师白菜";
        [self.contentView addSubview:self.goodsNameLabel];
        
        self.goodsPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.goodsNameLabel.lj_bottom + spaceEdgeH(6), self.contentView.lj_width * 2 /3, spaceEdgeH(20))];
        self.goodsPriceLabel.attributedText = [self attrstr:@"￥1.99/500g" dic1:@{NSForegroundColorAttributeName:LJFontColored,NSFontAttributeName:LJFontSize16} dic2:@{NSForegroundColorAttributeName:LJFontColored,NSFontAttributeName:LJFontSize12} loc1:0 len1:5 loc2:5 len2:5];
        [self.contentView addSubview:self.goodsPriceLabel];
        
        self.shoppingCarBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.lj_width - spaceEdgeW(40), self.imageView.lj_bottom + spaceEdgeH(15), spaceEdgeW(30), spaceEdgeH(30))];
        [self.shoppingCarBtn addTarget:self action:@selector(addShoppingCar) forControlEvents:UIControlEventTouchUpInside];
        [self.shoppingCarBtn setImage:[UIImage imageNamed:@"home_shoppingcar_icon"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.shoppingCarBtn];
        
        self.contentView.layer.borderWidth = 0.5f;
        self.contentView.layer.borderColor = LJCutLineColor.CGColor;
    }
    return self;
}

/*** 是否是满减标识 ***/
- (void)setIsFullIdentify:(BOOL)isFullIdentify {
    _isFullIdentify = isFullIdentify;
    if (_isFullIdentify) {
        //满减标识
        UILabel *fullLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(15), 0, spaceEdgeW(20), spaceEdgeH(40))];
        fullLabel.backgroundColor = LJFontColored;
        fullLabel.textColor = [UIColor whiteColor];
        fullLabel.font = LJFontSize12;
        fullLabel.text = @"满减";
        fullLabel.textAlignment = NSTextAlignmentCenter;
        fullLabel.numberOfLines = 2;
        [self.imageView addSubview:fullLabel];
        [self setCorneradi:fullLabel];
    }
}

#pragma mark --加入购物车事件
- (void)addShoppingCar {
    LJLog(@"已加入购物车！");
}

#pragma mark --设置某几个角为圆角
- (void)setCorneradi:(UILabel *)label{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:label.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(spaceEdgeW(10), spaceEdgeW(10))];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = label.bounds;
    maskLayer.path = maskPath.CGPath;
    label.layer.mask = maskLayer;
}

#pragma mark --富文本
- (NSMutableAttributedString *)attrstr:(NSString *)str dic1:(NSDictionary *)dic1 dic2:(NSDictionary *)dic2  loc1:(NSUInteger)loc1 len1:(NSUInteger)len1 loc2:(NSUInteger)loc2 len2:(NSUInteger)len2 {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:str];
    [attr addAttributes:dic1 range:NSMakeRange(loc1, len1)];
    [attr addAttributes:dic2 range:NSMakeRange(loc2, len2)];
    return attr;
}
@end
