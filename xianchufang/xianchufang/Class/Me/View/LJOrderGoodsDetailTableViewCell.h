//
//  LJOrderGoodsDetailTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 21/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJGoodsModel.h"
@interface LJOrderGoodsDetailTableViewCell : UITableViewCell
/*** 商品图片 ***/
@property (nonatomic,strong) UIImageView *goodsImageView;
/*** 商品名称 ***/
@property (nonatomic,strong) UILabel *goodsNameLabel;
/*** 商品价格 ***/
@property (nonatomic,strong) UILabel *goodsPriceLabel;
/*** 商品重量 ***/
@property (nonatomic,strong) UILabel *goodsWeightLabel;
/*** 数据 ***/
@property (nonatomic,strong) LJGoodsModel *goodsDataModel;
@end
