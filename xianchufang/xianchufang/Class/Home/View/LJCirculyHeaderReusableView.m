//
//  LJCirculyHeaderReusableView.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJCirculyHeaderReusableView.h"

@implementation LJCirculyHeaderReusableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = LJRandomColor;
    }
    return self;
}
@end
