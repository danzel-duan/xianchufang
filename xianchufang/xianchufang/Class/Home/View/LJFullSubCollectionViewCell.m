//
//  LJFullSubCollectionViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJFullSubCollectionViewCell.h"
@interface LJFullSubCollectionViewCell ()
/*** 标题 ***/
@property (nonatomic,strong) UILabel *titleNameLabel;
/*** 小标题 ***/
@property (nonatomic,strong) UILabel *subTitleLabel;
/*** 图片 ***/
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation LJFullSubCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), spaceEdgeH(10), spaceEdgeW(100), spaceEdgeH(20))];
        self.titleNameLabel.textColor = LJFontColor39;
        self.titleNameLabel.font = LJFontSize16;
        self.titleNameLabel.text = @"小店特供";
        [self.contentView addSubview:self.titleNameLabel];
        
        self.subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), self.titleNameLabel.lj_bottom + spaceEdgeH(5), spaceEdgeW(100), spaceEdgeH(15))];
        self.subTitleLabel.font = LJFontSize14;
        self.subTitleLabel.attributedText = [ self attrstr:@"满199元减66" dic1:@{NSForegroundColorAttributeName:LJFontColorc3} dic2:@{NSForegroundColorAttributeName:LJFontColored} loc1:0 len1:6 loc2:6 len2:2];
        [self.contentView addSubview:self.subTitleLabel];
        
        self.imageView = [[UIImageView alloc] init];
        self.imageView.backgroundColor = LJRandomColor;
        [self.contentView addSubview:self.imageView];
        
        if (self.contentView.lj_width == spaceEdgeW(125)) {
            self.imageView.frame = CGRectMake(0, self.subTitleLabel.lj_bottom +spaceEdgeH(10), spaceEdgeW(125), spaceEdgeH(90));
        }else{
            self.imageView.frame = CGRectMake(self.contentView.lj_width - spaceEdgeW(170), self.subTitleLabel.lj_bottom +spaceEdgeH(10), spaceEdgeW(170), spaceEdgeH(90));
        }
        self.contentView.layer.borderWidth = 0.5f;
        self.contentView.layer.borderColor = LJCutLineColor.CGColor;
    }
    return self;
}

#pragma mark --富文本
- (NSMutableAttributedString *)attrstr:(NSString *)str dic1:(NSDictionary *)dic1 dic2:(NSDictionary *)dic2  loc1:(NSUInteger)loc1 len1:(NSUInteger)len1 loc2:(NSUInteger)loc2 len2:(NSUInteger)len2 {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:str];
    [attr addAttributes:dic1 range:NSMakeRange(loc1, len1)];
    [attr addAttributes:dic2 range:NSMakeRange(loc2, len2)];
    return attr;
}
@end
