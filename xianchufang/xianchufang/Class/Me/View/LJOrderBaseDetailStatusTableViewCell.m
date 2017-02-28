//
//  LJOrderBaseDetailStatusTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 28/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.

//   LJOrderBaseDetailViewController 我的里面订单详情中的第一个cell

#import "LJOrderBaseDetailStatusTableViewCell.h"

@implementation LJOrderBaseDetailStatusTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = LJCommonBgColor;
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.lj_width, spaceEdgeH(78))];
        bgView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:bgView];
        
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(spaceEdgeW(11), 0, spaceEdgeW(18), spaceEdgeH(18))];
        icon.lj_centerY = spaceEdgeH(80) / 2;
        icon.image = [UIImage imageNamed:@"order_delivery_icon_selected"];
        [bgView addSubview:icon];
        
        self.statusContent = [[UILabel alloc] initWithFrame:CGRectMake(icon.lj_right + spaceEdgeW(16), spaceEdgeH(14), spaceEdgeW(290), spaceEdgeH(16))];
        self.statusContent.text =  @"【上海市】江桥总仓正在分拣，商务租商务租车发送客户手中";
        self.statusContent.numberOfLines = 2;
        [self.statusContent sizeToFit];
        [self.statusContent setFont:LJFontSize15];
        [self.statusContent setTextColor:LJTheMeColor];
        [bgView addSubview:self.statusContent];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(icon.lj_right + spaceEdgeW(16), self.statusContent.lj_bottom , spaceEdgeH(200), spaceEdgeH(15))];
        [self.timeLabel setFont:LJFontSize12];
        [self.timeLabel setTextColor:LJFontColor88];
        self.timeLabel.text = @"2017-2-28 17:30";
        [bgView addSubview:self.timeLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
