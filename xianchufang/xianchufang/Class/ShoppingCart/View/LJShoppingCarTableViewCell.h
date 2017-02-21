//
//  LJShoppingCarTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 20/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJShoppingCarModel.h"
@protocol LjShoppingCarCellDelegate <NSObject>

- (void)BtnClick:(UITableViewCell *)cell tag:(NSInteger)tag;
@end
typedef void (^calculateBlock)();

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
/*** 商品数量L ***/
@property (nonatomic,strong) UILabel *goodsNumLabel;
/*** 商品价格 ***/
@property (nonatomic,strong) NSString *price;
/*** 商品数量 ***/
@property (nonatomic,strong) NSString *goodsNum;
/*** 选中button ***/
@property (nonatomic,strong) UIButton *SelectBtn;
/*** 背景 ***/
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UIView *bgView2;

@property (nonatomic,copy) calculateBlock calculateblock;
/*** row 当前所在的行***/
@property (nonatomic,assign) NSInteger row;

@property (nonatomic,strong) LJShoppingCarModel *shoppingCarMOdel;

@property (nonatomic,assign) id<LjShoppingCarCellDelegate>delegate;
@end
