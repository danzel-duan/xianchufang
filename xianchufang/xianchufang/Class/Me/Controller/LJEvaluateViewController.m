//
//  LJEvaluateViewController.m
//  xianchufang
//
//  Created by zhenglong duan on 16/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//    评价页面

#import "LJEvaluateViewController.h"
#import "LJTooltip.h"
#import "DLImagePickerController.h"

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
@property (nonatomic,strong) UILabel *tipLable1;

/*** 选择图片控制器 ***/
@property (nonatomic,strong) DLImagePickerController *imagePickerVc;
@property (nonatomic,strong) NSMutableArray  *imageArray;
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
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(goodsImageView.lj_right + spaceEdgeW(15), spaceEdgeH(8), 0, 0)];
    tipLabel.text = @"您对商品的满意度: 好评    ";
    tipLabel.textColor = LJFontColor4c;
    tipLabel.font = LJFontSize15;
    [tipLabel sizeToFit];
    [bgview addSubview:tipLabel];
    self.tipLable1 = tipLabel;
    
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
        btn.selected = YES;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [bgview addSubview:btn];
    }
    self.flowerNum = 5; //初始满意度
    
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
    
    /*** 图片选择器 ***/
    self.imagePickerVc = [[DLImagePickerController alloc] init];
    [self addChildViewController:self.imagePickerVc];
    self.imagePickerVc.view.frame = CGRectMake(0, evaluateView.lj_bottom + spaceEdgeH(10), SCREEN_WIDTH, spaceEdgeH(230));
    [self.view addSubview:self.imagePickerVc.view];
    __weak typeof(self)WeakSelf = self;
    self.imagePickerVc.DlImagePickerAcquirePhotosBlock = ^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        ///------->>>>在这上传选择好的图片;
        WeakSelf.imageArray = [NSMutableArray arrayWithArray:photos];
    };
    
    //这个block是用来当点击删除按钮时，对应删除当前图片数组里的图片
    self.imagePickerVc.DlImagePickerDeletePhotosAtIndexBlock = ^(NSInteger index) {
        [WeakSelf.imageArray removeObjectAtIndex:index];
    };
    
    self.evaluateBtn  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    self.evaluateBtn.backgroundColor = LJFontColored;
    self.evaluateBtn.lj_bottom = self.view.lj_bottom;
    [self.evaluateBtn setTitle:@"提交评价" forState:UIControlStateNormal];
    [self.evaluateBtn.titleLabel setFont:LJFontSize18];
    [self.evaluateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal
     ];
    [self.evaluateBtn addTarget:self action:@selector(evaluateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.evaluateBtn];
}


#pragma mark --点击评价
- (void)evaluateBtnClick:(UIButton *)sender {
    LJLog(@"self.imageArray:%@",self.imageArray);
    LJLog(@"已提交!  self.flowerNum:%ld",(long)self.flowerNum);
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
    switch (self.flowerNum) {
        case 1:
            self.tipLable1.text = @"您对商品的满意度: 差";
            break;
        case 2:
            self.tipLable1.text = @"您对商品的满意度: 不满意";
            break;
        case 3:
            self.tipLable1.text = @"您对商品的满意度: 中";
            break;
        case 4:
            self.tipLable1.text = @"您对商品的满意度: 一般";
            break;
        case 5:
            self.tipLable1.text = @"您对商品的满意度: 好评";
            break;
        default:
            break;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    if (self.textView.text.length == 0) {
        self.tipLabel.text = @"少于50字";
        [self.placeholder setHidden:NO];
    }else{
        [self.placeholder setHidden:YES];
        self.tipLabel.text = [NSString stringWithFormat:@"%ld/50",(unsigned long)self.textView.text.length];
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

- (void)dealloc
{
    self.imagePickerVc = nil;
    self.evaluateBtn = nil;
    self.textView = nil;
    self.placeholder = nil;
    self.tipLabel = nil;
    self.tipLable1 = nil;
    self.imageArray = nil;
}
@end
