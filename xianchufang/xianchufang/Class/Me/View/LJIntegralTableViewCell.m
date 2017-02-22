//
//  LJIntegralTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 22/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJIntegralTableViewCell.h"

@implementation LJIntegralTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.goodsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(11, spaceEdgeH(7), spaceEdgeW(65), spaceEdgeH(65))];
        self.goodsImageView.backgroundColor = LJRandomColor;
        [self.contentView addSubview:self.goodsImageView];
        
        self.goodsNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsImageView.lj_right + spaceEdgeW(10), spaceEdgeH(7), 0, spaceEdgeH(15))];
        [self.goodsNameLabel setFont:LJFontSize15];
        [self.goodsNameLabel setTextColor:LJFontColor61];
        self.goodsNameLabel.text = @"鲜厨坊 大樱桃";
        [self.goodsNameLabel sizeToFit];
        [self.contentView addSubview:self.goodsNameLabel];
        
        self.tipIntegralBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.goodsImageView.lj_right + spaceEdgeW(10), self.goodsNameLabel.lj_bottom + spaceEdgeH(24), spaceEdgeW(75), spaceEdgeH(22))];
        [self.tipIntegralBtn setTitle:@"购物送积分" forState:UIControlStateNormal];
        [self.tipIntegralBtn.titleLabel setFont:LJFontSize12];
        [self.tipIntegralBtn setTitleColor:LJFontColorc3 forState:UIControlStateNormal];
        self.tipIntegralBtn.layer.borderColor = LJFontColorc3.CGColor;
        self.tipIntegralBtn.layer.borderWidth = 0.5;
        [self.contentView addSubview:self.tipIntegralBtn];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(100), spaceEdgeH(8), spaceEdgeW(89), spaceEdgeH(12))];
        [self.timeLabel setFont:LJFontSize12];
        [self.timeLabel setTextColor:LJFontColor88];
        self.timeLabel.textAlignment = NSTextAlignmentRight;
        self.timeLabel.text = @"2017/2/22";
        [self.contentView addSubview:self.timeLabel];
        
        self.integralLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(100), self.timeLabel.lj_bottom + spaceEdgeH(38), spaceEdgeW(89), spaceEdgeH(12))];
        [self.integralLabel setTextColor:LJFontColored];
        [self.integralLabel setFont:LJFontSize12];
        self.integralLabel.textAlignment = NSTextAlignmentRight;
        self.integralLabel.text = @"-233";
        [self.contentView addSubview: self.integralLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
