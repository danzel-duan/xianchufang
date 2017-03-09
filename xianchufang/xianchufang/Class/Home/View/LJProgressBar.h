//
//  LJProgressBar.h
//  xianchufang
//
//  Created by zhenglong duan on 09/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJProgressBar : UIView
/*** 总量 ***/
@property (nonatomic,assign) CGFloat totalNum;
/*** 剩余量 ***/
@property (nonatomic,assign) CGFloat surplusNum;
- (void)setValueTotalNum:(CGFloat)totalNum surplusNum:(CGFloat)surplusNum;
@end
