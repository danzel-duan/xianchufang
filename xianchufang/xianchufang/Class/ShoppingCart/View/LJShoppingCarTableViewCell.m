//
//  LJShoppingCarTableViewCell.m
//  xianchufang
//
//  Created by zhenglong duan on 20/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJShoppingCarTableViewCell.h"

@implementation LJShoppingCarTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpChildrenTopFrame];  //顶部View
        [self setUpChildrenCellFrame];
    }
    return self;
}

#pragma mark --模型赋值
- (void)setShoppingCarMOdel:(LJShoppingCarModel *)shoppingCarMOdel {
    _shoppingCarMOdel = shoppingCarMOdel;
    self.goodsImageView.image = [UIImage imageNamed:shoppingCarMOdel.goodsImageViewName];
    self.briefLabel.text = shoppingCarMOdel.brief;
    self.goodsNumLabel.text = [NSString stringWithFormat:@"%d",shoppingCarMOdel.goodsNum];
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",shoppingCarMOdel.price];
    self.price = shoppingCarMOdel.price;
    self.goodsNum = [NSString stringWithFormat:@"%d",shoppingCarMOdel.goodsNum];
    if ([shoppingCarMOdel.postAge isEqualToString:@""]) {
        [self.topBgView removeFromSuperview];
        self.bgView.lj_height = spaceEdgeH(120);
        self.bgView2.lj_y = 0;
    }else {
        [self.contentView addSubview:self.topBgView];
        self.postLabel.text = shoppingCarMOdel.postAge;
        self.bgView.lj_height = spaceEdgeH(160);
        self.bgView2.lj_y = self.topBgView.lj_bottom;
    }
    self.SelectBtn.selected = shoppingCarMOdel.isCellSelected;
}

#pragma mark --设置Top子控件
- (void)setUpChildrenTopFrame {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, spaceEdgeH(160))];
    bgView.backgroundColor = [UIColor whiteColor];
    //给bgView边框设置阴影
    bgView.layer.shadowOffset = CGSizeMake(1,3);
    bgView.layer.shadowOpacity = 0.2;
    bgView.layer.shadowColor = [UIColor blackColor].CGColor;
    bgView.layer.masksToBounds = NO;
    [self.contentView addSubview:bgView];
    self.bgView = bgView;
    
    //topView
    self.topBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, spaceEdgeH(40))];
    self.topBgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.topBgView];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 40, spaceEdgeH(20))];
    label1.text = @"满减";
    label1.textColor = [UIColor redColor];
    label1.textAlignment = NSTextAlignmentCenter;
    [label1 setFont:[UIFont systemFontOfSize:14]];
    label1.layer.borderWidth = 1;
    label1.layer.borderColor = [[UIColor redColor] CGColor];
    [self.topBgView addSubview:label1];
    
    self.postLabel = [[UILabel alloc] initWithFrame:CGRectMake(label1.lj_right+10, 10, 120, spaceEdgeH(20))];
    self.postLabel.text = @"满399元免运费";
    [self.postLabel setFont:[UIFont systemFontOfSize:14]];
    [self.topBgView addSubview:self.postLabel];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH -70, 10, 70, spaceEdgeH(20))];
    [button1 setTitle:@"去凑单" forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"tabbar_icon_go_selected"] forState:UIControlStateNormal];
    [button1.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];;
    button1.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    button1.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -90);
    [button1 addTarget:self action:@selector(Button1Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.topBgView addSubview:button1];
    
    /*** 分割线 ***/
    UIView *cutLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.topBgView.lj_bottom - 0.5, SCREEN_WIDTH, 0.5)];
    cutLine.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [self.topBgView addSubview:cutLine];
}

#pragma mark --去凑单
- (void)Button1Click:(UIButton*)sender {
    LJLogFunc
}

#pragma mark --设置Cell子控件
- (void)setUpChildrenCellFrame {
    UIView *bgView2 = [[UIView alloc] initWithFrame:CGRectMake(0, self.topBgView.lj_bottom, SCREEN_WIDTH, spaceEdgeH(115))];
    bgView2.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgView2];
    self.bgView2 = bgView2;
    
    UIButton *SelectBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,spaceEdgeH(37), 40, 40)];
    [SelectBtn setImage:[UIImage imageNamed:@"my_duihao_icon"] forState:UIControlStateNormal];
    [SelectBtn setImage:[UIImage imageNamed:@"my_duihao_icon_selected"] forState:UIControlStateSelected];
    [SelectBtn addTarget:self action:@selector(SelectionClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView2 addSubview:SelectBtn];
    self.SelectBtn = SelectBtn;
    
    /*** 商品图片 ***/
    self.goodsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SelectBtn.lj_right , 10, spaceEdgeH(100), spaceEdgeW(100))];
    self.goodsImageView.backgroundColor = LJRandomColor ;
    [bgView2 addSubview:self.goodsImageView];
    /*** 商品简介 ***/
    self.briefLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsImageView.lj_right + 15, self.goodsImageView.lj_y - 3, SCREEN_WIDTH - self.goodsImageView.lj_right - spaceEdgeW(20), 0)];
    self.briefLabel.text = @"大青皮 该品种耐寒性特强，高抗病，茎棒粗大且顺直，皮绿肉青，质脆味清香，叶椭圆";
    self.briefLabel.numberOfLines = 2;
    [self.briefLabel sizeToFit];
    [self.briefLabel setFont:[UIFont systemFontOfSize:14]];
    [bgView2 addSubview:self.briefLabel];
    /*** 商品价格 ***/
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.goodsImageView.lj_right + 15, self.briefLabel.lj_bottom + spaceEdgeH(8), 0, 20)];
    self.priceLabel.text = @"2000000000";
    [self.priceLabel setFont:[UIFont systemFontOfSize:15]];
    [self.priceLabel setTextColor:[UIColor redColor]];
    [self.priceLabel sizeToFit];
    [bgView2 addSubview:self.priceLabel];
    /*** 减数量 ***/
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(self.goodsImageView.lj_right + 15 , self.priceLabel.lj_bottom + spaceEdgeH(8), 30, spaceEdgeH(25))];
    [button2 setTitle:@"-" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button2.layer.borderWidth = 0.5;
    button2.layer.borderColor = [LJFontColor88 CGColor];
    button2.tag = 12;
    [button2 addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView2 addSubview:button2];
    /*** 商品数量L ***/
    self.goodsNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(button2.lj_right, button2.lj_y, 60, spaceEdgeH(25))];
    self.goodsNumLabel.layer.borderColor = [LJFontColor88 CGColor];
    self.goodsNumLabel.layer.borderWidth = 0.5;
    self.goodsNumLabel.textAlignment = NSTextAlignmentCenter;
    [bgView2 addSubview:self.goodsNumLabel];
    /*** 加数量 ***/
    UIButton * button3 = [[UIButton alloc] initWithFrame:CGRectMake(self.goodsNumLabel.lj_right, button2.lj_y, 30, spaceEdgeH(25))];
    [button3 setTitle:@"+" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button3.layer.borderWidth = 0.5;
    button3.layer.borderColor = [LJFontColor88 CGColor];
    button3.tag = 14;
    [button3 addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView2 addSubview:button3];
    /*** 单位 ***/
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(button3.lj_right + 5, 0, 0, spaceEdgeH(20))];
    label.text = @"(kg)";
    label.lj_centerY = button3.lj_centerY;
    label.textColor = LJFontColor88;
    [label sizeToFit];
    [label setFont:[UIFont systemFontOfSize:15]];
    [bgView2 addSubview:label];
}

#pragma mark --选择商品
- (void)SelectionClick :(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
        self.shoppingCarMOdel.isCellSelected = NO;
    }else {
        sender.selected = YES;
        self.shoppingCarMOdel.isCellSelected = YES;
    }
    if (self.calculateblock) {   //不管选中还是未选中，都要重新计算价格。
        self.calculateblock();
    }
}

#pragma mark --加减数量
- (void)ButtonClick:(UIButton *)sender {
    //代理
    [self.delegate BtnClick:self tag:sender.tag];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
