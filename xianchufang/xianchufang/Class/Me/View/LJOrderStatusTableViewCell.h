//
//  LJOrderStatusTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 13/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJButton.h"
typedef void(^MyOrderBlock)(NSInteger);
@interface LJOrderStatusTableViewCell : UITableViewCell
typedef NS_ENUM(NSInteger,MyOrderStatus){
    MyOrderStatusNonPayment = 0,  //待付款
    MyOrderStatusNonDelivery,     //待配送
    MyOrderStatusNonTakeDelivery,  //待收货
    MyOrderStatusExchange,        //退货
    MyOrderStatusNonEvaluate      //待评价
};
@property (nonatomic, copy) MyOrderBlock myOrderBlock;
@end
