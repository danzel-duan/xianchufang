//
//  LJMyCollectViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 22/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJMyCollectViewController.h"
#import "LJMyCollectCollectionViewCell.h"
@interface LJMyCollectViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectView; //
@end

@implementation LJMyCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的收藏";
    [self collectView];
}

- (UICollectionView *)collectView {
    if (!_collectView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.headerReferenceSize = CGSizeMake(0, 0);
        _collectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
        flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH - 20) / 2, spaceEdgeH(260));
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 20, 5);//上左下右 组的间距
        [_collectView registerClass:[LJMyCollectCollectionViewCell class] forCellWithReuseIdentifier:@"LJMyCollectCollectionViewCell"];
        _collectView.backgroundColor = LJCommonBgColor;
        _collectView.delegate = self;
        _collectView.dataSource = self;
        [self.view addSubview:_collectView];
    }
    return _collectView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LJMyCollectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LJMyCollectCollectionViewCell" forIndexPath:indexPath];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *VC = [NSClassFromString(@"LJMyCollectDetailViewController") new];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
