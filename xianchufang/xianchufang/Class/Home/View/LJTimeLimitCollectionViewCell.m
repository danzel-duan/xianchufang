//
//  LJTimeLimitCollectionViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJTimeLimitCollectionViewCell.h"
@interface LJTimeLimitCollectionViewCell ()
/*** 名称 ***/
@property (nonatomic,strong) UILabel *nameLabel;
/*** 图片 ***/
@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation LJTimeLimitCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *limit = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(2), spaceEdgeH(4), spaceEdgeW(17), spaceEdgeW(17))];
        limit.backgroundColor = [UIColor orangeColor];
        limit.font = LJFontSize12;
        limit.textColor = [UIColor whiteColor];
        limit.text = @"限";
        limit.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:limit];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(limit.lj_right, limit.lj_y, self.contentView.lj_width - spaceEdgeW(21), spaceEdgeW(17))];
        self.nameLabel.textColor = LJFontColor39;
        self.nameLabel.font = LJFontSize16;
        self.nameLabel.layer.borderColor = [UIColor orangeColor].CGColor;
        self.nameLabel.layer.borderWidth = 0.5f;
        self.nameLabel.text = @"蒸菜瓜果";
        [self.contentView addSubview:self.nameLabel];
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.nameLabel.lj_bottom + spaceEdgeH(5), self.contentView.lj_width, self.contentView.lj_height - spaceEdgeW(17) - spaceEdgeH(9))];
        self.imageView.backgroundColor = LJRandomColor;
        [self.contentView addSubview:self.imageView];
        
        self.contentView.layer.borderWidth = 0.5f;
        self.contentView.layer.borderColor = [UIColor orangeColor].CGColor;
        [self.contentView setLayerWithCr:2];
    }
    return self;
}
@end
