//
//  LJOrderStatusTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 13/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJOrderStatusTableViewCell.h"
#import "LJRadDot.h"
#define buttonW SCREEN_WIDTH/5
#define buttonH self.contentView.lj_height *2
@interface LJOrderStatusTableViewCell ()
@property (nonatomic,strong) LJRadDot *radDot;  //小红点
/*** 待付款 ***/
@property (nonatomic,strong) UIButton *patmentBtn;
/*** 待配送 ***/
@property (nonatomic,strong) UIButton *deliveryBtn;
/*** 待收货 ***/
@property (nonatomic,strong) UIButton *receiptBtn;
/*** 退换货 ***/
@property (nonatomic,strong) UIButton *aftermarkBtn;
/*** 待评价 ***/
@property (nonatomic,strong) UIButton *evaluateBtn;
@end
@implementation LJOrderStatusTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark --加载数据 （小红点的数量）
- (void)loadData {
    /*** 创建小红点对象 ***/
    _radDot = [[LJRadDot alloc] init];
    NSArray *RadDotNum = @[@"22",@"45",@"1",@"5",@"101"];
    /*** 显示小红点 ***/
    [_radDot showRadDotOnObject:self.patmentBtn text:RadDotNum[0]];
    [_radDot showRadDotOnObject:self.deliveryBtn text:RadDotNum[1]];
    [_radDot showRadDotOnObject:self.receiptBtn text:RadDotNum[2]];
    [_radDot showRadDotOnObject:self.aftermarkBtn text:RadDotNum[3]];
    [_radDot showRadDotOnObject:self.evaluateBtn text:RadDotNum[4]];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /*** 创建Button ***/
        [self setUpButton];
    }
    [self loadData]; //加载数据
    return self;
}

#pragma mark --创建Button
- (void)setUpButton {
    NSArray *titleArr = @[@"待付款",@"待配送",@"待收货",@"退换货",@"待评价"];
    NSArray *imageArr = @[@"order_patment_icon",@"order_delivery_icon",@"order_receipt_icon",@"order_aftermark_icon",@"order_evaluate_icon"];
    for (int i = 0; i <5; i++) {
        LJButton *button = [LJButton new];
        button.frame = CGRectMake(buttonW*i, 0, buttonW, buttonH);
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        button.tag = i;
        [self.contentView addSubview:button];
        if (i==0) {
            self.patmentBtn = button;
        }else if ( i ==1){
            self.deliveryBtn = button;
        }else if ( i ==2){
            self.receiptBtn = button;
        }else if ( i ==3){
            self.aftermarkBtn = button;
        }else if ( i ==4){
            self.evaluateBtn = button;
        }
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark --触发事件
- (void)buttonClick:(UIButton*)sender {
    if (self.myOrderBlock) {
        self.myOrderBlock(sender.tag);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
