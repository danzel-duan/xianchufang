//
//  LJMyCollectCollectionViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 22/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJMyCollectCollectionViewCell : UICollectionViewCell
/*** 菜品名 ***/
@property (nonatomic,strong) UILabel *cateNameLabel;
/*** 菜品数量 ***/
@property (nonatomic,strong) UILabel *cateNumLabel;
/*** 菜品图片 ***/
@property (nonatomic,strong) UIImageView *cateImageView;
@end
