//
//  DLHotSearchView.h
//  DLKeyWordSearch
//
//  Created by zhenglong duan on 15/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define WIDTH  [UIScreen mainScreen ].bounds.size.width
#define HEIGHT  [ UIScreen mainScreen ].bounds.size.height
//字体大小
#define FontSize [UIFont systemFontOfSize:14]

@protocol DLHotSearchViewDelegate <NSObject>
/*** 给持有者返回自己的高度 ***/
- (void)comeBackHight:(CGFloat)hight;
/*** 点击热搜某个标签返回数据源的下标值 ***/
- (void)clickHotSearchViewBackIndex:(NSInteger)index;
/*** 隐藏键盘 ***/
- (void)hiddenKeyBord;
@end

@interface DLHotSearchView : UIView
@property (nonatomic,weak) id <DLHotSearchViewDelegate> delegate;
/*** 热搜数据源 ***/
@property (nonatomic,strong) NSMutableArray *hotDataArray;
@end
