//
//  LJOpinionViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 17/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJOpinionViewController.h"

@interface LJOpinionViewController ()<UITextViewDelegate>
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UILabel *label;
@end

@implementation LJOpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"意见反馈";
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(8, 84, SCREEN_WIDTH - 16, 130)];
    view.backgroundColor = [UIColor whiteColor];
    [view setLayerWithCr:5];
    [self.view addSubview:view];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, view.lj_width - 20, view.lj_height - 20)];

    [view addSubview:textView];
    textView.delegate =self;
    [textView setTextColor:[UIColor grayColor]];
    self.textView = textView;
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(3, 10, 200, 10)];
    self.label.backgroundColor = [UIColor whiteColor];
    self.label.text = @"写下你想对我们说的话.....";
    [self.label setTextColor:LJFontColor];
    [self.label setFont:[UIFont systemFontOfSize:12]];
    self.label.userInteractionEnabled = NO;
    [textView addSubview:self.label];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(28, view.lj_bottom + 34, SCREEN_WIDTH - 56, 44)];
    button.backgroundColor= LJTheMeColor;
    [button setTitle:@"提交" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [button addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    [button setLayerWithCr:5];
    [self.view addSubview:button];
}

- (void)textViewDidChange:(UITextView *)textView {
    if (self.textView.text.length == 0) {
        [self.label setHidden:NO];
    }else{
        [self.label setHidden:YES];
    }
}

- (void)Click {
    LJLogFunc
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
