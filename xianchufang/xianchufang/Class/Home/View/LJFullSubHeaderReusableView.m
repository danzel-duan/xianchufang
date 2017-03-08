//
//  LJFullSubHeaderReusableView.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJFullSubHeaderReusableView.h"

@implementation LJFullSubHeaderReusableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = LJCutLineColor;
        //时间显示
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, spaceEdgeH(10.5), SCREEN_WIDTH / 2, spaceEdgeH(20))];
        timeLabel.lj_centerX = SCREEN_WIDTH / 2 + spaceEdgeW(60);
        timeLabel.font = LJFontSize16;
        timeLabel.textAlignment = NSTextAlignmentLeft;
        timeLabel.text = @"满了就减";
        [self addSubview:timeLabel];
        //时钟图像
        UIImageView *timeImageView = [[UIImageView alloc] initWithFrame:CGRectMake( timeLabel.lj_x - spaceEdgeW(25), 0, spaceEdgeW(15), spaceEdgeW(15))];
        timeImageView.lj_centerY = timeLabel.lj_centerY;
        timeImageView.image = [UIImage imageNamed:@"home_manl_icon"];
        [self addSubview:timeImageView];
    }
    return self;
}
@end
