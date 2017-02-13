//
//  LJOrderStatusTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 13/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJOrderStatusTableViewCell.h"
#define buttonW SCREEN_WIDTH/5
#define buttonH self.contentView.lj_height *2-1
@implementation LJOrderStatusTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        LJButton *button1 = [LJButton new];
        button1.frame = CGRectMake(0, 0, buttonW, buttonH);
        [button1 setTitle:@"待付款" forState:UIControlStateNormal];
        [button1 setImage:[UIImage imageNamed:@"order_patment_icon"] forState:UIControlStateNormal];
        button1.tag = MyOrderStatusNonPayment;
        [self.contentView addSubview:button1];
        
        LJButton *button2 = [LJButton new];
        button2.frame = CGRectMake(buttonW, 0, buttonW, buttonH);
        [button2 setTitle:@"待配送" forState:UIControlStateNormal];
        [button2 setImage:[UIImage imageNamed:@"order_delivery_icon"] forState:UIControlStateNormal];
        button2.tag = MyOrderStatusNonDelivery;
        [self.contentView addSubview:button2];
        
        LJButton *button3 = [LJButton new];
        button3.frame = CGRectMake(buttonW*2, 0, buttonW, buttonH);
        [button3 setTitle:@"待收货" forState:UIControlStateNormal];
        [button3 setImage:[UIImage imageNamed:@"order_receipt_icon"] forState:UIControlStateNormal];
        button3.tag = MyOrderStatusNonTakeDelivery;
        [self.contentView addSubview:button3];
        
        LJButton *button4 = [LJButton new];
        button4.frame = CGRectMake(buttonW*3, 0, buttonW, buttonH);
        [button4 setTitle:@"退换货" forState:UIControlStateNormal];
        [button4 setImage:[UIImage imageNamed:@"order_aftermark_icon"] forState:UIControlStateNormal];
        button4.tag = MyOrderStatusExchange;
        [self.contentView addSubview:button4];
        
        LJButton *button5 = [LJButton new];
        button5.frame = CGRectMake(buttonW*4, 0, buttonW, buttonH);
        [button5 setTitle:@"待评价" forState:UIControlStateNormal];
        [button5 setImage:[UIImage imageNamed:@"order_evaluate_icon"] forState:UIControlStateNormal];
        button5.tag = MyOrderStatusNonEvaluate;
        [self.contentView addSubview:button5];
        
        [button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button4 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button5 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)buttonClick:(UIButton*)sender {
    if (self.myOrderBlock) {
        self.myOrderBlock(sender.tag);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
