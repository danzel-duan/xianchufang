//
//  LJSearchDetailTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 16/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJSearchDetailTableViewCell : UITableViewCell
/*** 图片 ***/
@property (nonatomic,strong) UIImageView *goodsImageView;
/*** 商品名称 ***/
@property (nonatomic,strong) UILabel *goodsNameLabel;
/*** 现价 ***/
@property (nonatomic,strong) UILabel *currentPriceLabel;
/*** 是否限时 ***/
@property (nonatomic,assign) BOOL isLimit;
/*** 是否满减 ***/
@property (nonatomic,assign) BOOL isFull;
@end
