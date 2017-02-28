//
//  LJCommitOrderCarMOder.h
//  xianchufang
//
//  Created by zhenglong duan on 28/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJCommitOrderCarMOder : NSObject
/*** 商品数量 ***/
@property (nonatomic,strong) NSString *goodsNum;
/*** 商品总价格 ***/
@property (nonatomic,strong) NSString *totalPrice;
/*** 是否包含运费 ***/
@property (nonatomic,strong) NSString *postPticStr;
/*** 商品列表 ***/
@property (nonatomic,strong) NSMutableArray *goodsArray;


#pragma mark ---额外属性
/*** 是否展开 ***/
@property (nonatomic,assign) BOOL isExpand;
/*** cell的高度 ***/
@property (nonatomic,assign) CGFloat cellHeight;
/*** cell背景的高度 ***/
@property (nonatomic,assign) CGFloat cellBgHeight;
/*** cell上tableView的高度 ***/
@property (nonatomic,assign) CGFloat cellTableViewHeight;
@end
