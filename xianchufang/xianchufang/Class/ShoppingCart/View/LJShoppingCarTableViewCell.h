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
typedef void (^returnBlock)(NSInteger,NSString *);

@interface LJShoppingCarTableViewCell : UITableViewCell<UITextFieldDelegate>
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
@property (nonatomic,strong) UITextField *goodsNumTextField;
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
@property (nonatomic,copy) returnBlock returnblock;
/*** row 当前所在的行***/
@property (nonatomic,assign) NSInteger row;

@property (nonatomic,strong) LJShoppingCarModel *shoppingCarMOdel;

@property (nonatomic,assign) id<LjShoppingCarCellDelegate>delegate;

@property (nonatomic,copy) dispatch_block_t block; //用于回调去凑单页面
@end
