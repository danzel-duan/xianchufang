//
//  LJSearchView.h
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLKeyWordSearchView.h"
#import "NSData+DLExtension.h"
#import "LJSearchDetailView.h"

@protocol LJSearchViewDelegate <NSObject>
/*** 动态显示首页导航栏 ***/
- (void)anmimationShowHomeNavigation;
@end
@interface LJSearchView : UIView <DLKeyWordSearchDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *SearchBar;
@property (nonatomic,strong) LJSearchDetailView *SearchDetailView;
@property (nonatomic,strong) DLKeyWordSearchView *keyWordSearchView;
@property (nonatomic,weak) id <LJSearchViewDelegate> delegate;
@end
