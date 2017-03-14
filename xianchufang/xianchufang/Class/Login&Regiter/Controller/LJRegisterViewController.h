//
//  LJRegisterViewController.h
//  xianchufang
//
//  Created by zhenglong duan on 14/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJBaseLoginRegiterViewController.h"

@interface LJRegisterViewController : LJBaseLoginRegiterViewController
#pragma mark --下一步
- (void)ButtonClick:(UIButton *)sender;
@property (nonatomic,strong) dispatch_source_t _timer;
@end
