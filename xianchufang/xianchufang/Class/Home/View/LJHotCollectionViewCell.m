//
//  LJHotCollectionViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJHotCollectionViewCell.h"

@implementation LJHotCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, spaceEdgeW(123), spaceEdgeH(100))];
        self.imageView.backgroundColor = LJRandomColor;
        [self.contentView addSubview:self.imageView];
        
        self.goodsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(3), self.imageView.lj_bottom + spaceEdgeH(5), self.contentView.lj_width * 2 /3, spaceEdgeH(17))];
        [self.goodsNameLabel setTextColor:LJFontColor39];
        [self.goodsNameLabel setFont:LJFontSize14];
        self.goodsNameLabel.text = @"策划师白菜";
        [self.contentView addSubview:self.goodsNameLabel];
        
        self.goodsPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(0), self.goodsNameLabel.lj_bottom , self.contentView.lj_width * 3 /4, spaceEdgeH(20))];
        self.goodsPriceLabel.attributedText = [self attrstr:@"￥99.99/500g" dic1:@{NSForegroundColorAttributeName:LJFontColored,NSFontAttributeName:LJFontSize15} dic2:@{NSForegroundColorAttributeName:LJFontColored,NSFontAttributeName:LJFontSize12} loc1:0 len1:6 loc2:6 len2:5];
        [self.contentView addSubview:self.goodsPriceLabel];
        
        self.shoppingCarBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.lj_width - spaceEdgeW(30), self.imageView.lj_bottom + spaceEdgeH(15), spaceEdgeW(25), spaceEdgeH(25))];
        [self.shoppingCarBtn setImage:[UIImage imageNamed:@"classify_shopping-cart_icon"] forState:UIControlStateNormal];
        [self.shoppingCarBtn addTarget:self action:@selector(addShoppingCar) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.shoppingCarBtn];
        
        self.contentView.layer.borderWidth = 0.5f;
        self.contentView.layer.borderColor = LJCutLineColor.CGColor;
        [self.contentView setLayerWithCr:2];
    }
    return self;
}

#pragma mark --加入购物车事件
- (void)addShoppingCar {
    LJLog(@"已加入购物车！");
}

#pragma mark --富文本
- (NSMutableAttributedString *)attrstr:(NSString *)str dic1:(NSDictionary *)dic1 dic2:(NSDictionary *)dic2  loc1:(NSUInteger)loc1 len1:(NSUInteger)len1 loc2:(NSUInteger)loc2 len2:(NSUInteger)len2 {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:str];
    [attr addAttributes:dic1 range:NSMakeRange(loc1, len1)];
    [attr addAttributes:dic2 range:NSMakeRange(loc2, len2)];
    return attr;
}
@end
