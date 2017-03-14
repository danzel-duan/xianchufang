//
//  LJHomeViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJHomeViewController.h"

#import "LJNavigationView.h" //导航栏视图
#import "LJLimitTimeViewController.h" //限时抢购页面
#import "LJChoicenessViewController.h"//第三个(暂定精品选购页面)
#import "LJVarietyCategoryViewController.h" //满了就减
#import "LJGoodsDetailFatherViewController.h"//商品详情页面

#import "LJMenuItemCollectionViewCell.h" //1.menu 菜单的cell
#import "LJTimeLimitCollectionViewCell.h"//2.限时抢购cell
#import "LJThreeCollectionViewCell.h"    //3.第三个cell
#import "LJFullSubCollectionViewCell.h"  //4.满减cell
#import "LJHotCollectionViewCell.h" //5.热门推选cell

@interface LJHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate>{
    CGFloat lastContentOffset; //偏移量
}
/*** 主要 :CollectionView ***/
@property (nonatomic,strong) UICollectionView *LJCollectionView;
/*** 导航栏 ***/
@property (nonatomic,strong) LJNavigationView *navigationView;
/*** 回到顶部按钮 ***/
@property (nonatomic,strong) UIButton *topBtn;
@end

@implementation LJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureBaseInfo];       //1.配置configureBaseInfo基本属性
    [self configureCollectionView]; //2.配置collectionView属性
    [self addNavigationView];       //3.添加导航栏视图
    [self addTopBtn];               //4.添加回到顶部按钮
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
    BOOL isShowSelf ;
    if ([viewController isKindOfClass:[self class]] || [viewController isKindOfClass:[NSClassFromString(@"LJGoodsDetailFatherViewController") class]]) {
        isShowSelf = YES;
    }
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
    flowLayout.minimumInteritemSpacing = 0;
    //2.创建UICollectionView对象, 将layout添加到collectionViewLayout:里面
    self.LJCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 49) collectionViewLayout:flowLayout];
    //3.设置UICollectionView基本属性
    self.LJCollectionView.backgroundColor = LJCommonBgColor;
    self.LJCollectionView.delegate = self;
    self.LJCollectionView.dataSource = self;
    self.LJCollectionView.showsVerticalScrollIndicator = NO;
    //4.注册cell 从上到下顺序
    [self.LJCollectionView registerClass:[LJMenuItemCollectionViewCell class] forCellWithReuseIdentifier:@"LJMenuItemCollectionViewCell"]; //1.menu 菜单的cell
    [self.LJCollectionView registerClass:[LJTimeLimitCollectionViewCell class] forCellWithReuseIdentifier:@"LJTimeLimitCollectionViewCell"];
    [self.LJCollectionView registerClass:[LJThreeCollectionViewCell class] forCellWithReuseIdentifier:@"LJThreeCollectionViewCell"];
    [self.LJCollectionView registerClass:[LJFullSubCollectionViewCell class] forCellWithReuseIdentifier:@"LJFullSubCollectionViewCell"];
    [self.LJCollectionView registerClass:[LJHotCollectionViewCell class] forCellWithReuseIdentifier:@"LJHotCollectionViewCell"];
    //5.注册头部视图
    [self.LJCollectionView registerClass:[NSClassFromString(@"LJCirculyHeaderReusableView") class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LJCirculyHeader"];
    [self.LJCollectionView registerClass:[NSClassFromString(@"LJTimeLimitHeaderReusableView") class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LJTimeLimitHeader"];
    [self.LJCollectionView registerClass:[NSClassFromString(@"LJThreeHeaderReusableView") class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LJThreeHeader"];
    [self.LJCollectionView registerClass:[NSClassFromString(@"LJFullSubHeaderReusableView") class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LJFullSubHeader"];
    [self.LJCollectionView registerClass:[NSClassFromString(@"LJHotHeaderReusableView") class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LJHotHeader"];
    
    [self.view addSubview:self.LJCollectionView];
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark --collectionView DataSource 
//返回多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}
//每组多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }else if (section == 1){
        return 8;
    }else if (section == 2){
        return 5;
    }else if (section == 3){
        return 5;
    }else if (section == 4){
        return 12;
    }
    return 0;
}
//显示cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        LJMenuItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LJMenuItemCollectionViewCell" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 1){
        LJTimeLimitCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LJTimeLimitCollectionViewCell" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 2){
        LJThreeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LJThreeCollectionViewCell" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 3){
        LJFullSubCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LJFullSubCollectionViewCell" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section == 4){
        LJHotCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LJHotCollectionViewCell" forIndexPath:indexPath];
        return cell;
    }
    
    return nil;
    
}
//头尾视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
         UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LJCirculyHeader" forIndexPath:indexPath];
        return reusableView;
    }else if (indexPath.section == 1){
        UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LJTimeLimitHeader" forIndexPath:indexPath];
        return reusableView;
    }else if (indexPath.section == 2){
        UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LJThreeHeader" forIndexPath:indexPath];
        return reusableView;
    }else if (indexPath.section == 3){
        UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LJFullSubHeader" forIndexPath:indexPath];
        return reusableView;
    }else if (indexPath.section == 4){
        UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LJHotHeader" forIndexPath:indexPath];
        return reusableView;
    }
    return nil;
}

#pragma mark --collectionView Delegate
// 返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
//UICollectionView被选中的时候调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NSLog(@"%zd",indexPath.item);
    }else if (indexPath.section == 1){
        LJLimitTimeViewController *limitTimeView = [[LJLimitTimeViewController alloc] init];
        [self.navigationController pushViewController:limitTimeView animated:YES];
    }else if (indexPath.section == 2){
        LJChoicenessViewController *choicenessView = [[LJChoicenessViewController alloc] init];
        [self.navigationController pushViewController:choicenessView animated:YES];
    }else if (indexPath.section == 3){
        LJVarietyCategoryViewController *VarietyView = [[LJVarietyCategoryViewController alloc] init];
        VarietyView.isFull = YES;
        [self.navigationController pushViewController:VarietyView animated:YES];
    }else if (indexPath.section == 4){
        LJGoodsDetailFatherViewController *vc = [[LJGoodsDetailFatherViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } 
}

#pragma mark --UICollectionViewDelegateFlowLayout
//动态设置每个Item的尺寸大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {  //menu cell
        return CGSizeMake(spaceEdgeW(75), spaceEdgeH(90));
    }else if (indexPath.section == 1){
        return CGSizeMake(spaceEdgeW(90.5), spaceEdgeH(120));
    }else if (indexPath.section == 2){  //第三个cell 的大小
        if (indexPath.item == 3 || indexPath.item == 4) {
            return CGSizeMake(SCREEN_WIDTH / 4, spaceEdgeH(100));
        }
        return CGSizeMake(SCREEN_WIDTH / 2, spaceEdgeH(100));
    }else if (indexPath.section == 3){ //满减cell 的大小
        if (indexPath.item == 0) {
            return CGSizeMake(spaceEdgeW(250), spaceEdgeH(150));
        }
        return CGSizeMake(spaceEdgeW(125), spaceEdgeH(150));
    }else if (indexPath.section == 4){
        return CGSizeMake(spaceEdgeW(123), spaceEdgeH(150));
    }
    return CGSizeMake(spaceEdgeW(30), spaceEdgeH(30));
}
//动态设置每个分区的EdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) { //menu cell
        return UIEdgeInsetsMake(0, spaceEdgeW(15), 0, spaceEdgeW(15));
    }else if (section == 1){
        return UIEdgeInsetsMake(0, spaceEdgeW(3), 0, spaceEdgeW(3));
    }else if (section == 4){
        return UIEdgeInsetsMake(0,spaceEdgeW(2), 0,spaceEdgeW(2));
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//动态设置某组头视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) { //
       return CGSizeMake(SCREEN_WIDTH, spaceEdgeH(210));
    }else if (section == 1){
       return CGSizeMake(SCREEN_WIDTH, spaceEdgeH(35));
    }else if (section == 2){
        return CGSizeMake(SCREEN_WIDTH, spaceEdgeH(120));
    }else if (section == 3){
        return CGSizeMake(SCREEN_WIDTH, spaceEdgeH(35));
    }else if (section == 4){
        return CGSizeMake(SCREEN_WIDTH, spaceEdgeH(35));
    }
    return CGSizeMake(SCREEN_WIDTH, 30);
}
//动态设置某组尾视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 1) {
       return CGSizeMake(SCREEN_WIDTH, spaceEdgeH(10));
    }else if (section == 4) {
        return CGSizeMake(SCREEN_WIDTH, spaceEdgeH(20));
    }
    return CGSizeMake(0, 0);
}

//动态设置某组内item行与行之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 1) {
        return 2.0f;
    }
    return 0;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark --addTopBtn
- (void)addTopBtn {
    self.topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.topBtn.frame = CGRectMake(self.view.frame.size.width - 60, self.view.frame.size.height - 100, 40, 40);
    [self.topBtn setBackgroundImage:[UIImage imageNamed:@"nearby_return_top_btn"] forState:UIControlStateNormal];
    [self.topBtn addTarget:self action:@selector(DoSomething) forControlEvents:UIControlEventTouchUpInside];
    self.topBtn.clipsToBounds = YES;
    self.topBtn.hidden = YES; //先隐藏
    [self.view addSubview:self.topBtn];
}


#pragma mark --判断偏移量
- (void)scrollViewWillBeginDragging:(UIScrollView*)scrollView{
    lastContentOffset = scrollView.contentOffset.y;
}

- ( void )scrollViewDidScroll:( UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > 200) {
        self.topBtn.hidden = NO;
        CGFloat alpha = MAX(0.36, 0.36 - (200 - scrollView.contentOffset.y) / 200);
        if (alpha > 1.0f) return; //如果大于1，就返回
        if (alpha > 0.5f) { //更换背景图片
            self.navigationView.bgImageView.image = [UIImage imageNamed:@"home_beijing_icon"];
        }else{
            self.navigationView.bgImageView.image = [UIImage imageNamed:@"home_daohang_icon"];
        }
        self.navigationView.bgImageView.alpha = alpha;
    }else{
        self.topBtn.hidden = YES;
        self.navigationView.bgImageView.image= nil;
        self.navigationView.bgImageView.image = [UIImage imageNamed:@"home_daohang_icon"];
        self.navigationView.bgImageView.alpha = 0.36f;
    }
}

#pragma mark - btn 点击事件
- (void)DoSomething{
    //到顶部
    [self.LJCollectionView setContentOffset:CGPointMake(0, 0) animated:YES];
}

#pragma mark --点击事件
- (void)messageBtnClick {
    UIViewController *vc = [NSClassFromString(@"LJNewsCenterViewController") new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
