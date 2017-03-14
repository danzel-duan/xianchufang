//
//  LJNavigationView.h
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>//高德地图
#import <AMapLocationKit/AMapLocationKit.h>//高德地图<>
@interface LJNavigationView : UIView
/*** 定位按钮 ***/
@property (weak, nonatomic) IBOutlet UIButton *locationBtn;
/*** 搜索框 ***/
@property (weak, nonatomic) IBOutlet UIView *searchView;

/*** 消息按钮 ***/
@property (weak, nonatomic) IBOutlet UIButton *messageBtn;
/*** 背景 ***/
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (nonatomic,strong) AMapLocationManager *locationManager;
@end
