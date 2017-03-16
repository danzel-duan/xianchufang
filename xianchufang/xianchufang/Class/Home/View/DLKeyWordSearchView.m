//
//  DLKeyWordSearchView.m
//  DLKeyWordSearch
//
//  Created by zhenglong duan on 15/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "DLKeyWordSearchView.h"
#import "DLHotSearchView.h"
#import "DLKeyWordSearchViewCell.h"

@interface DLKeyWordSearchView ()<UITableViewDelegate,UITableViewDataSource,DLHotSearchViewDelegate,DLKeyWordSearchViewCellDelegate>
@property (nonatomic,strong) DLHotSearchView *hotSearchView;
@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,strong) UIView *clearAllKeyWordView;//清除历史记录view
@property (nonatomic,assign) CGFloat hotSearchViewHight;
@end

@implementation DLKeyWordSearchView

#pragma mark - 初始化视图函数

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _hotSearchViewHight = 5;
        [self addSubview:self.tableview];
        [self.tableview registerClass:[DLKeyWordSearchViewCell class] forCellReuseIdentifier:@"DLKeyWordSearchViewCell"];
    }
    return self;
}

- (DLHotSearchView *)hotSearchView {
    if (!_hotSearchView) {
        _hotSearchView = [[DLHotSearchView alloc] init];
        _hotSearchView.delegate = self;
    }
    return _hotSearchView;
}

- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableview.backgroundColor = [UIColor colorWithWhite:1 alpha:.95];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.scrollsToTop = NO;
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}

- (UIView *)clearAllKeyWordView {
    if (!_clearAllKeyWordView) {
        _clearAllKeyWordView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
        _clearAllKeyWordView.hidden = YES;
        _clearAllKeyWordView.userInteractionEnabled = YES;
        UIButton *clear = [[UIButton alloc]initWithFrame:CGRectMake(80, 5, WIDTH - 160, 30)];
        [clear setTitle:@"清除历史记录" forState:UIControlStateNormal];
        [clear setTitleColor:[UIColor colorWithWhite:.7 alpha:1] forState:UIControlStateNormal];
        clear.titleLabel.font = [UIFont systemFontOfSize:14];
        [clear addTarget:self action:@selector(clearSearchArr) forControlEvents:UIControlEventTouchUpInside];
        [_clearAllKeyWordView addSubview: clear];
    }
    return _clearAllKeyWordView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _tableview.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _tableview.tableFooterView = self.clearAllKeyWordView;
    _hotSearchView.frame = CGRectMake(0, 0, WIDTH, _hotSearchViewHight);
    _tableview.tableHeaderView = self.hotSearchView;
}

-(void)setKeyWordArray:(NSArray *)keyWordArray {
    _keyWordArray = keyWordArray;
}

#pragma mark --清除所有搜索记录
- (void)clearSearchArr {
    if ([self.delegate respondsToSelector:@selector(keyWordSearchViewClearAllKeyWord)]) {
        [self.delegate keyWordSearchViewClearAllKeyWord];
    }
}

#pragma mark --DLKeyWordSearchViewCell delegate
- (void)deleteKeyWordAtCell:(UITableViewCell *)cell keyWord:(NSString *)keyWord {
    NSIndexPath *indexpath = [self.tableview indexPathForCell:cell];
    if ([self.delegate respondsToSelector:@selector(keyWordSearchViewDeleteTheKeyWord:AtIndexPath:)]) {
        [self.delegate keyWordSearchViewDeleteTheKeyWord:keyWord AtIndexPath:indexpath];
    }
}

#pragma mark -- DLHotSearchView delegate
- (void)comeBackHight:(CGFloat)hight {
    _hotSearchViewHight = hight;
    [self setNeedsLayout];
}

- (void)clickHotSearchViewBackIndex:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(keyWordSearchViewBackIndex:)]) {
        [self.delegate keyWordSearchViewBackIndex:index];
    }
}

- (void)hiddenKeyBord {
    if ([self.delegate respondsToSelector:@selector(hiddenKeyBord)]) {
        [self.delegate hiddenKeyBord];
    }
}

#pragma mark --自己的方法函数
/*** 刷新某一行的关键字:相当于删除 ***/
- (void)refreshKeyWordViewAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableview deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    if (self.keyWordArray.count > 0) {
        self.tableview.tableFooterView.hidden = NO;
    }else {
        self.tableview.tableFooterView.hidden = YES;
    }
}

/*** 刷新搜索关键字列表 ***/
- (void)refreshKeyWordView {
    [self.tableview reloadData];
    if (self.keyWordArray.count > 0) {
        self.tableview.tableFooterView.hidden = NO;
    }else {
        self.tableview.tableFooterView.hidden = YES;
    }
}

#pragma mark -- 热搜
/*** 给热搜赋值 ***/
- (void)hotSearchViewGetData:(NSMutableArray *)dataArray {
    self.hotSearchView.hotDataArray = dataArray;
}

/*** 判断热搜是否有值 ***/
- (BOOL)isEmptyTheHotSearchView {
    if (self.hotSearchView.hotDataArray.count > 0) {
        return YES;  //有值
    }
    return NO;
}

//根据HotSearchView回调的index 从HotSearchView取到搜索关键字
- (NSString *)HotSearchViewComeBackKeywordByindex:(NSInteger)index {
    return self.hotSearchView.hotDataArray[index]; //返回对应的关键字
}

//当视图滚动时
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([self.delegate respondsToSelector:@selector(hiddenKeyBord)]) {
        [self.delegate hiddenKeyBord];
    }
}

/*** tableView代理 ***/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.keyWordArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return spaceEdgeH(44);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DLKeyWordSearchViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DLKeyWordSearchViewCell"];
    cell.delegate = self;
    cell.keyWordLabel.text = self.keyWordArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DLKeyWordSearchViewCell *cell = (DLKeyWordSearchViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    if ([self.delegate respondsToSelector:@selector(keyWordSearchViewClickOnTheKeyWord:)]) {
        [self.delegate keyWordSearchViewClickOnTheKeyWord:cell.keyWordLabel.text];
    }
}

@end
