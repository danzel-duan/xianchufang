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
        self.backgroundColor = LJCommonBgColor;
    }
    return self;
}


#pragma mark --数据传值
- (void)setGoodsDataModel:(LJGoodsModel *)goodsDataModel {
    _goodsDataModel = goodsDataModel;
    self.goodsNameLabel.text = goodsDataModel.goodsName;
    self.goodsWeightLabel.text = [NSString stringWithFormat:@"重量:%@kg",goodsDataModel.goodsWeight];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"￥%@/500g",goodsDataModel.goodsPrice]];
    [attribute addAttributes:@{NSForegroundColorAttributeName :LJFontColor61,NSFontAttributeName:LJFontSize15} range:NSMakeRange(0, goodsDataModel.goodsPrice.length + 1)];
    [attribute addAttributes:@{NSForegroundColorAttributeName :LJFontColor61,NSFontAttributeName:LJFontSize12} range:NSMakeRange(goodsDataModel.goodsPrice.length + 1, 5)];
    self.goodsPriceLabel.attributedText = attribute;
    self.allGoodsPriceLabel.text = [NSString stringWithFormat:@"￥%.1f",[goodsDataModel.goodsPrice floatValue] * [goodsDataModel.goodsWeight floatValue]];
}

#pragma mark --设置子控件
- (void)setChildrenFrame {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, spaceEdgeH(95))];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgView];
    //商品图片
    self.goodsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(spaceEdgeW(11), spaceEdgeH(10), spaceEdgeW(75), spaceEdgeH(75))];
    self.goodsImageView.backgroundColor = LJRandomColor;
    [self.contentView addSubview:self.goodsImageView];
    
    self.goodsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsImageView.lj_right + spaceEdgeW(16) ,spaceEdgeH(13), self.contentView.lj_width * 2 / 3, spaceEdgeH(10))];
    [self.goodsNameLabel setFont:LJFontSize15];
    [self.goodsNameLabel setTextColor:LJFontColor39];
    [self.contentView addSubview:self.goodsNameLabel];
    
    self.goodsWeightLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsImageView.lj_right + spaceEdgeW(16) ,self.goodsNameLabel.lj_bottom + spaceEdgeH(18), self.contentView.lj_width * 2 / 3, spaceEdgeH(12))];
    [self.goodsWeightLabel setFont:LJFontSize15];
    [self.goodsWeightLabel setTextColor:LJFontColor61];
    [self.contentView addSubview:self.goodsWeightLabel];
    
    self.goodsPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsImageView.lj_right + spaceEdgeW(16) ,self.goodsWeightLabel.lj_bottom + spaceEdgeH(14), self.contentView.lj_width * 2 / 3, spaceEdgeH(20))];
    [self.contentView addSubview:self.goodsPriceLabel];
    
    self.allGoodsPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(120), self.goodsNameLabel.lj_y, spaceEdgeW(108), 20)];
    [self.allGoodsPriceLabel setFont:LJFontSize16];
    [self.allGoodsPriceLabel setTextColor:LJFontColor39];
    self.allGoodsPriceLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.allGoodsPriceLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
