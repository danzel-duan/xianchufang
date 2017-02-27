//
//  LJFoodCircleViewController.m
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJShoppingCartViewController.h"
#import "LJShoppingCarTableViewCell.h"
#import "LJTooltip.h"
@interface LJShoppingCartViewController ()<LjShoppingCarCellDelegate>{
    int goodsNumber;//选中了几件商品
}

@end

@implementation LJShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;  //去留白
    self.navigationItem.title = @"购物车";
    self.tableView.lj_y = 12;
    self.tableView.lj_height = SCREEN_HEIGHT - 56;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    //注册cell
    [self.tableView registerClass:[LJShoppingCarTableViewCell class] forCellReuseIdentifier:@"LJShoppingCarTableViewCell"];
    self.Allprice = 0;  //初始化总金额
    goodsNumber = 0;
    [self setNavigationEdit];
    [self addBottomSettlementTabBar];
    [self loadData];
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickHide:)];
    [self.view addGestureRecognizer:tap];
}

#pragma mark --点击手势
- (void)ClickHide:(UITapGestureRecognizer *)tapGesture {
    [self.view endEditing:YES];
}

/*** 加载数据 ***/
- (void)loadData {
    NSArray *data = @[@{@"postAge":@"满399免运费",@"isPost":@"yes",@"goodsImageViewName":@"",@"brief":@" 该品种耐寒性特强，高抗病，茎棒粗大且顺直",@"price":@"8",@"goodsNum":@"3"},@{@"postAge":@"",@"isPost":@"no",@"goodsImageViewName":@"",@"brief":@"大青品种耐寒性特强，高抗病，茎棒粗大且顺直",@"price":@"2",@"goodsNum":@"7"},@{@"postAge":@"满399免运费",@"isPost":@"no",@"goodsImageViewName":@"",@"brief":@"大青皮 该品种耐寒性特强，高抗病，茎棒粗大且顺直",@"price":@"200",@"goodsNum":@"40"},@{@"postAge":@"满399免运费",@"isPost":@"yes",@"goodsImageViewName":@"",@"brief":@"大青皮 该品种耐寒性特强，高抗病，茎棒粗大且顺直",@"price":@"300",@"goodsNum":@"340"},@{@"postAge":@"满399免运费",@"isPost":@"no",@"goodsImageViewName":@"",@"brief":@"大青皮 该品种耐寒性特强，高抗病，茎棒粗大且顺直",@"price":@"200",@"goodsNum":@"340"},@{@"postAge":@"",@"isPost":@"yes",@"goodsImageViewName":@"",@"brief":@"耐寒性特强，高抗病，茎棒粗大且顺直",@"price":@"200",@"goodsNum":@"340"}];
    self.dataArray = [LJShoppingCarModel mj_objectArrayWithKeyValuesArray:data];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJShoppingCarModel *shoppingCarModel = self.dataArray[indexPath.row];
    return shoppingCarModel.cellHegiht;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJShoppingCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LJShoppingCarTableViewCell"];
    cell.row = indexPath.row;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.shoppingCarMOdel = self.dataArray [indexPath.row];
    __weak LJShoppingCartViewController *weakSelf = self;
    cell.calculateblock = ^{
        if ([weakSelf.settlementBtn.titleLabel.text isEqualToString:@"删除"]) return ;
        [weakSelf CalculateTotalPrice];
    };
    cell.returnblock = ^(NSInteger row,NSString *textfield){
       [weakSelf.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        if ([textfield intValue] >500 ||([textfield intValue] < 10&&textfield !=nil)) {
            LJTooltip *tip = [[LJTooltip alloc] initWithToolTipStyle:ToolTipStyleAlert3];
            [tip Alert3content:@"商品数量只能在10~500kg之间" location:weakSelf.view.lj_height / 2];
            return ;
        }
        LJShoppingCarModel *model = weakSelf.dataArray[row];
        model.goodsNum = [textfield intValue];
        [weakSelf CalculateTotalPrice];
    };
    cell.delegate = self;
    return cell;
}

#pragma mark --导航栏编辑
- (void)setNavigationEdit {
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithText:@"编辑" hightext:@"完成" color:LJColorFromRGB(0x393939)
                                                                 highColor:nil target:self action:@selector(NavigationClick:)];
}

#pragma mark --x编辑事件
- (void)NavigationClick:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
        [self.settlementBtn setTitle:@"去结算(0)" forState:UIControlStateNormal];
        [self.bottomViewBg addSubview:self.view1];
        [self CalculateTotalPrice];
    }else{
        sender.selected = YES;
        [self.settlementBtn setTitle:@"删除" forState:UIControlStateNormal];
        [self.view1 removeFromSuperview];
    }
}

#pragma mark -- 添加底部结算标签
- (void)addBottomSettlementTabBar {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 93, SCREEN_WIDTH, 44)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    self.bottomViewBg = view;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 60, view.lj_height)];
    [button setTitle:@"全选" forState:UIControlStateNormal];
    [button.titleLabel setFont:LJFontSize15];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [button setTitleColor:LJFontColor88 forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"my_circle_icon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"my_duihao_icon_selected"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -10)];
    
    UIButton *settlement = [[UIButton alloc] initWithFrame:CGRectMake(view.lj_width - 94, 0, 94, 44)];
    settlement.backgroundColor = [UIColor redColor];
    [settlement setTitle:@"去结算(0)" forState:UIControlStateNormal];
    [settlement setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
    [settlement.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [settlement addTarget:self action:@selector(Settlement:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:settlement];
    self.settlementBtn = settlement;
    
    /*** 合计一系列 ***/
    UIView *view1 =[[ UIView alloc] initWithFrame:CGRectMake(button.lj_right + 10, 0, settlement.lj_x - button.lj_width -10, 44)];
    [view addSubview:view1];
    self.view1 = view1;
    
    UILabel *L1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 0, 20)];
    L1.text = @"合计:";
    [L1 setFont:LJFontSize14];
    [L1 sizeToFit];
    [view1 addSubview:L1];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(L1.lj_right, 3, 115, 20)];
    self.priceLabel.text = @"￥0.0";
    [self.priceLabel setFont:LJFontSize15];
    [self.priceLabel setTextAlignment:NSTextAlignmentLeft];
    [self.priceLabel setTextColor:[UIColor redColor]];
    [view1 addSubview:self.priceLabel];
    
    UILabel *L2 = [[UILabel alloc] initWithFrame:CGRectMake(0, L1.lj_bottom , 20, 10)];
    L2.text = @"不含运费";
    [L2 setFont:LJFontSize12];
    L2.textColor = LJFontColor88;
    [L2 sizeToFit];
    [view1 addSubview:L2];
}

#pragma mark --buttonClick 全选
- (void)buttonClick :(UIButton *)sender {
    sender.selected = !sender.selected;
    for (int i = 0; i<self.dataArray.count; i++) {
        LJShoppingCarModel *model = self.dataArray[i];
        model.isCellSelected = sender.selected;
    }
    [self.tableView reloadData];
    [self CalculateTotalPrice];
}

#pragma mark --结算按钮的点击事件
- (void)Settlement:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"删除"]) {
        for (int i = 0; i < self.dataArray.count; i++) {
            LJShoppingCarModel *model = self.dataArray[i];
            if (model.isCellSelected) {
                [self.dataArray removeObject:self.dataArray[i]];
                NSIndexPath *indexpath = [NSIndexPath indexPathForRow:i inSection:0];
                [self.tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexpath] withRowAnimation:UITableViewRowAnimationLeft];
            }
        }
        _Allprice = 0.0;
        goodsNumber = 0;
        self.priceLabel.text = [NSString stringWithFormat:@"￥%.1f",_Allprice];
    }else{
        LJLog(@"结算%.1f",self.totalPrice);
    }
}

#pragma mark --计算总价格
- (void)CalculateTotalPrice {
    if ([self.settlementBtn.titleLabel.text isEqualToString:@"删除"]) return ;
    for (int i = 0; i < self.dataArray.count; i++) {
        LJShoppingCarModel *model = self.dataArray[i];
        if (model.isCellSelected) {
            _Allprice = _Allprice + model.goodsNum  * [model.price floatValue];
            goodsNumber ++;
        }
    }
    self.priceLabel.text = [NSString stringWithFormat:@"￥%.1f",_Allprice];
    self.totalPrice = _Allprice;
    [self.settlementBtn setTitle:[NSString stringWithFormat:@"去结算(%d)",goodsNumber] forState:UIControlStateNormal];
    _Allprice = 0.0;
    goodsNumber = 0;
}


#pragma mark --LJShoppingCarDelegate代理方法
- (void)BtnClick:(UITableViewCell *)cell tag:(NSInteger)tag {
    LJTooltip *tip = [[LJTooltip alloc] initWithToolTipStyle:ToolTipStyleAlert3];
    if ([self.settlementBtn.titleLabel.text isEqualToString:@"删除"]) return ;
    NSIndexPath *indexpath = [self.tableView indexPathForCell:cell];
    if (tag == 12) {
        //减法
        LJShoppingCarModel *model = self.dataArray[indexpath.row];
        if (model.goodsNum  > 10) {
            model.goodsNum --;
        }
    }else if(tag == 14){
            //加法
            LJShoppingCarModel *model = self.dataArray[indexpath.row];
            if (model.goodsNum > 499) {
                [tip Alert3content:@"商品数量只能在10~500kg之间" location:self.view.lj_height / 2];
            }else{
               model.goodsNum ++;
            }
        }
    [self CalculateTotalPrice];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
