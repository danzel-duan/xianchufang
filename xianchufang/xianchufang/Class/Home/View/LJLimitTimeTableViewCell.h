//
//  LJLimitTimeTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 09/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJLimitTimeTableViewCell : UITableViewCell
/*** 图片 ***/
@property (nonatomic,strong) UIImageView *goodsImageView;
/*** 商品名称 ***/
@property (nonatomic,strong) UILabel *goodsNameLabel;
/*** 现价 ***/
@property (nonatomic,strong) UILabel *currentPriceLabel;
/*** 原价 ***/
@property (nonatomic,strong) UILabel *marketPriceLabel;
@end
