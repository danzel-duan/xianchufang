//
//  LJUserHeaderTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 15/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJUserHeaderTableViewCell.h"

@implementation LJUserHeaderTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.TextLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 34, 40, 20)];
        self.TextLabel.text = @"头像";
        [self.TextLabel setFont:LJFontSize];
        [self.TextLabel setTextColor:LJFontColor];
        [self.contentView addSubview:self.TextLabel];
        
        self.ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 16, 50, 50)];
        self.ImageView.lj_x = SCREEN_WIDTH -65;
        [self.ImageView setLayerWithCr:25];
        self.ImageView.backgroundColor = LJRandomColor;
        self.ImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClickBlock:)];
        [self.ImageView addGestureRecognizer:tap];
        [self.contentView addSubview:self.ImageView];
    }
    return self;
}
#pragma mark --点击imageView
- (void)imageViewClickBlock:(UITapGestureRecognizer *)tap {
    if (self.imageViewblock) {
        self.imageViewblock();
    }
}

@end
