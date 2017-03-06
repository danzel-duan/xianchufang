//
//  LJGoodsDetailViewController.h
//  xianchufang
//
//  Created by zhenglong duan on 02/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJBaseViewController.h"
typedef void (^setalphaBlock)(); //设置导航栏上的颜色变化
@interface LJGoodsDetailViewController : LJBaseViewController
@property (nonatomic,copy) setalphaBlock setALphaBlock;
@end
