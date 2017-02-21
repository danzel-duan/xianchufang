//
//  LJOrderGoodsDetailTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 21/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJOrderGoodsDetailTableViewCell : UITableViewCell
/*** 商品图片 ***/
@property (nonatomic,strong) UIImageView *goodsImageView;
/*** 商品名称 ***/
@property (nonatomic,strong) NSString *goodsName;
/*** 商品价格 ***/
@property (nonatomic,strong) NSString *goodsPrice;
/*** 商品重量 ***/
@property (nonatomic,strong) NSString *goodsWeight;
@end
