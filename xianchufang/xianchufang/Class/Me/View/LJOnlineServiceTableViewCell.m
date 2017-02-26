//
//  LJOnlineServiceTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 26/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJOnlineServiceTableViewCell.h"

@implementation LJOnlineServiceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.headerImageView = [[UIImageView alloc] init];
        self.headerImageView.layer.cornerRadius = spaceEdgeW(50) / 2;
        self.headerImageView.layer.masksToBounds = YES;
        self.headerImageView.backgroundColor = LJRandomColor;
        [self.contentView addSubview:self.headerImageView];
        
        self.bubble = [[UIImageView alloc] init];
        [self.contentView addSubview:self.bubble];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.numberOfLines = 0;
        [self.contentLabel setFont:LJFontSize15];
        [self.bubble addSubview:self.contentLabel];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH / 2, spaceEdgeH(15))];
        self.timeLabel.lj_centerX = SCREEN_WIDTH / 2;
        self.timeLabel.lj_centerY = self.contentView.lj_height / 2;
        [self.timeLabel setFont:LJFontSize12];
        [self.timeLabel setTextColor:LJFontColor88];
        self.timeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.timeLabel];
    }
    self.backgroundColor = [UIColor clearColor];
    return self;
}

- (void)setOnlineSericeModel:(LJOnlineServiceModel *)onlineSericeModel {
    _onlineSericeModel = onlineSericeModel;
    CGRect rect = [onlineSericeModel.msg boundingRectWithSize:CGSizeMake(spaceEdgeW(250), CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:LJFontSize15} context:nil];
    //气泡
    UIImage *bubbleImage = nil;
    //头像
//    UIImage *headerImage = nil;
    if (onlineSericeModel.isRight) {   //右边
        self.headerImageView.frame = CGRectMake(SCREEN_WIDTH - spaceEdgeW(62), 10, spaceEdgeW(50), spaceEdgeH(50));
        self.bubble.frame = CGRectMake(SCREEN_WIDTH - rect.size.width - spaceEdgeW(95), spaceEdgeH(20), spaceEdgeW(30 )+ rect.size.width,  rect.size.height + spaceEdgeH( 10));
        bubbleImage = [UIImage imageNamed:@"my_tall_icon.9"];
    }
    bubbleImage = [bubbleImage stretchableImageWithLeftCapWidth:bubbleImage.size.width / 2 topCapHeight:bubbleImage.size.height /2 ];
    self.bubble.image = bubbleImage;
    //文本内容
    self.contentLabel.frame = CGRectMake(5, 5, rect.size.width, rect.size.height);
    self.contentLabel.text = onlineSericeModel.msg;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
