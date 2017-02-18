//
//  LJCheckUpdateViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 17/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJCheckUpdateViewController.h"

@interface LJCheckUpdateViewController ()

@property (nonatomic,strong) UILabel *updateL;
@end

@implementation LJCheckUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"检测更新";
    [self addimageView];
    
}

- (void)addimageView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 92, 100, 100)];
    imageView.lj_centerX = SCREEN_WIDTH / 2;
    imageView.image = [UIImage imageNamed:@"my_logo_icon"];
    [self.view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.lj_bottom + 20,60, 20)];
    label.text = @"鲜厨坊";
    label.textAlignment = NSTextAlignmentCenter;
    label.lj_centerX = self.view.lj_centerX ;
    [self.view addSubview:label];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, label.lj_bottom + 78, SCREEN_WIDTH, 44)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(BgViewClick)];
    [bgView addGestureRecognizer:tap];
    [self.view addSubview:bgView];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(11, 13, 0, 0)];
    label1.text = @"检查更新";
    [label1 setTextColor:LJFontColor];
    [label1 setFont:LJFontSize];
    [label1 sizeToFit];
    [bgView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, 14, 50, 20)];
    label2.text = @"v 2.3.0";
    [label2 setTextColor:LJFontColor];
    [label2 setFont:[UIFont systemFontOfSize:14]];
    [bgView addSubview:label2];
    self.updateL = label2;
    
    UILabel *label3 =[[ UILabel alloc] initWithFrame:CGRectMake(80, SCREEN_HEIGHT - 70, 220, 15)];
    [label3 setTextColor:LJFontColor];
    label3.lj_centerX = SCREEN_WIDTH /2;
    [label3 setFont:[UIFont systemFontOfSize:12]];
    label3.text = @"上海邻巨网络有限公司 版权所有";
    label3.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label3];
    
    UILabel *label4 =[[ UILabel alloc] initWithFrame:CGRectMake(50, SCREEN_HEIGHT - 54, 240, 15)];
    [label4 setTextColor:LJFontColor];
    label4.lj_centerX = SCREEN_WIDTH /2;
    label4.textAlignment = NSTextAlignmentCenter;
    [label4 setFont:[UIFont systemFontOfSize:12]];
    label4.text = @"Copyright @ 2016-11 All Rights Reserved";
    [self.view addSubview:label4];
}

- (void)BgViewClick {
    LJLogFunc
    if (self.checkblock) {
        self.checkblock(self.updateL.text);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
