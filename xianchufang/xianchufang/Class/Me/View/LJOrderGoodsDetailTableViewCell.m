//
//  LJOrderGoodsDetailTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 21/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJOrderGoodsDetailTableViewCell.h"

@implementation LJOrderGoodsDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setChildrenFrame];
    }
    return self;
}

#pragma mark --设置子控件
- (void)setChildrenFrame {
    self.goodsPrice = @"8.90";
    self.goodsName = @"农家品质大樱桃";
    self.goodsWeight = @"130";
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 95)];
    bgView.backgroundColor = LJCommonBgColor;
    [self.contentView addSubview:bgView];
    //商品图片
    self.goodsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(11, 10, 75, 75)];
    self.goodsImageView.backgroundColor = LJRandomColor;
    [self.contentView addSubview:self.goodsImageView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsImageView.lj_right + 16 ,13, self.contentView.lj_width * 2 / 3, 10)];
    [nameLabel setFont:LJFontSize15];
    [nameLabel setTextColor:LJFontColor39];
    nameLabel.text = self.goodsName;
    [self.contentView addSubview:nameLabel];
    
    UILabel *WeightLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsImageView.lj_right + 16 ,nameLabel.lj_bottom + 18, self.contentView.lj_width * 2 / 3, 10)];
    [WeightLabel setFont:LJFontSize15];
    [WeightLabel setTextColor:LJFontColor61];
    WeightLabel.text = [NSString stringWithFormat:@"重量:%@kg",self.goodsWeight];
    [self.contentView addSubview:WeightLabel];
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsImageView.lj_right + 16 ,WeightLabel.lj_bottom + 14, self.contentView.lj_width * 2 / 3, 20)];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"￥%@/kg",self.goodsPrice]];
    [attribute addAttributes:@{NSForegroundColorAttributeName :LJFontColor61,NSFontAttributeName:LJFontSize15} range:NSMakeRange(0, self.goodsPrice.length + 1)];
    [attribute addAttributes:@{NSForegroundColorAttributeName :LJFontColor61,NSFontAttributeName:LJFontSize12} range:NSMakeRange(self.goodsPrice.length + 1, 3)];
    priceLabel.attributedText = attribute;
    [self.contentView addSubview:priceLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
