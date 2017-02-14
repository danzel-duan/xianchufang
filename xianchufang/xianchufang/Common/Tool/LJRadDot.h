//
//  LJRadDot.h    ########   用于消息通知  #######
//  xianchufang
//
//  Created by zhenglong duan on 14/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJRadDot : NSObject
/*** 显示小红点 ***/
- (void)showRadDotOnObject:(id)object text:(NSString *)text ;
/*** 隐藏小红点 ***/
- (void)hideRadDotOnObject:(id)object;
/*** 是否拖拽 ***/
@property BOOL drag;
@property (nonatomic,strong) UIButton *btn;

@end
