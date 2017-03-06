//
//  LJVarietyCategoryViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 06/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJVarietyCategoryViewController.h"
#import "LJVarietyCategoryCollectionViewCell.h"
@interface LJVarietyCategoryViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionview;
/*** conllectionView的数据存放数组 ***/
@property (nonatomic,strong) NSMutableArray *conllectionArray;
@end

@implementation LJVarietyCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = self.titleStr;
    //测试
    self.conllectionArray = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"", nil];
    
    [self.collectionview registerClass:[LJVarietyCategoryCollectionViewCell class] forCellWithReuseIdentifier:@"LJVarietyCategoryCollectionViewCell"];
}

#pragma mark --collectionView
-(UICollectionView *)collectionview{
    if (!_collectionview) {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH , SCREEN_HEIGHT - 64) collectionViewLayout:flowlayout];
        flowlayout.minimumInteritemSpacing = 0;
        _collectionview.delegate = self;
        _collectionview.dataSource = self;
        _collectionview.backgroundColor = LJCommonBgColor;
        [self.view addSubview:_collectionview];
    }
    return _collectionview;
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
    [cell.shoppingCarBtn addTarget:self action:@selector(addShoppingCarClick) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark --每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(spaceEdgeW(180), spaceEdgeH(240));
}

#pragma mark 定义整个组UICollectionView 的 margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(spaceEdgeH(10), spaceEdgeH(5), 0, spaceEdgeH(5));
}

#pragma mark 返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark 返回这个UICollectionView是否可以被选择
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    UIViewController *vc = [NSClassFromString(@"LJGoodsDetailFatherViewController") new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark --加入购物车事件
- (void)addShoppingCarClick {
    LJLogFunc
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
