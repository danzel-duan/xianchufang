//
//  LJGoodsDetailFatherViewController.h
//  xianchufang
//
//  Created by zhenglong duan on 02/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LJGoodsDetailFatherViewControllerDelegate <NSObject>
/*** 显示搜索界面 ***/
- (void)showSearchView ;
@end
@interface LJGoodsDetailFatherViewController : UIViewController
@property (nonatomic,weak) id <LJGoodsDetailFatherViewControllerDelegate> delegate;
@end
