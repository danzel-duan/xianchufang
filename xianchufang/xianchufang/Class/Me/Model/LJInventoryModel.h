//
//  LJInventoryModel.h
//  xianchufang
//
//  Created by zhenglong duan on 24/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJInventoryModel : NSObject
/*** 清单名称 ***/
@property (nonatomic,strong) NSString *inventName;
/*** 商品数量 ***/
@property (nonatomic,strong) NSString *goodsNum;
/*** 总金额 ***/
@property (nonatomic,strong) NSString *totalPrice;
/*** 商品信息列表 ***/
@property (nonatomic,strong) NSMutableArray *goodsDataArr;
/*** 当前cell是否被选中 ***/
@property (nonatomic,assign) BOOL isSelected;
@end
