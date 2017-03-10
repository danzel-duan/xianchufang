//
//  LJChoicenessViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 10/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//    首页第二个cell,星级精选

#import "LJChoicenessViewController.h"
#import "LJBaseScrollView.h" //加入自定义ScrollView来解决系统手势和ScrollView冲突问题<UIScrollViewDelegate>
#import "LJChoicenessChildrenView.h"
#import "LJVarietyCategoryViewController.h"

@interface LJChoicenessViewController ()<UIScrollViewDelegate>
/*** 整个背景ScrollView ***/
@property (strong, nonatomic) LJBaseScrollView *ScrollView;
/*当前选中的标题按钮*/
@property (strong, nonatomic) UIButton *selectedTitleButton;
/*指示器*/
@property (strong, nonatomic) UIView *indicatorView;
/*标题栏*/
@property (strong, nonatomic) UIScrollView *TitleView;
/*** 标题数组 ***/
@property (nonatomic,strong) NSMutableArray *titleArray;
/*** banner ***/
@property (nonatomic,strong) UIView *bannerView;
/*** 存放索引 ***/
@property (nonatomic,strong) NSMutableArray *indexArray;

@end

@implementation LJChoicenessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];                 // 1.加载数据
    [self setScrollviewBannerAttribute];// 2.设置ScrollView和Banner属性设置
    [self setUpTitleView];           // 3.设置标题View
    [self addChildVcToScrollView];  //4.设置默认子视图
}

#pragma mark --加载数据
- (void)loadData {
    self.titleArray = [NSMutableArray arrayWithObjects:@"自动预预留",@"自动预预留",@"自预动预留",@"自动预留",@"自动预留",@"自动预预留", nil];
    
}

#pragma mark-ScrollView和Banner属性设置
- (void)setScrollviewBannerAttribute{
    self.automaticallyAdjustsScrollViewInsets = NO;       //1.避免scrollView自动预留64px空间
    //2.存放标题Button的View
    CGFloat hight = 40;
    CGFloat with = [self calculateTtitleViewWidth];
    if (with == 0) {
        hight = 0;
    }
    self.TitleView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.lj_width, hight)];
    self.TitleView.backgroundColor = [UIColor whiteColor];
    self.TitleView.showsHorizontalScrollIndicator = NO;
    self.TitleView.showsVerticalScrollIndicator = NO;
    self.TitleView.bounces = NO;
    self.TitleView.contentSize = CGSizeMake(with, 0);
    [self.view addSubview:self.TitleView];
    //3.banner视图
    self.bannerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.TitleView.lj_bottom, SCREEN_WIDTH, spaceEdgeH(120))];
    self.bannerView.backgroundColor = LJRandomColor;
    [self.view addSubview:self.bannerView];
    //4.设置背景ScrollView的属性
    self.ScrollView = [[LJBaseScrollView alloc] init];
    self.ScrollView.backgroundColor = LJCommonBgColor;
    self.ScrollView.frame = CGRectMake(0, self.bannerView.lj_bottom, SCREEN_WIDTH, self.view.lj_height - 64 - self.TitleView.lj_height - self.bannerView.lj_height);
    self.ScrollView.pagingEnabled = YES;
    self.ScrollView.showsHorizontalScrollIndicator = NO;
    self.ScrollView.showsVerticalScrollIndicator = NO;
    self.ScrollView.contentSize = CGSizeMake(self.view.lj_width * self.titleArray.count, 0);
    self.ScrollView.delegate = self;
    [self.view addSubview:self.ScrollView];
}

#pragma mark --设置标题栏
- (void)setUpTitleView {
    //1.标题
    NSUInteger count = self.titleArray.count;
    CGFloat titleButtonW = [self calculateTtitleViewButtonWidth];
    CGFloat titieButtonH = self.TitleView.lj_height;
    //3.创建Button
    for (NSUInteger i = 0; i < count; i++) {
        UIButton* titleButton = [[UIButton alloc] initWithFrame:CGRectMake(i * titleButtonW, 0, titleButtonW, titieButtonH)];
        [titleButton setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [titleButton.titleLabel setFont:LJFontSize16];
        [titleButton setTitleColor:LJFontColor39 forState:UIControlStateNormal];
        [titleButton setTitleColor:LJFontColored forState:UIControlStateSelected];
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.tag = i;
        titleButton.titleEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
        [self.TitleView addSubview:titleButton];
    }
    //4.找出第一个按钮
    UIButton *firstTitleButton = self.TitleView.subviews.firstObject;
    //5.创建底部指示器
    self.indicatorView = [[UIView alloc]init];
    self.indicatorView.backgroundColor = LJFontColored;
    self.indicatorView.lj_height = 2;
    self.indicatorView.lj_y =self.TitleView.lj_height - self.indicatorView.lj_height;
    [self.TitleView addSubview:self.indicatorView];
    //6.立刻根据文字内容计算label的宽度
    [firstTitleButton.titleLabel sizeToFit];
    self.indicatorView.lj_width = firstTitleButton.titleLabel.lj_width;
    self.indicatorView.lj_centerX = firstTitleButton.lj_centerX;
    //7.默认选择第一个按钮
    firstTitleButton.selected = YES;
    self.selectedTitleButton = firstTitleButton;
}

#pragma mark --点击事件
//1.标签栏的点击事件
- (void)titleButtonClick:(UIButton *)titleButton {
    //1.按钮状态控制、设置字体大小
    self.selectedTitleButton.selected = NO;
    titleButton.selected = YES;
    self.selectedTitleButton = titleButton;
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

#pragma mark-添加子控制器到ScrollView上
- (void)addChildVcToScrollView {
    //1.子控制器的索引
    int index = self.ScrollView.contentOffset.x / self.ScrollView.lj_width;
    if (self.indexArray != nil) {
        for (id subindex in self.indexArray) {
            int sub = [subindex intValue];
            if (sub == index) {return;}    //如果存在此子视图的索引，就不再加载
        }
        [self.indexArray addObject:[NSNumber numberWithInt:index]];
    }else {
        self.indexArray = [NSMutableArray array];
        [self.indexArray addObject:[NSNumber numberWithInt:index]];
    }
    LJChoicenessChildrenView *ChildreView = [[LJChoicenessChildrenView alloc] initWithFrame:self.ScrollView.bounds];
    __weak typeof(self) weakSelf = self;
    ChildreView.cellClick = ^ {
        LJVarietyCategoryViewController *categoryView = [[LJVarietyCategoryViewController alloc] init];
        //页面进行传值----->>>>
        categoryView.isFull = NO;
        [weakSelf.navigationController pushViewController:categoryView animated:YES];
    };
    [self.ScrollView addSubview:ChildreView];
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
    UIButton *titleButton = self.TitleView.subviews[index];
    [self titleButtonClick:titleButton];
    [self addChildVcToScrollView];
    if (index <= 2) return; //当前页面四个按钮的宽度，当在这个范围内则不需要移动；
    CGPoint offset = self.TitleView.contentOffset;
    offset.x = (index - 3) * [self calculateTtitleViewButtonWidth];
    [self.TitleView setContentOffset:offset animated:YES];
}

#pragma mark --计算titleView内容宽度
- (CGFloat)calculateTtitleViewWidth {
    NSInteger count = self.titleArray.count;
    CGFloat width = [self calculateTtitleViewButtonWidth];
    if (width == self.view.lj_width) {
        return 0;
    }
    CGFloat LWidth = count * width;
    return LWidth;
}

#pragma mark --计算titleView标题按钮的宽度
- (CGFloat)calculateTtitleViewButtonWidth {
    NSInteger count = self.titleArray.count;
    CGFloat width;
    NSInteger tempCount;
    if (count <= 4) {
        tempCount = count;
    }else {
        tempCount = 4;
    }
    width = self.view.lj_width / tempCount;
    return width;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
