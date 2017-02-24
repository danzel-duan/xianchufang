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
        self.inventoryModel.isSelected = NO;
        self.selectblock();
    }else {
        sender.selected = YES;
        self.inventoryModel.isSelected = YES;  //标记当前cell已被选中
        self.selectblock();
    }
}

#pragma mark --nextClick
- (void)nextClick:(UIButton *)sender {
    if (self.nextblock) {
        self.nextblock(self.InventoryNameLabel.text); //清单名称
    }
}

#pragma mark --数据模型进行赋值
- (void)setInventoryModel:(LJInventoryModel *)inventoryModel {
    _inventoryModel = inventoryModel;
    self.InventoryNameLabel.text = inventoryModel.inventName;
    NSString *string = [NSString stringWithFormat:@"共%@件商品 总金额:￥%@",inventoryModel.goodsNum,inventoryModel.totalPrice];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:string];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor26,NSFontAttributeName:LJFontSize15} range:NSMakeRange(0, inventoryModel.goodsNum.length + 10)];
    [attribute addAttributes:@{NSForegroundColorAttributeName:LJFontColor26,NSFontAttributeName:LJFontSize16} range:NSMakeRange(inventoryModel.goodsNum.length + 10, inventoryModel.totalPrice.length)];
    self.amountLabel.attributedText = attribute;
    ///商品进行赋值
    self.goodsInfoArr = [LJGoodsModel mj_objectArrayWithKeyValuesArray:inventoryModel.goodsDataArr];
    [self.bgScrollView removeFromSuperview]; //添加之前先删除原有的ScrollView
    [self addScrollView];
    
    self.selectBtn.selected = inventoryModel.isSelected; //直接赋值是否为选中
}

#pragma mark --添加ScrollView
- (void)addScrollView {
    ////////
    self.bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(spaceEdgeW(27), spaceEdgeH(50), SCREEN_WIDTH - spaceEdgeW(54), spaceEdgeH(97))];
    self.bgScrollView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:self.bgScrollView];
    NSInteger count = self.goodsInfoArr.count; ///////数组长度
    
    CGFloat ViewW = spaceEdgeW(74);
    for (int i = 0; i<count; i++) {
        LJGoodsModel *model = self.goodsInfoArr[i];
        UIView *cateBgView = [[UIView alloc] initWithFrame:CGRectMake(spaceEdgeW(8) * i+ViewW * i, 0, ViewW, spaceEdgeH(97) )];
        cateBgView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        cateBgView.layer.borderWidth = 0.5;
        [cateBgView setLayerWithCr:5];
        [self.bgScrollView addSubview:cateBgView];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cateBgView.lj_width, cateBgView.lj_height - spaceEdgeH(17))];
        imageView.backgroundColor = LJRandomColor;
        [cateBgView addSubview:imageView];
        
        UILabel *nameL = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.lj_bottom, cateBgView.lj_width, spaceEdgeH(17))];
        nameL.text = model.goodsName;
        nameL.textAlignment = NSTextAlignmentCenter;
        [nameL setFont:[UIFont systemFontOfSize:14]];
        [nameL setTextColor:LJFontColor39];
        [cateBgView addSubview:nameL];
    }
    self.bgScrollView.contentSize = CGSizeMake(ViewW * count +(count * spaceEdgeW(8)), spaceEdgeH(97));
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
    
    self.InventoryNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.selectBtn.lj_right, 10, spaceEdgeW(80), spaceEdgeH(20))];
    [self.InventoryNameLabel setFont:[UIFont systemFontOfSize:15]];
    [self.contentView addSubview:self.InventoryNameLabel];
    
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(40), 0, spaceEdgeW(40), spaceEdgeH(40))];
    [nextBtn setImage:[UIImage imageNamed:@"my_go2_icon"] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:nextBtn];
    /*** 分割线 ***/
    UIView *cutLine = [[UIView alloc] initWithFrame:CGRectMake(0,nextBtn.lj_bottom, SCREEN_WIDTH, 0.5)];
    cutLine.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [self.contentView addSubview:cutLine];
    
    /*** 分割线 ***/
    UIView *cutLine1 = [[UIView alloc] initWithFrame:CGRectMake(0, spaceEdgeH(157), SCREEN_WIDTH, 0.5)];
    cutLine1.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [self.contentView addSubview:cutLine1];
    
    self.amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cutLine1.lj_bottom + spaceEdgeH(10), SCREEN_WIDTH - spaceEdgeW(10), spaceEdgeH(20))];
    self.amountLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.amountLabel];
    
    /*** 分割线 ***/
    UIView *cutLine2 = [[UIView alloc] initWithFrame:CGRectMake(0,self.amountLabel.lj_bottom + spaceEdgeH(5), SCREEN_WIDTH, 0.5)];
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
        self.paymentblock(self.inventoryModel.totalPrice); //金额回调
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
