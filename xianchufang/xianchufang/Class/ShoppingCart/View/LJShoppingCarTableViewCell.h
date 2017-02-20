//
//  LJShoppingCarTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 20/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJShoppingCarTableViewCell : UITableViewCell
/*** 满减 ***/
@property (nonatomic,strong) UIView *topBgView;
/*** 满多少免运费 ***/
@property (nonatomic,strong) UILabel *postLabel;
/*** 商品图片 ***/
@property (nonatomic,strong) UIImageView *goodsImageView;
/*** 商品简介 ***/
@property (nonatomic,strong) UILabel *briefLabel;
/*** 商品价格L ***/
@property (nonatomic,strong) UILabel *priceLabel;
/*** 商品价格 ***/
@property double price;
/*** 商品数量L ***/
@property (nonatomic,strong) UILabel *goodsNumLabel;

@end
