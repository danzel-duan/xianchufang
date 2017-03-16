//
//  LJVarietyCategoryViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 06/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJVarietyCategoryViewController.h"
#import "LJVarietyCategoryCollectionViewCell.h"
#import "LJGoodsDetailFatherViewController.h"

@interface LJVarietyCategoryViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    CGFloat hight;
}
@property(nonatomic,strong)UICollectionView *collectionview;
/*** conllectionView的数据存放数组 ***/
@property (nonatomic,strong) NSMutableArray *conllectionArray;
/*** banner ***/
@property (nonatomic,strong) UIView *bannerView;

@end

@implementation LJVarietyCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = self.titleStr;
    if (self.isFull) {  //如果是满减页面进入
        [self setNavigaitonFont];
        [self addBannerView];
        hight = self.bannerView.lj_bottom;
    }else {
        hight = 64;
    }
    //测试
    self.conllectionArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"", nil];
    
    [self.collectionview registerClass:[LJVarietyCategoryCollectionViewCell class] forCellWithReuseIdentifier:@"LJVarietyCategoryCollectionViewCell"];
}

#pragma mark --collectionView
- (UICollectionView *)collectionview{
    if (!_collectionview) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, hight, SCREEN_WIDTH , SCREEN_HEIGHT - hight) collectionViewLayout:flowlayout];
        flowlayout.minimumInteritemSpacing = 0;
        flowlayout.minimumLineSpacing = 1;
        _collectionview.delegate = self;
        _collectionview.dataSource = self;
        _collectionview.backgroundColor = LJCommonBgColor;
        [self.view addSubview:_collectionview];
    }
    return _collectionview;
}

#pragma mark --setNavigationFont 设置导航栏字体
- (void)setNavigaitonFont {
    UIImageView *titleViewImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    titleViewImage.image = [UIImage imageNamed:@"home_shopping_manjian_icon"];
    [titleViewImage sizeToFit];
    [self.navigationItem setTitleView:titleViewImage];
}

#pragma mark --bannerView
- (void)addBannerView {
    //3.banner视图
    self.bannerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, spaceEdgeH(150))];
    self.bannerView.backgroundColor = LJRandomColor;
    [self.view addSubview:self.bannerView];
}

#pragma mark 定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

#pragma mark UICollectionView cell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.conllectionArray.count;
}

#pragma mark 每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LJVarietyCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LJVarietyCategoryCollectionViewCell" forIndexPath:indexPath];
    if (self.isFull) {
        cell.isFullIdentify = YES; //如果有满减，则cell上有满减标识
    }
    cell.isFullIdentify = NO;
    [cell.shoppingCarBtn addTarget:self action:@selector(addShoppingCarClick) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark --每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(spaceEdgeW(180), spaceEdgeH(240));
}

#pragma mark 定义整个组UICollectionView 的 margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(spaceEdgeH(5), spaceEdgeH(5), 0, spaceEdgeH(5));
}

#pragma mark 返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark 返回这个UICollectionView是否可以被选择
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    LJGoodsDetailFatherViewController *vc = [[LJGoodsDetailFatherViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

//动态设置某组尾视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(0, 20);
}

#pragma mark --加入购物车事件
- (void)addShoppingCarClick {
    LJLogFunc
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
