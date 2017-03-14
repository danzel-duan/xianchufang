//
//  LJNavigationView.m
//  xianchufang
//
//  Created by zhenglong duan on 08/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJNavigationView.h"
#import "LJSearchView.h"
#import "LJLocationView.h"
#import "LJTooltip.h"
@implementation LJNavigationView

- (void)awakeFromNib {
    [super awakeFromNib];
    LJTooltip *tooltip = [[LJTooltip alloc] initWithToolTipStyle:ToolTipStyleAlert3];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    self.searchView.userInteractionEnabled = YES;
    [self.searchView addGestureRecognizer:tap];
    
    [self.locationBtn addTarget:self action:@selector(locationBtnClick) forControlEvents:UIControlEventTouchUpInside];
    /*** 定位 ***/
    self.locationManager = [[AMapLocationManager alloc] init];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    //定位超时时间，最低2s，此处设置为10s
    self.locationManager.locationTimeout = 10;
    //逆地理请求超时时间，最低2s，此处设置为10s
    self.locationManager.reGeocodeTimeout = 10;
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        if (error){
            [tooltip Alert3content:@"获取当前定位失败！" location:self.lj_centerY];
        }
        if (regeocode){
            [self.locationBtn setTitle:regeocode.district forState:UIControlStateNormal];
        }
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.locationManager = nil;
    });
}

- (void)tap {
    LJSearchView *searchView = [[NSBundle mainBundle] loadNibNamed:@"LJSearchView" owner:nil options:nil].lastObject;
    searchView.frame = LJwindow.bounds;
    searchView.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        self.searchView.lj_x -= 50;
        self.searchView.lj_y += 5;
        self.searchView.lj_width += 20;
        searchView.alpha = 1;
        [LJwindow addSubview:searchView];
    } completion:^(BOOL finished) {
        self.searchView.lj_x += 50;
        self.searchView.lj_y -= 5;
        self.searchView.lj_width -= 20;
    }];
}

- (void)locationBtnClick {
    //进行定位---->>>>>>
    LJLocationView *locationView = [[NSBundle mainBundle] loadNibNamed:@"LJLocationView" owner:nil options:nil].lastObject;
    locationView.frame = LJwindow.bounds;
    __weak typeof(self)weakSelf = self;
    locationView.backLocation = ^(NSString *location){
        if (location.length >= 4) {
            [weakSelf.locationBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
        }else {
           [weakSelf.locationBtn.titleLabel setFont:LJFontSize15];
        }
        [weakSelf.locationBtn setTitle:location forState:UIControlStateNormal];
    };
    [LJwindow addSubview:locationView];
    
}

@end
