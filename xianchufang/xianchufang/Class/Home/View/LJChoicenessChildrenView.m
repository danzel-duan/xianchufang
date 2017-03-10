//
//  LJChoicenessChildrenView.m
//  xianchufang
//
//  Created by zhenglong duan on 10/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJChoicenessChildrenView.h"
#import "LJChoicenessCollectionViewCell.h"
@interface LJChoicenessChildrenView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/*** 主要 :CollectionView ***/
@property (nonatomic,strong) UICollectionView *LJCollectionView;

@end
@implementation LJChoicenessChildrenView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureCollectionView];
    }
    return self;
}

#pragma mark --configureCollectionView
- (void)configureCollectionView {
    //1.创建流水布局(布局对象)
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 1;
    flowLayout.itemSize = CGSizeMake(spaceEdgeW(124), spaceEdgeH(140));
    //2.创建UICollectionView对象, 将layout添加到collectionViewLayout:里面
    self.LJCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    //3.设置UICollectionView基本属性
    self.LJCollectionView.backgroundColor = LJCommonBgColor;
    self.LJCollectionView.delegate = self;
    self.LJCollectionView.dataSource = self;
    self.LJCollectionView.showsVerticalScrollIndicator = NO;
    [self.LJCollectionView registerClass:[LJChoicenessCollectionViewCell class] forCellWithReuseIdentifier:@"LJChoicenessCollectionViewCell"];
    [self addSubview:self.LJCollectionView];
}

#pragma mark --collectionView DataSource
//返回多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
//每组多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 20;
}

//显示cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LJChoicenessCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LJChoicenessCollectionViewCell" forIndexPath:indexPath];
    return cell;
}

#pragma mark --collectionView Delegate
// 返回这个UICollectionView是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
//UICollectionView被选中的时候调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellClick) {
        self.cellClick();
    }    
}

//动态设置某组尾视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(0, 20);
}

@end
