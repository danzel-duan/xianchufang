//
//  LJNavigationView.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJNavigationView.h"
#import "LJSearchView.h"

@implementation LJNavigationView

- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    self.searchView.userInteractionEnabled = YES;
    [self.searchView addGestureRecognizer:tap];
    
    [self.locationBtn addTarget:self action:@selector(locationBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tap {
    LJSearchView *searchView = [[NSBundle mainBundle] loadNibNamed:@"LJSearchView" owner:nil options:nil].lastObject;
    searchView.frame = LJwindow.bounds;
    [LJwindow addSubview:searchView];
}

- (void)locationBtnClick {
    //进行定位---->>>>>>
    LJLogFunc
}

@end
