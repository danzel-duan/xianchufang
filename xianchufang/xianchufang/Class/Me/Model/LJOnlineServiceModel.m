//
//  LJOnlineServiceModel.m
//  xianchufang
//
//  Created by zhenglong duan on 26/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJOnlineServiceModel.h"

@implementation LJOnlineServiceModel
- (CGFloat)cellHight {
    if (!_cellHight) {
        CGRect rect = [self.msg boundingRectWithSize:CGSizeMake(spaceEdgeW(250), CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:LJFontSize15} context:nil];
        _cellHight = rect.size.height + 45;
    }
    return _cellHight;
}
@end
