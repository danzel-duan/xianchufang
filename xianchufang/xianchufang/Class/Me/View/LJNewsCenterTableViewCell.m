//
//  LJNewsCenterTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 28/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJNewsCenterTableViewCell.h"

@implementation LJNewsCenterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.iconImageView = [[UIImageView alloc ] initWithFrame:CGRectMake(spaceEdgeW(11), spaceEdgeH(8), spaceEdgeW(59), spaceEdgeH(59))];
        self.iconImageView.backgroundColor = LJRandomColor;
        [self.iconImageView setLayerWithCr:3];
        [self.contentView addSubview:self.iconImageView];
        
        self.notificateTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.iconImageView.lj_right + spaceEdgeW(16), spaceEdgeH(12), spaceEdgeW(80), 20)];
        [self.notificateTypeLabel setFont:LJFontSize16];
        [self.notificateTypeLabel setTextColor:LJFontColor26];
        self.notificateTypeLabel.text = @"系统通知";
        [self.contentView addSubview:self.notificateTypeLabel];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(100), spaceEdgeH(7), spaceEdgeW(90), spaceEdgeH(13))];
        [self.timeLabel setTextColor:LJFontColor88];
        [self.timeLabel setFont:LJFontSize12];
        self.timeLabel.textAlignment = NSTextAlignmentRight;
        self.timeLabel.text = @"2017-2-28";
        [self.contentView addSubview:self.timeLabel];
        
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.iconImageView.lj_right + spaceEdgeW(16), self.notificateTypeLabel.lj_bottom + spaceEdgeH(12), SCREEN_WIDTH - spaceEdgeW(100), spaceEdgeH(20))];
        [self.detailLabel setFont:LJFontSize15];
        [self.detailLabel setTextColor:LJFontColor88];
        self.detailLabel.text = @"订单号：23dgjskl33353已发货，请查收";
        [self.contentView addSubview:self.detailLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
