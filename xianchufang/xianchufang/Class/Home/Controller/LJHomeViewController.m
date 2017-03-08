//
//  LJHomeViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJHomeViewController.h"

#import "LJNavigationView.h" //导航栏视图

#import "LJMenuItemCollectionViewCell.h" //1.menu 菜单的cell



@interface LJHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate>
/*** 主要 :CollectionView ***/
@property (nonatomic,strong) UICollectionView *LJCollectionView;
/*** 导航栏 ***/
@property (nonatomic,strong) LJNavigationView *navigationView;
@end

@implementation LJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureBaseInfo];       //1.配置configureBaseInfo基本属性
    [self configureCollectionView]; //2.配置collectionView属性
    [self addNavigationView];       //3.添加导航栏视图
}

#pragma mark --configureBaseInfo
- (void)configureBaseInfo {
    //1.设置自动布局为NO
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    //2.设置navigationController的代理，来隐藏导航栏
    self.navigationController.delegate = self;
}

#pragma mark --判断是否为当前控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isShowSelf = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowSelf animated:YES];//动画要设为YES，不然界面切换不连贯
}

#pragma mark --添加导航栏视图
- (void)addNavigationView {
    self.navigationView = [[NSBundle mainBundle] loadNibNamed:@"LJNavigationView" owner:nil options:nil].lastObject;
    self.navigationView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
    [self.view addSubview:self.navigationView];
    [self.navigationView.messageBtn addTarget:self action:@selector(messageBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark --configureCollectionView
- (void)configureCollectionView {
    //1.创建流水布局(布局对象)
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    //2.创建UICollectionView对象, 将layout添加到collectionViewLayout:里面
    self.LJCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 49) collectionViewLayout:flowLayout];
    //3.设置UICollectionView基本属性
    self.LJCollectionView.backgroundColor = LJCommonBgColor;
    self.LJCollectionView.delegate = self;
    self.LJCollectionView.dataSource = self;
    self.LJCollectionView.showsVerticalScrollIndicator = NO;
    //4.注册cell 从上到下顺序
    [self.LJCollectionView registerClass:[LJMenuItemCollectionViewCell class] forCellWithReuseIdentifier:@"LJMenuItemCollectionViewCell"];
    //5.注册头部视图
    [self.LJCollectionView registerClass:[NSClassFromString(@"LJCirculyHeaderReusableView") class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"KindSectionHeader"];
    
    [self.view addSubview:self.LJCollectionView];
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark --collectionView DataSource 
//返回多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}
//每组多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}
//显示cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LJMenuItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LJMenuItemCollectionViewCell" forIndexPath:indexPath];
    return cell;
}
//头尾视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"KindSectionHeader" forIndexPath:indexPath];
//    reusableView.backgroundColor = [UIColor orangeColor];
    return reusableView;
}

#pragma mark --collectionView Delegate
// 返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
//UICollectionView被选中的时候调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%zd",indexPath.item);
}

#pragma mark --UICollectionViewDelegateFlowLayout
//动态设置每个Item的尺寸大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {  //menu cell
        return CGSizeMake(spaceEdgeW(75), spaceEdgeH(90));
    }
    return CGSizeMake(spaceEdgeW(30), spaceEdgeH(30));
}
//动态设置每个分区的EdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) { //menu cell
        return UIEdgeInsetsMake(0, spaceEdgeW(15), 0, spaceEdgeW(15));
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//动态设置某组头视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) { //
       return CGSizeMake(SCREEN_WIDTH, spaceEdgeH(210));
    }
    return CGSizeMake(SCREEN_WIDTH, 30);
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark --点击事件
- (void)messageBtnClick {
    UIViewController *vc = [NSClassFromString(@"LJNewsCenterViewController") new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
