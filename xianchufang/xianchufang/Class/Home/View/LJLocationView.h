//
//  LJLocationView.h
//  xianchufang
//
//  Created by zhenglong duan on 14/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>//高德地图
#import <AMapLocationKit/AMapLocationKit.h>//高德地图<>
typedef void (^backLocationblock)(NSString *); //返回一个地区名称
@interface LJLocationView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UILabel *LocationLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy) backLocationblock backLocation;
@property (nonatomic,strong) AMapLocationManager *locationManager;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSString *city;
@end
