//
//  LJInventoryTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 20/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJInventoryTableViewCell.h"

@implementation LJInventoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpChildrenFrame];
    }
    return self;
}

#pragma mark --selectClick
- (void)selectClick:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
        self.selectblock(@"0",--selectNum);
    }else {
        sender.selected = YES;
        self.selectblock(@"1",++selectNum);
    }
}

#pragma mark --nextClick
- (void)nextClick:(UIButton *)sender {
    if (self.nextblock) {
        self.nextblock(self.InventoryNameLabel.text); //清单名称
    }
}

- (void)setUpChildrenFrame {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 231)];
    bgView.backgroundColor = [UIColor whiteColor];
    //给bgView边框设置阴影
    bgView.layer.shadowOffset = CGSizeMake(1,3);
    bgView.layer.shadowOpacity = 0.2;
    bgView.layer.shadowColor = [UIColor blackColor].CGColor;
    bgView.layer.masksToBounds = NO;
    [self.contentView addSubview:bgView];
    
    self.selectBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 40, 40)];
    [self.selectBtn setImage:[UIImage imageNamed:@"my_duihao_icon"] forState:UIControlStateNormal];
    [self.selectBtn setImage:[UIImage imageNamed:@"my_duihao_icon_selected"] forState:UIControlStateSelected];
    [self.selectBtn addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.selectBtn];
    
    self.InventoryNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.selectBtn.lj_right, 10, 50, 20)];
    self.InventoryNameLabel.text = @"我的第一天菜品";
    [self.InventoryNameLabel setFont:[UIFont systemFontOfSize:15]];
    [self.InventoryNameLabel sizeToFit];
    [self.contentView addSubview:self.InventoryNameLabel];
    
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 40, 0, 40, 40)];
    [nextBtn setImage:[UIImage imageNamed:@"my_go2_icon"] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:nextBtn];
    /*** 分割线 ***/
    UIView *cutLine = [[UIView alloc] initWithFrame:CGRectMake(0,nextBtn.lj_bottom, SCREEN_WIDTH, 0.5)];
    cutLine.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [self.contentView addSubview:cutLine];
    /*** 分割线 ***/
    UIView *cutLine1 = [[UIView alloc] initWithFrame:CGRectMake(0,cutLine.lj_bottom + 115, SCREEN_WIDTH, 0.5)];
    cutLine1.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [self.contentView addSubview:cutLine1];
    
    self.totalAmountLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 90, cutLine1.lj_bottom + 10, 90, 20)];
    self.totalAmountLabel.text = @"20.0";
    [self.totalAmountLabel setFont:[UIFont systemFontOfSize:18]];
    self.totalAmountLabel.textAlignment = NSTextAlignmentCenter;
    self.totalAmountLabel.textColor = LJColorFromRGB(0x262626);
    [self.contentView addSubview:self.totalAmountLabel];
    
    UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cutLine1.lj_bottom + 10, 75, 20)];
    amountLabel.text = @"总金额 ￥";
    [amountLabel setFont:[UIFont systemFontOfSize:15]];
    amountLabel.textColor = LJColorFromRGB(0x262626);
    amountLabel.lj_x = SCREEN_WIDTH - self.totalAmountLabel.lj_width - amountLabel.lj_width;
    amountLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:amountLabel];
    //
    self.goodsNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cutLine1.lj_bottom + 10, 100, 20)];
    self.goodsNumLabel.text = @"共6件商品";
    [self.goodsNumLabel setFont:[UIFont systemFontOfSize:15]];
    self.goodsNumLabel.textColor = LJColorFromRGB(0x262626);
    self.goodsNumLabel.lj_x = SCREEN_WIDTH - self.totalAmountLabel.lj_width - amountLabel.lj_width - self.goodsNumLabel.lj_width;
    self.goodsNumLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.goodsNumLabel];
    /*** 分割线 ***/
    UIView *cutLine2 = [[UIView alloc] initWithFrame:CGRectMake(0,self.totalAmountLabel.lj_bottom + 10, SCREEN_WIDTH, 0.5)];
    cutLine2.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [self.contentView addSubview:cutLine2];
    ////////
    UIScrollView *bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, cutLine.lj_bottom + 10, SCREEN_WIDTH, 100)];
    bgScrollView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:bgScrollView];
    CGFloat ViewW = 74.0f;
    for (int i = 0; i<6; i++) {
        UIView *cateBgView = [[UIView alloc] initWithFrame:CGRectMake(5*(i+1)+ViewW*i, 3, ViewW, 90)];
        cateBgView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        cateBgView.layer.borderWidth = 0.5;
        [cateBgView setLayerWithCr:5];
        [bgScrollView addSubview:cateBgView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cateBgView.lj_width, cateBgView.lj_height - 18)];
        imageView.backgroundColor = LJRandomColor;
        [cateBgView addSubview:imageView];
        
        UILabel *nameL = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.lj_bottom, cateBgView.lj_width, 18)];
        nameL.text = @"大白萝卜头";
        nameL.textAlignment = NSTextAlignmentCenter;
        [nameL setFont:[UIFont systemFontOfSize:14]];
        [nameL setTextColor:LJColorFromRGB(0x393939)];
        [cateBgView addSubview:nameL];
    }
    bgScrollView.contentSize = CGSizeMake(ViewW * 6 +(6 * 5) + 5, 100);
    
    UIButton *paymentBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, cutLine2.lj_bottom + 6, 60, 24)];
    [paymentBtn setTitle:@"去支付" forState:UIControlStateNormal];
    [paymentBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    paymentBtn.layer.borderColor = [[UIColor redColor] CGColor];
    paymentBtn.layer.borderWidth = 1;
    [paymentBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [paymentBtn setLayerWithCr:3];
    [paymentBtn addTarget:self action:@selector(paymentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:paymentBtn];
}

#pragma mark --paymentBtnClick
- (void)paymentBtnClick:(UIButton *)sender {
    if (self.paymentblock) {
        self.paymentblock(self.totalAmountLabel.text); //金额回调
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
