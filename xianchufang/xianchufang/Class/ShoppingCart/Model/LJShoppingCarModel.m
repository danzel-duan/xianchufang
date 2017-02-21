//
//  LJShoppingCarModel.m
//  xianchufang
//
//  Created by zhenglong duan on 20/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJShoppingCarModel.h"

@implementation LJShoppingCarModel

- (CGFloat)cellHegiht {
    if (_cellHegiht) return _cellHegiht;
    
    if ([self.postAge isEqualToString:@""]) { //满减为空，说明无满减活动
        _cellHegiht = 130;
    }else{
        _cellHegiht = 170;
    }
    return _cellHegiht;
}
@end
