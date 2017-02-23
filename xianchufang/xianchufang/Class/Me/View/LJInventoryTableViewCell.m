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
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,  spaceEdgeH(231))];
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
    
    self.InventoryNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.selectBtn.lj_right, 10, 50, spaceEdgeH(20))];
    self.InventoryNameLabel.text = @"我的第一天菜品";
    [self.InventoryNameLabel setFont:[UIFont systemFontOfSize:15]];
    [self.InventoryNameLabel sizeToFit];
    [self.contentView addSubview:self.InventoryNameLabel];
    
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(40), 0, spaceEdgeW(40), spaceEdgeH(40))];
    [nextBtn setImage:[UIImage imageNamed:@"my_go2_icon"] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:nextBtn];
    /*** 分割线 ***/
    UIView *cutLine = [[UIView alloc] initWithFrame:CGRectMake(0,nextBtn.lj_bottom, SCREEN_WIDTH, 0.5)];
    cutLine.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [self.contentView addSubview:cutLine];
    ////////
    UIScrollView *bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(spaceEdgeW(27), cutLine.lj_bottom + spaceEdgeH(10), SCREEN_WIDTH - spaceEdgeW(54), spaceEdgeH(97))];
    bgScrollView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:bgScrollView];
    CGFloat ViewW = spaceEdgeW(74);
    for (int i = 0; i<6; i++) {
        UIView *cateBgView = [[UIView alloc] initWithFrame:CGRectMake(spaceEdgeW(8) * i+ViewW * i, 0, ViewW, spaceEdgeH(97) )];
        cateBgView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        cateBgView.layer.borderWidth = 0.5;
        [cateBgView setLayerWithCr:5];
        [bgScrollView addSubview:cateBgView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cateBgView.lj_width, cateBgView.lj_height - spaceEdgeH(17))];
        imageView.backgroundColor = LJRandomColor;
        [cateBgView addSubview:imageView];
        
        UILabel *nameL = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.lj_bottom, cateBgView.lj_width, spaceEdgeH(17))];
        nameL.text = @"大白萝卜头";
        nameL.textAlignment = NSTextAlignmentCenter;
        [nameL setFont:[UIFont systemFontOfSize:14]];
        [nameL setTextColor:LJFontColor39];
        [cateBgView addSubview:nameL];
    }
    bgScrollView.contentSize = CGSizeMake(ViewW * 6 +(6 * spaceEdgeW(8)), spaceEdgeH(97));
    
    /*** 分割线 ***/
    UIView *cutLine1 = [[UIView alloc] initWithFrame:CGRectMake(0,bgScrollView.lj_bottom + spaceEdgeH(10), SCREEN_WIDTH, 0.5)];
    cutLine1.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [self.contentView addSubview:cutLine1];
    
    //测试数据
    self.totalAmount = @"20.0";
    self.goodsNum = @"6";
    
    UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cutLine1.lj_bottom + spaceEdgeH(10), SCREEN_WIDTH - spaceEdgeW(10), spaceEdgeH(20))];
    amountLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:amountLabel];
    
    NSString *string = [NSString stringWithFormat:@"共%@件商品 总金额:￥%@",self.goodsNum,self.totalAmount];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:string];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor26,NSFontAttributeName:LJFontSize15} range:NSMakeRange(0, self.goodsNum.length + 10)];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor26,NSFontAttributeName:LJFontSize16} range:NSMakeRange(self.goodsNum.length + 10, self.totalAmount.length)];
    amountLabel.attributedText = attribute;
    
    /*** 分割线 ***/
    UIView *cutLine2 = [[UIView alloc] initWithFrame:CGRectMake(0,amountLabel.lj_bottom + spaceEdgeH(5), SCREEN_WIDTH, 0.5)];
    cutLine2.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [self.contentView addSubview:cutLine2];
    
    
    UIButton *paymentBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(70), bgView.lj_height - spaceEdgeH(30), spaceEdgeW(60), spaceEdgeH(24))];
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
        self.paymentblock(self.totalAmount); //金额回调
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
