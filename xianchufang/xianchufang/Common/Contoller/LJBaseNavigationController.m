//
//  LJBaseNavigationController.m
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJBaseNavigationController.h"

@interface LJBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation LJBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName :[UIFont systemFontOfSize:18]}]; //字体
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark--重写push方法 目的：拦截所有push进来的子控制器
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count>0) {
        //重写返回键
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
        [backBtn sizeToFit];
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

//返回
- (void)back {
    [self popViewControllerAnimated:YES];
}

#pragma mark--<UIGestureRecognizerDelegate>手势识别器对象会调用这个代理方法来决定手势是否有效
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 手势何时有效 : 当导航控制器的子控制器个数 > 1就有效
    return self.childViewControllers.count > 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
