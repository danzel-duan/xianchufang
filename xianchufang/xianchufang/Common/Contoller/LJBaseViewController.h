//
//  LJBaseViewController.h
//  meishimeike
//
//  Created by zhenglong duan on 11/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJBaseViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic,strong) UITableView *tableView;
/*** 存放数据的数组 ***/
@property (nonatomic,strong) NSMutableArray *dataArray;

#pragma mark -方法
/*** 加载数据 ***/
- (void)loadData;


@end
