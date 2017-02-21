//
//  LJRootViewController.m
//  meishimeike
//
//  Created by zhenglong duan on 20/12/2016.
//  Copyright © 2016 zhenglong duan. All rights reserved.
//

#import "LJRootViewController.h"
#import "LJBaseNavigationController.h"
#define kClassKey @"RootVC"
#define kTitleKey @"title"
#define kImageKey @"imageName"
#define kSelImageKey @"selectdImageName"
@interface LJRootViewController ()

@end

@implementation LJRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*** 子控制器  ***/
    NSArray *childVCArray = @[@{kClassKey:@"LJHomeViewController",
                                kTitleKey:@"首页",
                                kImageKey:@"tabbar_home_icon",
                                kSelImageKey:@"tabbar_home_selected_icon"},
                              @{kClassKey:@"LJClassifyViewController",
                                kTitleKey:@"分类",
                                kImageKey:@"tabbar_classify_icon",
                                kSelImageKey:@"tabbar_classify_icon_selected"},
                              @{kClassKey:@"LJShoppingCartViewController",
                                kTitleKey:@"购物车",
                                kImageKey:@"tabbar_shopping_icon",
                                kSelImageKey:@"tabbar_shopping_icon_selected"},
                              @{kClassKey:@"LJMeViewController",
                                kTitleKey:@"我的",
                                kImageKey:@"tabbar_me_icon",
                                kSelImageKey:@"tabbar_me_icon_selected"}];
    [childVCArray enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *Vc = [NSClassFromString(dic[kClassKey]) new];
        Vc.title = dic[kTitleKey];
        LJBaseNavigationController *nav = [[LJBaseNavigationController alloc] initWithRootViewController:Vc];
        UITabBarItem *BarItem = nav.tabBarItem;
        BarItem.title = dic[kTitleKey];
        BarItem.image = [UIImage imageNamed:dic[kImageKey]];
        BarItem.selectedImage = [[UIImage imageNamed:dic[kSelImageKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; //防止图标渲染
        [self addChildViewController:nav];
    }];
    [self UnifyText];
    self.selectedIndex = 2;
}

#pragma mark--统一文字属性
- (void)UnifyText {
    /*** 正常状态  ***/
    NSMutableDictionary *textNormal = [NSMutableDictionary dictionary];
    textNormal[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    textNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    /*** 选中状态  ***/
    NSMutableDictionary *textSelect = [NSMutableDictionary dictionary];
    textSelect[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    textSelect[NSForegroundColorAttributeName] = LJTheMeColor;
    /*** 用appearance统一文字属性  ***/
    self.tabBarItem = [UITabBarItem appearance];
    [self.tabBarItem setTitleTextAttributes:textNormal forState:UIControlStateNormal];
    [self.tabBarItem setTitleTextAttributes:textSelect forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
