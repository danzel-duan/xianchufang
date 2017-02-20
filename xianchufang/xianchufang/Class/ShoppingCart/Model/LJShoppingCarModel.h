//
//  LJShoppingCarModel.h
//  xianchufang
//
//  Created by zhenglong duan on 20/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJShoppingCarModel : NSObject
/*** 满减内容 ***/
@property (nonatomic,strong) NSString *postAge; //减多少元
/*** 是否有满减活动 ***/
@property (nonatomic,strong) NSString *isPost;
/*** 商品图片 ***/
@property (nonatomic,strong) NSString *goodsImageViewName;
/*** 商品简介 ***/
@property (nonatomic,strong) NSString *brief;
/*** 商品价格 ***/
@property (nonatomic,strong) NSString *price;
/*** 商品数量 ***/
@property (nonatomic,strong) NSString *goodsNum;
/*** 是否被选中 ***/
@property BOOL isCellSelected;


#pragma mark ---额外属性
/*** cell高度 ***/
@property (nonatomic, assign) CGFloat cellHegiht;
@end
