//
//  DLKeyWordSearchView.h
//  DLKeyWordSearch
//
//  Created by zhenglong duan on 15/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WIDTH  [UIScreen mainScreen ].bounds.size.width
#define HEIGHT  [ UIScreen mainScreen ].bounds.size.height

@protocol DLKeyWordSearchDelegate <NSObject>
/*** 点击某个搜索记录 ***/
- (void)keyWordSearchViewClickOnTheKeyWord:(NSString *)keyWord;
/*** 删除某个搜索记录 ***/
- (void)keyWordSearchViewDeleteTheKeyWord:(NSString *)keyWord AtIndexPath:(NSIndexPath *)indexPath;
/*** 删除所有搜索记录 ***/
- (void)keyWordSearchViewClearAllKeyWord;
/*** 根据返回数据源的下标值来返回给持有者 ***/
- (void)keyWordSearchViewBackIndex:(NSInteger)index;
/*** 隐藏键盘 ***/
- (void)hiddenKeyBord;
@end

@interface DLKeyWordSearchView : UIView
#pragma mark -- 关键字列表
/*** 刷新搜索关键字列表 ***/
- (void)refreshKeyWordView;
/*** 刷新某一行的关键字 ***/
- (void)refreshKeyWordViewAtIndexPath:(NSIndexPath *)indexPath;

#pragma mark -- 热搜
/*** 给热搜赋值 ***/
- (void)hotSearchViewGetData:(NSMutableArray *)dataArray;
/*** 判断热搜是否有值 ***/
- (BOOL)isEmptyTheHotSearchView;
//根据HotSearchView回调的index 从HotSearchView取到搜索关键字
- (NSString *)HotSearchViewComeBackKeywordByindex:(NSInteger)index;

@property (nonatomic,weak) id <DLKeyWordSearchDelegate> delegate;
/*** 关键字数据源 ***/
@property (nonatomic,strong) NSArray *keyWordArray;

@end
