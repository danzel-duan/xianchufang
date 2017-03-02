//
//  LJGoodsCommentTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 02/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJGoodsCommentTableViewCell.h"

@implementation LJGoodsCommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //1.头像
        self.userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(spaceEdgeW(10), spaceEdgeH(10), spaceEdgeW(30), spaceEdgeH(30))];
        [self.userImageView setLayerWithCr:spaceEdgeH(15)];
        self.userImageView.backgroundColor = LJRandomColor;
        [self.contentView addSubview:self.userImageView];
        //2.名字
        self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.userImageView.lj_right +spaceEdgeW(5), 0, spaceEdgeW(120), spaceEdgeH(15))];
        self.userNameLabel.lj_centerY = self.userImageView.lj_centerY;
        [self.userNameLabel setFont:LJFontSize14];
        [self.userNameLabel setTextColor:LJFontColor26];
        self.userNameLabel.text = @"吃豆豆";
        [self.contentView addSubview:self.userNameLabel];
        //3.内容
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.userImageView.lj_bottom + spaceEdgeH(10), SCREEN_WIDTH - spaceEdgeW(15), 0)];
        [self.contentLabel setTextColor:LJFontColor39];
        [self.contentLabel setFont:LJFontSize14];
        self.contentLabel.text = @"百蠚 早班；呀一；暧昧不明顺； 啡；吴昕一晚上的人theq皮脂膜一睦；晓成埯静雅晓鹏压死； 路易斯量";
        self.contentLabel.numberOfLines = 0;
        [self.contentLabel sizeToFit];
        [self.contentView addSubview:self.contentLabel];
        //4.图片
        CGFloat picW = spaceEdgeW(65);
        CGFloat picH = picW;
        for (int i = 0; i < 4; i++) {
            UIImageView *pic = [[UIImageView alloc] initWithFrame:CGRectMake(spaceEdgeW(10) * (i + 1) + picW * i, self.contentLabel.lj_bottom + spaceEdgeH(8), picW, picH)];
            pic.backgroundColor = LJRandomColor;
            [self.contentView addSubview:pic];
        }
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
