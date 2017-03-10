//
//  LJClassifyViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 13/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJClassifyViewController.h"
#import "LJCategoryCollectionViewCell.h"
#import "LJVarietyCategoryViewController.h"
@interface LJClassifyViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate>{
    NSInteger _page;  //页码
}
@property(nonatomic,strong)UICollectionView *collectionview;
/*** conllectionView的数据存放数组 ***/
@property (nonatomic,strong) NSMutableArray *conllectionArray;
/*** 标题header ***/
@property (nonatomic,strong) UICollectionReusableView *headerView;
@end

@implementation LJClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"分类";
    self.navigationController.delegate = self;
    self.tableView.frame = CGRectMake(0, 64, spaceEdgeW(75), SCREEN_HEIGHT - 113);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    _page = 0;
    
    //加banner
    [self addBannerView];
    
    
    [self.collectionview registerClass:[LJCategoryCollectionViewCell class] forCellWithReuseIdentifier:@"LJCategoryCollectionViewCell"];
    //测试数据
    self.dataArray = [NSMutableArray arrayWithObjects:@"热门推荐",@"绿叶蔬菜",@"水生蔬菜",@"食用菌类",@"根菜类",@"鲜豆类",@"花茎类",@"瓜果类",@"茄果类",@"薯芋类",@"推荐分类9",@"推荐分类10", nil];
    self.conllectionArray = [NSMutableArray arrayWithObjects:@"热门推荐",@"绿叶蔬菜",@"水生蔬菜",@"食用菌类",@"根菜类",@"鲜豆类",@"花茎类",@"瓜果类",@"茄果类", nil];
}

#pragma mark --collectionView
-(UICollectionView *)collectionview{
    if (!_collectionview) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(spaceEdgeW(75), 64 + spaceEdgeH(123), SCREEN_WIDTH - spaceEdgeW(75) , SCREEN_HEIGHT - spaceEdgeH(123) - 113) collectionViewLayout:flowlayout];
        _collectionview.delegate = self;
        _collectionview.dataSource = self;
        _collectionview.backgroundColor = LJCommonBgColor;
        [_collectionview registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        [self.view addSubview:_collectionview];
    }
    return _collectionview;
}

#pragma mark --banner
- (void)addBannerView {
    UIView *bannerView = [[UIView alloc] initWithFrame:CGRectMake(spaceEdgeW(75), 64, SCREEN_WIDTH - spaceEdgeW(75), spaceEdgeH(123))];
    bannerView.backgroundColor = LJRandomColor;
    [self.view addSubview:bannerView];
}

#pragma mark --tableView代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    if (_page == 0&&indexPath.row == 0) {
        cell.backgroundColor = LJCommonBgColor;  //初始化时第一个选中的颜色
    }
    for (id subView in cell.subviews) {   //移除所有子控件
        [subView removeFromSuperview];
    }
    UILabel *textL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, spaceEdgeW(75), spaceEdgeH(55))];
    [cell addSubview:textL];
    textL.text = self.dataArray[indexPath.row];
    textL.font = LJFontSize16;
    textL.textColor = LJFontColor26;
    textL.textAlignment = NSTextAlignmentCenter;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return spaceEdgeH(55);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _page = indexPath.row;
    [self.tableView reloadData];//为了其它未选中的cell的颜色变成白色
    UITableViewCell *cell2 = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell2.backgroundColor = LJCommonBgColor;
    [self.collectionview reloadData];
}

#pragma mark 定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (_page == 0) return 2;
    return 1;
}

#pragma mark UICollectionView cell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_page == 0) {
        return self.conllectionArray.count;
    }
    return self.dataArray.count;
}

#pragma mark 每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell1 = [collectionView dequeueReusableCellWithReuseIdentifier:@"LJCategoryCollectionViewCell" forIndexPath:indexPath];
    if (_page == 0) {
        cell1.backgroundColor = [UIColor whiteColor];
    }else{
        cell1.backgroundColor = LJCommonBgColor;
    }
    return cell1;
}

#pragma mark --每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_page == 0) return CGSizeMake(spaceEdgeW(90), spaceEdgeH(90));
    return CGSizeMake(spaceEdgeW(80), spaceEdgeH(90));
}

#pragma mark --列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (_page == 0) return 0;
    return 10;
}

#pragma mark --行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (_page == 0) return 0;
    return 5;
}

#pragma mark 定义整个组UICollectionView 的 margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (_page == 0) return UIEdgeInsetsMake(spaceEdgeH(10), spaceEdgeW(15), spaceEdgeH(20), spaceEdgeW(15));
    return UIEdgeInsetsMake(spaceEdgeH(10), spaceEdgeW(10), spaceEdgeH(20), spaceEdgeW(10));
}

#pragma mark 返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark 返回这个UICollectionView是否可以被选择
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (_page == 0) {
        UIViewController *vc = [NSClassFromString(@"LJGoodsDetailFatherViewController") new];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        LJVarietyCategoryViewController *vc = [LJVarietyCategoryViewController new];
        vc.isFull = NO;
        vc.titleStr = self.dataArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark --返回header
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (_page != 0) return nil;
    self.headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
    for (id subView in self.headerView.subviews) {
        [subView removeFromSuperview];
    }
    UILabel *titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(15), spaceEdgeH(5), SCREEN_WIDTH - spaceEdgeW(105), spaceEdgeH(27))];
    titleHeader.textColor = LJFontColor26;
    titleHeader.font = LJFontSize16;
    if (indexPath.section == 0) {
       titleHeader.text = @"热销食材";
    }else{
       titleHeader.text = @"星级精选";
    }
    titleHeader.backgroundColor = [UIColor whiteColor];
    [self.headerView addSubview:titleHeader];
    return self.headerView;
}

#pragma mark --返回header 的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (_page != 0) return CGSizeMake(0, 0);
    return CGSizeMake(SCREEN_WIDTH - spaceEdgeW(75), spaceEdgeH(20));
}

#pragma mark --判断是否为当前控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isShowSelf = [viewController isKindOfClass:[NSClassFromString(@"LJGoodsDetailFatherViewController") class]];
    [self.navigationController setNavigationBarHidden:isShowSelf animated:YES];//动画要设为YES，不然界面切换不连贯
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
