//
//  LJProgressBar.m
//  xianchufang
//
//  Created by zhenglong duan on 09/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJProgressBar.h"
@interface LJProgressBar ()
/*** 加载进度 ***/
@property (nonatomic,strong) UILabel *loadingLabel;
/*** 加载进度文字提示 ***/
@property (nonatomic,strong) UILabel *tipLabel;
@end

@implementation LJProgressBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *bgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.lj_width - spaceEdgeW(40), self.lj_height)];
        bgLabel.backgroundColor = [LJFontColored colorWithAlphaComponent:0.5];
        bgLabel.layer.cornerRadius = spaceEdgeH(5);
        bgLabel.layer.masksToBounds = YES;
        bgLabel.layer.borderColor = LJFontColored.CGColor;
        bgLabel.layer.borderWidth = 0.5f;
        [self addSubview:bgLabel];
        
        UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.lj_width - spaceEdgeW(40), self.lj_height)];
        loadingLabel.backgroundColor = LJFontColored;
        loadingLabel.layer.cornerRadius = spaceEdgeH(5);
        loadingLabel.layer.masksToBounds = YES;
        [bgLabel addSubview:loadingLabel];
        self.loadingLabel = loadingLabel;
        
        self.tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.lj_width - spaceEdgeW(40), 0, spaceEdgeW(40), self.lj_height)];
        self.tipLabel.textColor = LJFontColored;
        self.tipLabel.textAlignment = NSTextAlignmentCenter;
        self.tipLabel.font = LJFontSize12;
        [self addSubview:self.tipLabel];
    }
    return self;
}

- (void)setValueTotalNum:(CGFloat)totalNum surplusNum:(CGFloat)surplusNum {
    self.tipLabel.text = [NSString stringWithFormat:@"%.0f%%",surplusNum / totalNum * 100];
    self.loadingLabel.lj_width = (self.lj_width - spaceEdgeW(40)) * (surplusNum / totalNum);
}

@end
