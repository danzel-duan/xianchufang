//
//  LJAddressSelectedViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 27/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJAddressSelectedViewController.h"
#import <AMapSearchKit/AMapSearchKit.h>//高德地图
#import <AMapFoundationKit/AMapFoundationKit.h>//高德地图
#import <AMapLocationKit/AMapLocationKit.h>//高德地图
#import <MAMapKit/MAMapKit.h>
@interface LJAddressSelectedViewController ()<MAMapViewDelegate, AMapSearchDelegate>
/** tableView:附近位置选择 **/
@property(nonatomic,strong)UITableView *LocationView;
/** 地图 **/
@property(nonatomic,strong)MAMapView *mapView;
/** search **/
@property(nonatomic,strong)AMapSearchAPI *search;
/*** 当前位置 ***/
@property (nonatomic,strong) CLLocation *currentLocation;
/*** 当前已定位地址 ***/
@property (nonatomic,strong) UILabel *currentLabel;
@end

@implementation LJAddressSelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"附近地址";
    [self setChildrenLayout];
}

#pragma mark --初始化子控件
- (void)setChildrenLayout {
    self.mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 64,SCREEN_WIDTH , SCREEN_HEIGHT / 3)];
    [self.view addSubview:self.mapView];
    self.mapView.delegate = self;
    self.mapView.mapType = MAMapTypeStandard;
    self.mapView.zoomLevel = 14.1;
    /***开启定位***/
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
    UILabel *Label = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(15), self.mapView.lj_bottom, 0, spaceEdgeH(40))];
    Label.text = @"当前位置:";
    [Label sizeToFit];
    [self.view addSubview:Label];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, Label.lj_bottom, SCREEN_WIDTH, spaceEdgeH(40))];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    /*** 当前地址 ***/
    self.currentLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(15), 0, SCREEN_WIDTH -spaceEdgeW(15), spaceEdgeH(40))];
    [self.currentLabel setFont:LJFontSize16];
    [view addSubview:self.currentLabel];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(currentLabelTap:)];
    self.currentLabel.userInteractionEnabled = YES;
    [self.currentLabel addGestureRecognizer:tap];
    /*** 附近地址选择 ***/
    self.LocationView = [[UITableView alloc] initWithFrame:CGRectMake(0, view.lj_bottom + 5, SCREEN_WIDTH, SCREEN_HEIGHT - (self.mapView.lj_height + spaceEdgeH(80) + 64))];
    self.LocationView.dataSource = self;
    self.LocationView.delegate = self;
    [self.view addSubview:self.LocationView];
    /***初始化searchAPi***/
    self.search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
}

#pragma mark --手势事件
- (void)currentLabelTap:(UITapGestureRecognizer *)tap {
    if (self.addressInfoblock) {
        self.addressInfoblock(self.currentLabel.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark --地图代理
- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation {
    _currentLocation = userLocation.location;
    AMapReGeocodeSearchRequest*request = [[AMapReGeocodeSearchRequest alloc] init];
    request.location = [AMapGeoPoint locationWithLatitude:_currentLocation.coordinate.latitude longitude:_currentLocation.coordinate.longitude];
    [self.search AMapReGoecodeSearch:request];
    [self initSearch];
}

#pragma mark --反编码
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response {
    NSString *str = response.regeocode.addressComponent.city;
    if (str.length == 0) {
        str = response.regeocode.addressComponent.province;
    }
    self.mapView.userLocation.title = str;
    self.mapView.userLocation.subtitle = response.regeocode.formattedAddress;
    self.currentLabel.text = response.regeocode.formattedAddress;
}

#pragma mark --初始化附近搜索
- (void)initSearch {
    AMapPOIAroundSearchRequest *aroundRequest = [[AMapPOIAroundSearchRequest alloc] init];
    aroundRequest.location = [AMapGeoPoint locationWithLatitude:_currentLocation.coordinate.latitude longitude:_currentLocation.coordinate.longitude];
    aroundRequest.types = @"餐饮服务|购物服务|生活服务|住宿服务|商务住宅|政府机构及社会团体|科教文化服务|交通设施服务|金融保险服务|公司企业|道路附属设施|地名地址信息|公共设施";
    aroundRequest.sortrule = 0;
    aroundRequest.requireExtension = YES;
    [self.search AMapPOIAroundSearch:aroundRequest];
}

- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response{
    self.dataArray = [NSMutableArray arrayWithArray:response.pois];
    [self.LocationView reloadData];
}

#pragma mark --tableView代理 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    AMapPOI *p = self.dataArray[indexPath.row];
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = p.address;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AMapPOI *p = self.dataArray[indexPath.row];
    NSString *address = [NSString stringWithFormat:@"%@%@%@",p.province,p.district,p.address];
    if (self.addressInfoblock) {
        self.addressInfoblock(address);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return spaceEdgeH(50);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
