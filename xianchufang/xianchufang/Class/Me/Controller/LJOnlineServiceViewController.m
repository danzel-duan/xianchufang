//
//  LJOnlineServiceViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 24/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJOnlineServiceViewController.h"
#import "LJInputView.h"
@interface LJOnlineServiceViewController ()
/*** 输入框 ***/
@property (nonatomic,strong) LJInputView *InputView;
@end

@implementation LJOnlineServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"在线客服";
    self.tableView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 104);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = LJCommonBgColor;
    [self.view addSubview:self.tableView];
    
    [self addInputViewKeyBoard];
}

#pragma mark --添加输入框和注册键盘监听
- (void)addInputViewKeyBoard {
    self.InputView = [[LJInputView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 40, SCREEN_WIDTH, 40)];
    [self.view addSubview:self.InputView];
    //注册键盘监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KeyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KeyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickHide:)];
    [self.view addGestureRecognizer:tap];
}

#pragma mark --点击手势
- (void)ClickHide:(UITapGestureRecognizer *)tapGesture {
    [self.view endEditing:YES];
}

#pragma mark --键盘出现
- (void)KeyboardShow:(NSNotification *)Notification {
    //键盘位置及宽高
    CGRect keyBoardRect = [Notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.view.lj_y = -keyBoardRect.size.height;
    self.tableView.lj_y = keyBoardRect.size.height + 64;
    self.tableView.lj_height = SCREEN_HEIGHT - 104 - keyBoardRect.size.height;
}

#pragma mark --键盘消失
- (void)KeyboardHide:(NSNotification *)Notification {
    self.view.lj_y = 0;
    self.tableView.lj_y = 64;
    self.tableView.lj_height = SCREEN_HEIGHT - 104;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
