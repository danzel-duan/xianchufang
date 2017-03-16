//
//  LJSearchView.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJSearchView.h"

@implementation LJSearchView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.SearchBar.delegate = self;
    self.keyWordSearchView = [[DLKeyWordSearchView alloc] initWithFrame:CGRectMake(0, 65, WIDTH, HEIGHT - 72)];
    self.keyWordSearchView.delegate = self;
    [self addSubview:self.keyWordSearchView];
    //测试热搜
    NSMutableArray * array = [NSMutableArray arrayWithObjects:@"小白兔",@"红豆",@"逛逛",@"你爸",@"老大哥暂时无法",@"下晨吐", nil];
    [self.keyWordSearchView hotSearchViewGetData:array]; //这里可以获取网络数据
}

#pragma mark --DLKeyWordSearchView的代理
/*** 点击某个搜索记录 ***/
- (void)keyWordSearchViewClickOnTheKeyWord:(NSString *)keyWord {
    [self searchByKeyword:keyWord]; //存数据
    self.SearchBar.text = keyWord;
    [self.SearchBar becomeFirstResponder];
}
/*** 删除某个搜索记录 ***/
- (void)keyWordSearchViewDeleteTheKeyWord:(NSString *)keyWord AtIndexPath:(NSIndexPath *)indexPath {
    [NSData clearCharacterByCharacter:keyWord formFile:@"search.dat"];
    self.keyWordSearchView.keyWordArray = [NSData getCharacterFromFile:@"search.dat"];
    [self.keyWordSearchView refreshKeyWordViewAtIndexPath:indexPath]; //删除哪一行就刷新哪一行
}
/*** 删除所有搜索记录 ***/
- (void)keyWordSearchViewClearAllKeyWord {
    [NSData clearCharacterformFile:@"search.dat"];
    [self reloadSearch];
}
/*** 根据返回数据源的下标值来返回给持有者 ***/
- (void)keyWordSearchViewBackIndex:(NSInteger)index {
    /*** 如果是点击热搜，也要将热搜的字符存到沙盒中 ***/
    [self searchByKeyword:[self.keyWordSearchView HotSearchViewComeBackKeywordByindex:index]];
    self.SearchBar.text = [self.keyWordSearchView HotSearchViewComeBackKeywordByindex:index];
    [self.SearchBar becomeFirstResponder];
}

/*** 隐藏键盘 ***/
- (void)hiddenKeyBord {
    [self.SearchBar resignFirstResponder];
}

- (void)reloadSearch{
    /*** 从沙盒的Document中的search.dat文件里获取数据 ***/
    self.keyWordSearchView.keyWordArray = [NSData getCharacterFromFile:@"search.dat"];
    [self.keyWordSearchView refreshKeyWordView];
}

- (void)searchByKeyword:(NSString *)keyWord {
    /*** 将数据存放到沙盒Document中的search.dat文件里 ***/
    [NSData writeToDocumentPathFile:@"search.dat" character:keyWord];
    [self hiddenKeyBord];
}

//searchBar 响应键盘  一定要设置代理
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    if ([self.subviews indexOfObject:self.SearchDetailView] != NSNotFound) {
        [self.SearchDetailView removeFromSuperview];
    }
    //如果当前页面上没有self.keyWordSearchView就加上
    if ([self.subviews indexOfObject:self.keyWordSearchView] == NSNotFound) {
        [self addSubview:self.keyWordSearchView];
    }
    [self reloadSearch];
}


/*** 点击键盘上的搜索按钮进行搜索 ***/
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self searchByKeyword:searchBar.text];
    
    ///---------->>>>>>在这将要搜索的值传到下个界面，并移除当前页面
    if ([self.subviews indexOfObject:self.SearchDetailView] == NSNotFound) {
        [self addSubview:self.SearchDetailView];
    }
    [self.keyWordSearchView removeFromSuperview];
}

#pragma mark --搜索详情界面
- (LJSearchDetailView *)SearchDetailView {
    if (!_SearchDetailView) {
        _SearchDetailView = [[LJSearchDetailView alloc] initWithFrame:CGRectMake(0, 65, SCREEN_WIDTH, SCREEN_HEIGHT - 65)];
    }
    return _SearchDetailView;
}

- (IBAction)SearchBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(anmimationShowHomeNavigation)]) {
        [self.delegate anmimationShowHomeNavigation];
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
       [self removeFromSuperview];
    }];
}

@end
