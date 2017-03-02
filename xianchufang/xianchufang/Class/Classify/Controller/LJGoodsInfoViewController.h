//
//  LJGoodsInfoViewController.h
//  xianchufang
//
//  Created by zhenglong duan on 02/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJBaseViewController.h"
typedef void (^setAlphaBlock)(CGFloat); //设置导航栏上的颜色变化
typedef void (^pushCommentVcBlock)();  //点评论跳转评论界面
@interface LJGoodsInfoViewController : LJBaseViewController
@property (nonatomic,copy) setAlphaBlock setALphaBlock;
@property (nonatomic,copy) pushCommentVcBlock pushCommentVcblock;
@end
