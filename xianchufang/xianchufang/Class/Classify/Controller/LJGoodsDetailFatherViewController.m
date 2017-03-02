//
//  LJGoodsDetailFatherViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 02/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJGoodsDetailFatherViewController.h"
#import "LJBaseScrollView.h" //加入自定义ScrollView来解决系统手势和ScrollView冲突问题
#import "LJGoodsInfoViewController.h"  //导入子控制器
#import "LJGoodsDetailViewController.h"
#import "LJGoodsCommentViewController.h"
#import "LJRadDot.h"
#import "LJShoppingCartViewController.h"
@interface LJGoodsDetailFatherViewController ()<UIScrollViewDelegate,UINavigationControllerDelegate>
/*** 整个背景ScrollView ***/
@property (strong, nonatomic) LJBaseScrollView *ScrollView;
/*当前选中的标题按钮*/
@property (strong, nonatomic) UIButton *selectedTitleButton;
/*指示器*/
@property (strong, nonatomic) UIView *indicatorView;
/*标题栏&&导航栏view*/
@property (strong, nonatomic) UIView *NavigateTitleView;
/*** 存放标题Button的View ***/
@property (nonatomic,strong) UIView *titleBgView;
/*** 底部标签栏 ***/
@property (nonatomic,strong) UIView *bottomView;
/*** 小红点提示 ***/
@property (nonatomic,strong) LJRadDot *radDot;
/*** 购物车按钮 ***/
@property (nonatomic,strong) UIButton *CarBtn;
/*** 商品信息子控制器 ***/
@property (nonatomic,strong) LJGoodsInfoViewController *goodsInfoVc;
/*** 商品详情子控制器 ***/
@property (nonatomic,strong) LJGoodsDetailViewController *goodsDetailVc;
/*** 商品评论子控制器 ***/
@property (nonatomic,strong) LJGoodsCommentViewController *goodsCommentVc;
@end

@implementation LJGoodsDetailFatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];  /*** 从上到下的顺序进行布局 ***/
    
    [self setScrollviewAttribute];   // 1.设置整个背景ScrollView
    [self setUpNavigateTitle];       // 2.设置自定义导航标题栏
    [self addChildVcToScrollView];   // 3.添加子控制器到ScrollView上
    [self addBottomView];            // 4.添加底部标签栏
}

#pragma mark-ScrollView属性设置
- (void)setScrollviewAttribute{
    self.automaticallyAdjustsScrollViewInsets = NO;       //1.避免scrollView自动预留64px空间
    self.navigationController.delegate = self;            //2.设置代理：解决导航栏显示与隐藏问题
    self.ScrollView = [[LJBaseScrollView alloc] init];    //3.设置ScrollView的属性
    self.ScrollView.backgroundColor = LJCommonBgColor;
    self.ScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.view.lj_height - spaceEdgeH(49));
    self.ScrollView.pagingEnabled = YES;
    self.ScrollView.showsHorizontalScrollIndicator = NO;
    self.ScrollView.showsVerticalScrollIndicator = NO;
    self.ScrollView.contentSize = CGSizeMake(self.view.lj_width * 3, 0);
    self.ScrollView.delegate = self;
    [self.view addSubview:self.ScrollView];
}

#pragma mark --设置自定义导航标题栏
- (void)setUpNavigateTitle {
    self.NavigateTitleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.lj_width, 64)];
    self.NavigateTitleView.backgroundColor = [LJCommonBgColor colorWithAlphaComponent:0];
    [self.view addSubview:self.NavigateTitleView];
    //1.存放标题Button的View
    self.titleBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, self.NavigateTitleView.lj_width * 2 / 3, 44)];
    self.titleBgView.lj_centerX = self.NavigateTitleView.lj_width / 2;
    [self.NavigateTitleView addSubview:self.titleBgView];
    //2.标题
    NSArray *titles = @[@"商品",@"详情",@"评价"];
    NSUInteger count = titles.count;
    CGFloat titleButtonW = self.titleBgView.lj_width / count;
    CGFloat titieButtonH = self.titleBgView.lj_height;
    //3.创建Button
    for (NSUInteger i = 0; i < count; i++) {
        UIButton* titleButton = [[UIButton alloc] initWithFrame:CGRectMake(i * titleButtonW, 0, titleButtonW, titieButtonH)];
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        [titleButton.titleLabel setFont:LJFontSize16];
        [titleButton setTitleColor:LJFontColor61 forState:UIControlStateNormal];
        [titleButton setTitleColor:LJTheMeColor forState:UIControlStateSelected];
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.tag = i;
        titleButton.titleEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
        [self.titleBgView addSubview:titleButton];
    }
    //4.找出第一个按钮
    UIButton *firstTitleButton = self.titleBgView.subviews.firstObject;
    //5.创建底部指示器
    self.indicatorView = [[UIView alloc]init];
    self.indicatorView.backgroundColor = LJTheMeColor;
    self.indicatorView.lj_height = 2;
    self.indicatorView.lj_y =self.titleBgView.lj_height - self.indicatorView.lj_height;
    [self.titleBgView addSubview:self.indicatorView];
    //6.立刻根据文字内容计算label的宽度
    [firstTitleButton.titleLabel sizeToFit];
    self.indicatorView.lj_width = firstTitleButton.titleLabel.lj_width;
    self.indicatorView.lj_centerX = firstTitleButton.lj_centerX;
    //7.默认选择第一个按钮
    firstTitleButton.selected = YES;
    self.selectedTitleButton = firstTitleButton;
    //8.设置选中后的字体大小
    [self.selectedTitleButton.titleLabel setFont:LJFontSize18];
    //9.自定义返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.lj_x = spaceEdgeW(5);
    backBtn.lj_y = spaceEdgeH(35);
    backBtn.lj_width = backBtn.lj_height = spaceEdgeW(40);
    [backBtn setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.NavigateTitleView addSubview:backBtn];
}

#pragma mark-添加子控制器到ScrollView上
- (void)addChildVcToScrollView {
    //1.子控制器的索引
    NSUInteger index =self.ScrollView.contentOffset.x / self.ScrollView.lj_width;
    //2.找到对应的子控制器
    UIViewController *childVc = nil;
    if (index == 0) {
        childVc = self.goodsInfoVc;
    }else if (index == 1){
        childVc = self.goodsDetailVc;
    }else if (index == 2){
        childVc = self.goodsCommentVc;
    }
    //3.如果子控制器已经加载就返回
    if ([childVc isViewLoaded]) return;
    childVc.view.frame = self.ScrollView.bounds;
    [self.ScrollView addSubview:childVc.view];
    __weak typeof(self) weakself = self;
    if (self.goodsInfoVc) {
        self.goodsInfoVc.setALphaBlock = ^(CGFloat alpha){ //设置导航栏颜色
            weakself.NavigateTitleView.backgroundColor = [LJCommonBgColor colorWithAlphaComponent:alpha];
        };
        self.goodsInfoVc.pushCommentVcblock = ^{  //跳转评论界面
            // 选中点击对应的按钮
            UIButton *titleButton = weakself.titleBgView.subviews[2];
            [weakself titleButtonClick:titleButton];
        };
    }
}

#pragma mark --添加底部标签栏
- (void)addBottomView {
    //1.创建底部标签栏
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - spaceEdgeH(49), SCREEN_WIDTH, spaceEdgeH(49))];
    self.bottomView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.bottomView];
    //2.顶部线条
    UIView *cutLine =[[ UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    cutLine.backgroundColor = LJCutLineColor;
    [self.bottomView addSubview:cutLine];
    //3.加入购物车按钮
    UIButton *addShoppingCarBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - spaceEdgeW(120), 0, spaceEdgeW(120), spaceEdgeH(49))];
    addShoppingCarBtn.backgroundColor = LJFontColorOr;
    [addShoppingCarBtn.titleLabel setTextColor:[UIColor whiteColor]];
    [addShoppingCarBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [addShoppingCarBtn.titleLabel setFont:LJFontSize16];
    [addShoppingCarBtn addTarget:self action:@selector(addShoppingCarClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:addShoppingCarBtn];
    //4.收藏、清单、购物车
    NSArray *buttonImageArr = @[@"classify_collect_icon",@"classify_inventory_icon",@"classify_shopping-cart_icon"];
    CGFloat btnW = (self.bottomView.lj_width - spaceEdgeW(120)) / 3 - spaceEdgeW(20);
    CGFloat btnH = spaceEdgeH(49);
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((i + 1) * spaceEdgeW(10) + i * btnW, 0, btnW, btnH)];
        [btn setImage:[UIImage imageNamed:buttonImageArr[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 310 + i;
        [self.bottomView addSubview:btn];
        if (i == 2) {
            self.radDot = [[LJRadDot alloc] init];
            [self.radDot showRadDotOnObject:btn text:@"6"];  //小红点，显示购物车中的数量
            self.CarBtn = btn;
        }
        if (i == 0) {
            [btn setImage:[UIImage imageNamed:@"classify_collect_icon_selected"] forState:UIControlStateSelected];
        }
    }
}

#pragma mark --点击事件
//1.标签栏的点击事件
- (void)titleButtonClick:(UIButton *)titleButton {
    //1.按钮状态控制、设置字体大小
    self.selectedTitleButton.selected = NO;
    titleButton.selected = YES;
    [self.selectedTitleButton.titleLabel setFont:LJFontSize16]; //交换前
    self.selectedTitleButton = titleButton;
    [self.selectedTitleButton.titleLabel setFont:LJFontSize18]; //交换后的字体大小
    //2.指示器跟随滚动
    [UIView animateWithDuration:0.06 animations:^{
        self.indicatorView.lj_width=titleButton.titleLabel.lj_width;
        self.indicatorView.lj_centerX=titleButton.lj_centerX;
    }];
    //3.ScrollView跟随滚动
    CGPoint offset = self.ScrollView.contentOffset;
    offset.x = titleButton.tag * self.ScrollView.lj_width;
    [self.ScrollView setContentOffset:offset animated:YES];
}
//2.返回按钮
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
//3.购物车按钮
- (void)addShoppingCarClick:(UIButton *)sender {
    [self.radDot showRadDotOnObject:self.CarBtn text:@"7"];
}
//4.收藏、清单、购物车
- (void)btnClick:(UIButton *)sender {
    if (sender.tag == 312) {
        LJShoppingCartViewController *Vc = [[LJShoppingCartViewController alloc] init];
        Vc.isOtherPage = YES;
        [self.navigationController pushViewController:Vc animated:YES];
    }else if (sender.tag == 311){  //清单
        LJLog(@"清单");
    }else if (sender.tag == 310){  //收藏
        sender.selected = !sender.selected;
    }
}

#pragma mark --懒加载子控制器
//1.商品信息
- (LJGoodsInfoViewController *)goodsInfoVc {
    if (!_goodsInfoVc) {
        _goodsInfoVc = [[LJGoodsInfoViewController alloc] init];
        [self addChildViewController:_goodsInfoVc];
    }
    return _goodsInfoVc;
}
//2.商品详情
- (LJGoodsDetailViewController *)goodsDetailVc {
    if (!_goodsDetailVc) {
        _goodsDetailVc = [[LJGoodsDetailViewController alloc] init];
        [self addChildViewController:_goodsDetailVc];
    }
    return _goodsDetailVc;
}
//3.商品评论
- (LJGoodsCommentViewController *)goodsCommentVc {
    if (!_goodsCommentVc) {
        _goodsCommentVc = [[LJGoodsCommentViewController alloc] init];
        [self addChildViewController:_goodsCommentVc];
    }
    return _goodsCommentVc;
}

#pragma mark --导航栏代理：解决导航栏显示与隐藏问题
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isSelfPage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isSelfPage animated:YES];
}

#pragma mark - <UIScrollViewDelegate>
///** 在scrollView滚动动画结束时, 就会调用这个方法
// 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildVcToScrollView];
}
// 在scrollView滚动动画结束时, 就会调用这个方法
// 前提: 人为拖拽scrollView产生的滚动动画
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 选中点击对应的按钮
    NSUInteger index = scrollView.contentOffset.x / scrollView.lj_width;
    UIButton *titleButton = self.titleBgView.subviews[index];
    [self titleButtonClick:titleButton];
    [self addChildVcToScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
