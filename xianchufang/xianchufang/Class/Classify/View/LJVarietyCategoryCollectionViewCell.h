//
//  LJVarietyCategoryCollectionViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 06/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJVarietyCategoryCollectionViewCell : UICollectionViewCell
/*** 商品图片 ***/
@property (nonatomic,strong) UIImageView *imageView;
/*** 商品名称 ***/
@property (nonatomic,strong) UILabel *goodsNameLabel;
/*** 商品价格 ***/
@property (nonatomic,strong) UILabel *goodsPriceLabel;
/*** 购物车按钮 ***/
@property (nonatomic,strong) UIButton  *shoppingCarBtn;
/*** 是否是满减标识 ***/
@property (nonatomic,assign) BOOL isFullIdentify;
@end
