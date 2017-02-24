//
//  LJOrderModel.m
//  xianchufang
//
//  Created by zhenglong duan on 23/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJOrderModel.h"

@implementation LJOrderModel

- (CGFloat )cellHeight {
    if (!self.isExpand) {
        if (self.goodsArray.count > 3) {
            _cellHeight = 3 * spaceEdgeH(97) + spaceEdgeH(120);
        }else{
            _cellHeight = self.goodsArray.count * spaceEdgeH(97) + spaceEdgeH(120);
        }
    }else{
        _cellHeight = self.goodsArray.count * spaceEdgeH(97) + spaceEdgeH(120);
    }
    return _cellHeight;
}

- (CGFloat)cellBgHeight {
    _cellBgHeight = self.cellHeight - 8;
    return _cellBgHeight;
}

- (CGFloat)cellTableViewHeight {
    if (!self.isExpand) {   //没展开分两种情况，一种是大于3的，另一种是小于3的，小于3的按数组长度算
        if (self.goodsArray.count > 3) {
            _cellTableViewHeight = 3 * spaceEdgeH(97);
        }else{
            _cellTableViewHeight = self.goodsArray.count * spaceEdgeH(97);
        }
    }else{
       _cellTableViewHeight = self.goodsArray.count * spaceEdgeH(97);
    }
    return _cellTableViewHeight;
}

@end
