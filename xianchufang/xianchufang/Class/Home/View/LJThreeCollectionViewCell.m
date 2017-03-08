//
//  LJThreeCollectionViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJThreeCollectionViewCell.h"

@implementation LJThreeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.lj_width, self.contentView.lj_height)];
        self.imageView.backgroundColor = LJRandomColor;
        self.imageView.image = [UIImage imageNamed:@""];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}
@end
