//
//  LJRadDot.m
//  xianchufang
//
//  Created by zhenglong duan on 14/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJRadDot.h"

@implementation LJRadDot

- (void)showRadDotOnObject:(id)object text:(NSString *)text {
    CGFloat W ;
    CGFloat H ;
    CGFloat X ;
    CGFloat Y ;
    if ([object isKindOfClass:[UIView class]]){
       UIView* obj = (UIView *)object;
        if (obj.tag == 1111) {
            W = obj.lj_width * 0.25;
            H = W;
            X = obj.lj_width - W*3.1;
            Y = W * 0.005;
            self.btn =(UIButton*)obj;
        }else{
            W = obj.lj_width * 0.25;
            H = W;
            X = obj.lj_width - W*1.8;
            Y = W * 0.6;
        }
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(X, Y, W, H)];
    view.backgroundColor = [UIColor redColor];
    view.tag = 10001;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius  = W *0.5;
    [object addSubview:view];
    if (self.drag) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(PanRecognizer:)];
        view.userInteractionEnabled = YES;
        [view addGestureRecognizer:pan];
    }
    /*** 内容 ***/
    UILabel * textL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.lj_width, view.lj_height *0.6)];
    textL.lj_centerY = view.lj_height * 0.5;
    textL.backgroundColor = [UIColor clearColor];
    [textL setTextAlignment:NSTextAlignmentCenter];
    if ([text intValue]>=99) {
        textL.text =@"99+";
        view.lj_width = view.lj_width * 1.4;
        textL.lj_width = view.lj_width * 1.1;
        [textL setFont:[UIFont systemFontOfSize:10 weight:UIFontWeightLight]];
    }else{
        textL.text = text;
        [textL setFont:[UIFont systemFontOfSize:10 weight:UIFontWeightLight]];
    }
    [textL setTextColor:[UIColor whiteColor]];
    [view addSubview:textL];
}

- (void)PanRecognizer:(UIPanGestureRecognizer*)rec {
    NSLog(@"33");
    CGPoint currentPoint=rec.view.center;
    CGPoint point = [rec translationInView:LJwindow];
    rec.view.center = CGPointMake(currentPoint.x+point.x, currentPoint.y +point.y);
    [rec setTranslation:CGPointZero inView:LJwindow];
}

- (void)hideRadDotOnObject:(UIView *)object {
    for (UIView *subView in object.subviews) {
        if (subView.tag ==10001) {
            [subView removeFromSuperview];
        }
    }
}

@end
