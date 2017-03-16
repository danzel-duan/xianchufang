//
//  LJEvaluateViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 16/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//    评价页面

#import "LJEvaluateViewController.h"
#import "LJTooltip.h"
@interface LJEvaluateViewController ()<UITextViewDelegate>
/*** 花朵数 ***/
@property (nonatomic,assign) NSInteger flowerNum;
/*** 评价按钮 ***/
@property (nonatomic,strong) UIButton *evaluateBtn;
/*** 提示Label ***/
@property (nonatomic,strong) UILabel *placeholder;
/*** 输入框 ***/
@property (nonatomic,strong) UITextView *textView;
/*** 少于多少字 ***/
@property (nonatomic,strong) UILabel *tipLabel;
@end

@implementation LJEvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"商品评价";
    self.view.backgroundColor = LJCommonBgColor;
    //评价背景
    UIView *bgview = [[UIView alloc] initWithFrame:CGRectMake(spaceEdgeW(10), 74, SCREEN_WIDTH - spaceEdgeW(20), spaceEdgeH(110))];
    bgview.backgroundColor = [UIColor whiteColor];
    [bgview setLayerWithCr:5];
    [bgview setBgShadow];
    [self.view addSubview:bgview];
    
    //商品图片
    UIImageView *goodsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, spaceEdgeH(5), spaceEdgeW(100), spaceEdgeW(100))];
    goodsImageView.backgroundColor = LJRandomColor;
    [bgview addSubview:goodsImageView];
    //提示文字
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(goodsImageView.lj_right + spaceEdgeW(15), spaceEdgeH(5), 0, 0)];
    tipLabel.text = @"您对商品的满意度";
    tipLabel.textColor = LJFontColor4c;
    tipLabel.font = LJFontSize15;
    [tipLabel sizeToFit];
    [bgview addSubview:tipLabel];
    
    //评论满意度
    CGFloat y = tipLabel.lj_bottom + spaceEdgeH(30);
    CGFloat x = goodsImageView.lj_right;
    CGFloat w = spaceEdgeW(42);
    CGFloat h = spaceEdgeH(22);
    for (int  i = 0; i < 5; i ++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x + i * w, y, w, h)];
        [btn setImage:[UIImage imageNamed:@"me_evaluate_icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"me_evaluate_selected_icon"] forState:UIControlStateSelected];
        btn.tag = i + 3020;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [bgview addSubview:btn];
    }
    
    //评论区
    UIView *evaluateView = [[UIView alloc] initWithFrame:CGRectMake(spaceEdgeW(10), bgview.lj_bottom + spaceEdgeH(10), spaceEdgeW(270), spaceEdgeH(100))];
    evaluateView.backgroundColor = [UIColor whiteColor];
    evaluateView.layer.borderColor = LJCutLineColor.CGColor;
    evaluateView.layer.borderWidth = 1;
    [evaluateView setLayerWithCr:3];
    [self.view addSubview:evaluateView];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(spaceEdgeW(3), spaceEdgeH(3), evaluateView.lj_width - spaceEdgeW(6), evaluateView.lj_height - spaceEdgeH(6))];
    textView.delegate = self;
    textView.tintColor = LJFontColor61;
    textView.font = LJFontSize14;
    textView.textColor = LJFontColor61;
    [evaluateView addSubview:textView];
    self.textView = textView;
    
    self.placeholder = [[UILabel alloc] initWithFrame:CGRectMake(spaceEdgeW(10), spaceEdgeH(15), spaceEdgeW(150), spaceEdgeH(15))];
    self.placeholder.text = @"输入你的评价...";
    self.placeholder.font = LJFontSize14;
    self.placeholder.textColor = LJFontColor88;
    [evaluateView addSubview:self.placeholder];
    
    UILabel *tipLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(evaluateView.lj_right, 0, spaceEdgeW(70), spaceEdgeH(13))];
    tipLabel1.lj_bottom = evaluateView.lj_bottom;
    tipLabel1.text = @"少于50字";
    tipLabel1.textColor = LJFontColor61;
    tipLabel1.font = LJFontSize12;
    [self.view addSubview:tipLabel1];
    self.tipLabel = tipLabel1;
    
    self.evaluateBtn  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    self.evaluateBtn.backgroundColor = LJFontColorc3;
    self.evaluateBtn.lj_bottom = self.view.lj_bottom;
    [self.evaluateBtn setTitle:@"提交评价" forState:UIControlStateNormal];
    [self.evaluateBtn.titleLabel setFont:LJFontSize18];
    [self.evaluateBtn setTitleColor:LJFontColor4c forState:UIControlStateNormal
     ];
    [self.evaluateBtn addTarget:self action:@selector(evaluateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.evaluateBtn];
}


#pragma mark --点击评价
- (void)evaluateBtnClick:(UIButton *)sender {
    if ([sender.backgroundColor isEqual:LJFontColorc3]) {
        LJTooltip *tip = [[LJTooltip alloc] initWithToolTipStyle:ToolTipStyleAlert3];
        [tip Alert3content:@"请输入评价内容!" location:self.view.lj_centerY + 200];
    }else {
        LJLog(@"已提交!");
    }
}

#pragma mark --点击花的操作
- (void)click:(UIButton *)sender {
    self.flowerNum = sender.tag - 3019;
    for (int i = 0; i<= 4; i++) {
        UIButton *but = (UIButton *)[self.view viewWithTag:i + 3020];
        but.selected = NO;
    }
    for (int i = 0; i<= self.flowerNum - 1; i++) {
        UIButton *but = (UIButton *)[self.view viewWithTag:i + 3020];
        but.selected = YES;
    }
    if (self.textView.text.length == 0) {
        self.evaluateBtn.backgroundColor = LJFontColorc3;
        [self.evaluateBtn setTitleColor:LJFontColor4c forState:UIControlStateNormal];
    }else{
        self.evaluateBtn.backgroundColor = LJFontColored;
        [self.evaluateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
}

- (void)textViewDidChange:(UITextView *)textView {
    LJLog(@"%ld",self.flowerNum);
    if (self.textView.text.length == 0) {
        self.tipLabel.text = @"少于50字";
        [self.placeholder setHidden:NO];
        self.evaluateBtn.backgroundColor = LJFontColorc3;
        [self.evaluateBtn setTitleColor:LJFontColor4c forState:UIControlStateNormal];
    }else{
        if (self.flowerNum > 0) {
            self.evaluateBtn.backgroundColor = LJFontColored;
            [self.evaluateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else {
            self.evaluateBtn.backgroundColor = LJFontColorc3;
            [self.evaluateBtn setTitleColor:LJFontColor4c forState:UIControlStateNormal];
        }
        [self.placeholder setHidden:YES];
        self.tipLabel.text = [NSString stringWithFormat:@"%ld/50",self.textView.text.length];
    }
}

#pragma mark --判断长度
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if (textView.text.length - range.length + text.length > 50) {
        return NO;
    }
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
