//
//  LJCommitOrderAddressTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 28/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJCommitOrderAddressTableViewCell.h"

@implementation LJCommitOrderAddressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = LJCommonBgColor;
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, spaceEdgeH(85))];
        bgView.backgroundColor = [UIColor whiteColor];
        //给bgView边框设置阴影
        bgView.layer.shadowOffset = CGSizeMake(1,3);
        bgView.layer.shadowOpacity = 0.2;
        bgView.layer.shadowColor = [UIColor blackColor].CGColor;
        bgView.layer.masksToBounds = NO;
        [self.contentView addSubview:bgView];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(40), spaceEdgeH(15), spaceEdgeW(140), spaceEdgeH(20))];
        [self.nameLabel setFont:LJFontSize16];
        [self.nameLabel setTextColor:LJFontColor39];
        self.nameLabel.text = @"收货人：郭笑林";
        [bgView addSubview:self.nameLabel];
        
        self.phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLabel.lj_right + spaceEdgeW(29), self.nameLabel.lj_y, spaceEdgeW(110), spaceEdgeH(20))];
        [self.phoneLabel setFont:LJFontSize16];
        [self.phoneLabel setTextColor:LJFontColor39];
        self.phoneLabel.text = @"15518703027";
        [bgView addSubview:self.phoneLabel];
        
        UIImageView *addicon = [[UIImageView alloc] initWithFrame:CGRectMake(11, spaceEdgeH(42), 0, 0)];
        addicon.image = [UIImage imageNamed:@"shoppingcar_dingwei_icon"];
        [addicon sizeToFit];
        [bgView addSubview:addicon];
        
        self.addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(40), self.nameLabel.lj_bottom + spaceEdgeH(8), SCREEN_WIDTH - spaceEdgeW(60), spaceEdgeH(15))];
        [self.addressLabel setTextColor:LJFontColor4c];
        [self.addressLabel setFont:LJFontSize14];
        self.addressLabel.text = @"收货地址:上海市宝山区罗泾镇陈川新村180罗泾镇陈川新村1";
        self.addressLabel.numberOfLines = 2;
        [self.addressLabel sizeToFit];
        [bgView addSubview:self.addressLabel];
        
        UIImageView *accessicon = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 20, 0, 0, 0)];
        accessicon.lj_centerY = self.contentView.lj_height / 2;
        accessicon.image = [UIImage imageNamed:@"my_go_icon"];
        [accessicon sizeToFit];
        [bgView addSubview:accessicon];
        self.access = accessicon;
        
        UIImageView *bottomimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, addicon.lj_bottom + spaceEdgeH(20), SCREEN_WIDTH, spaceEdgeH(5))];
        bottomimage.image = [UIImage imageNamed:@"shoppingcar_caitiao_icon"];
        [bgView addSubview:bottomimage];
        self.bottomimage = bottomimage;
    }
    return self;
}

-(void)setIsAccess:(BOOL)isAccess {
    _isAccess = isAccess;
    if (_isAccess == NO) {
        [self.access removeFromSuperview];
        [self.bottomimage removeFromSuperview];
        self.phoneLabel.lj_x = SCREEN_WIDTH - spaceEdgeW(122);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
