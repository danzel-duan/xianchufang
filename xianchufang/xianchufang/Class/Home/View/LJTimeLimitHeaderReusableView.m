//
//  LJTimeLimitHeaderReusableView.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJTimeLimitHeaderReusableView.h"

@implementation LJTimeLimitHeaderReusableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = LJCutLineColor;
        //时间显示
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, spaceEdgeH(10.5), SCREEN_WIDTH / 2, spaceEdgeH(20))];
        timeLabel.lj_centerX = SCREEN_WIDTH / 2 + spaceEdgeW(25);
        timeLabel.font = LJFontSize16;
        timeLabel.textAlignment = NSTextAlignmentLeft;
        timeLabel.text = @"限时秒杀 18:32:04";
        [self addSubview:timeLabel];
        //时钟图像
        UIImageView *timeImageView = [[UIImageView alloc] initWithFrame:CGRectMake( timeLabel.lj_x - spaceEdgeW(25), 0, spaceEdgeW(15), spaceEdgeW(15))];
        timeImageView.lj_centerY = timeLabel.lj_centerY;
        timeImageView.image = [UIImage imageNamed:@"home_xianshi_icon"];
        [self addSubview:timeImageView];
    }
    return self;
}
@end
