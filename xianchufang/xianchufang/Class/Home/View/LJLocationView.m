//
//  LJLocationView.m
//  xianchufang
//
//  Created by zhenglong duan on 14/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJLocationView.h"
#import "LJTooltip.h"
@implementation LJLocationView

-(void)awakeFromNib {
    [super awakeFromNib];
    [self loadInfo];
    [self configBaseInfo];
    
}

- (void)loadInfo {
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"]];
    self.dataArray = dic[@"citys"];
}

//配置基本信息
- (void)configBaseInfo {
    LJTooltip *tooltip = [[LJTooltip alloc] initWithToolTipStyle:ToolTipStyleAlert3];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    self.LocationLabel.userInteractionEnabled = YES;
    [self.LocationLabel addGestureRecognizer:tap];
    
    self.tableView.delegate = self;
    self.tableView.dataSource= self;
    
    /*** 定位 ***/
    self.locationManager = [[AMapLocationManager alloc] init];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    //定位超时时间，最低2s，此处设置为10s
    self.locationManager.locationTimeout =10;
    //逆地理请求超时时间，最低2s，此处设置为10s
    self.locationManager.reGeocodeTimeout = 10;
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        if (error){
            [tooltip Alert3content:@"获取当前定位失败！" location:self.lj_centerY];
        }
        if (regeocode){
            self.LocationLabel.text = [NSString stringWithFormat:@"%@-%@",regeocode.city,regeocode.district];
            self.city = regeocode.district;
        }
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSString *cityStr = self.dataArray[indexPath.row];
    cell.textLabel.attributedText = [self attrstr:[NSString stringWithFormat:@"上海市-%@区(暂未开设,系统更新中...)",cityStr] dic1:@{NSForegroundColorAttributeName:LJFontColor39,NSFontAttributeName:LJFontSize16} dic2:@{NSForegroundColorAttributeName:LJFontColor61,NSFontAttributeName:LJFontSize14} loc1:0 len1:cityStr.length + 5 loc2:cityStr.length + 5 len2:15];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.backLocation) {
        self.backLocation([NSString stringWithFormat:@"%@区",self.dataArray[indexPath.row]]);
    }
    [self setNull];
    [self removeFromSuperview];
}

#pragma mark --富文本
- (NSMutableAttributedString *)attrstr:(NSString *)str dic1:(NSDictionary *)dic1 dic2:(NSDictionary *)dic2  loc1:(NSUInteger)loc1 len1:(NSUInteger)len1 loc2:(NSUInteger)loc2 len2:(NSUInteger)len2 {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:str];
    [attr addAttributes:dic1 range:NSMakeRange(loc1, len1)];
    [attr addAttributes:dic2 range:NSMakeRange(loc2, len2)];
    return attr;
}

- (void)tap {
    if (self.backLocation) {
        self.backLocation(self.city);
    }
    [self setNull];
    [self removeFromSuperview];
}

#pragma mark --置空
- (void)setNull {
    self.locationManager = nil;
    self.tableView = nil;
    self.backLocation = nil;
    self.dataArray = nil;
}

#pragma mark --退出当前页面
- (IBAction)backClick:(UIButton *)sender {
    [self setNull];
    [self removeFromSuperview];
}

@end
