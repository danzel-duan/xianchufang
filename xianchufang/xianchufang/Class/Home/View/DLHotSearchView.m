//
//  DLHotSearchView.m
//  DLKeyWordSearch
//
//  Created by zhenglong duan on 15/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "DLHotSearchView.h"

static const NSInteger space = 10; //两个按钮之间的间距
@interface DLHotSearchView ()
/*** 顶部标题提示Label ***/
@property (nonatomic,strong) UILabel *topTitleLabel;
/*** 存放绘制图形的frame ***/
@property (nonatomic,strong) NSMutableArray *rectArray;
@end

@implementation DLHotSearchView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hotDataArray = [NSMutableArray array];
        self.rectArray = [NSMutableArray array];
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.topTitleLabel];
    }
    return self;
}

- (void)setHotDataArray:(NSMutableArray *)hotDataArray {
    _hotDataArray = hotDataArray;
    [self calculateHight]; //计算高度
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setNeedsDisplay]; //异步在主线程绘制UI
    });
}

#pragma mark --计算高度
- (void)calculateHight {
    if (_hotDataArray.count > 0) {
        CGFloat y = 40;
        CGFloat hight = FontSize.lineHeight + space; //行高
        CGFloat locationMax_x = [self calculateWidthWithIndex:0]; //用来记录绘制下一个图形时它的最右边的x值，如果大于屏幕宽度 - space 就换行
        for (NSInteger i = 0; i < _hotDataArray.count; i++) {
            if (locationMax_x > WIDTH - space) {  //换行
                locationMax_x = [self calculateWidthWithIndex:i];
                y += hight + space;
            }
            if (i!= _hotDataArray.count - 1) {
                locationMax_x += [self calculateWidthWithIndex:i + 1];//如果不是数组中最后一个locationMax_x的一直增加
            }
        }
        if ([self.delegate respondsToSelector:@selector(comeBackHight:)]) {
            [self.delegate comeBackHight:y + FontSize.lineHeight + 25]; //让代理者设置自己的高度
        }
    }
}

#pragma mark --绘制图形
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (_hotDataArray.count > 0) {
        self.topTitleLabel.hidden = NO;
        CGFloat x = 0;
        CGFloat y = 40;
        CGFloat hight = FontSize.lineHeight + space; //行高
        CGFloat locationMax_x = [self calculateWidthWithIndex:0]; //用来记录绘制下一个图形时它的最右边的x值，如果大于屏幕宽度 - space 就换行
        for (NSInteger i = 0; i < _hotDataArray.count; i++) {
            NSString *text = _hotDataArray[i]; //取出当前文字
            if (locationMax_x > WIDTH - space) {  //换行
                locationMax_x = [self calculateWidthWithIndex:i];
                x = 0;
                y += hight + space;
            }
            CGFloat width = [self calculateWidthWithIndex:i]; //当前图形的宽度
            /*** 将此时的rect存放在数组里:width - 5 是保证横向间距为5 ***/
            [self.rectArray addObject:[NSValue valueWithCGRect:CGRectMake(x + space, y, width - 5, hight)]];
            /*** 绘制边框 ***/
            UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(x + space, y, width - 5, hight) cornerRadius:5.0f];
            [[UIColor colorWithWhite:0.8 alpha:0.5] setStroke]; //设置边框颜色,这句一定要在下一句前面
            [roundedRect strokeWithBlendMode:kCGBlendModeNormal alpha:1];
            NSDictionary* attribute = @{ NSForegroundColorAttributeName:[UIColor colorWithWhite:.3 alpha:1], NSFontAttributeName:[UIFont boldSystemFontOfSize:14]};
            /*** 文字size ***/
            CGSize textSize = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, hight) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
            /*** 文字frame ***/
            CGRect textRect = CGRectMake(x + 10 + (width - 5 - textSize.width) /2 ,y + (hight - textSize.height) /2, textSize.width, textSize.height);
            /*** 绘制 ***/
            [text drawInRect:textRect withAttributes:attribute];
            if (i!= _hotDataArray.count - 1) {
                locationMax_x += [self calculateWidthWithIndex:i + 1];//如果不是数组中最后一个locationMax_x的一直增加
            }
            x += width;
        }
    }
}

#pragma mark --点击屏幕事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentClickPoint = [touch locationInView:self]; //当前点击位置
    for (NSInteger i = 0; i <self.rectArray.count; i++) {
        CGRect rect = [self.rectArray[i] CGRectValue];
        /*** 判断点击的位置是否在某个rect内 ***/
        if (currentClickPoint.x > rect.origin.x&&currentClickPoint.x < rect.origin.x + rect.size.width&&currentClickPoint.y >rect.origin.y &&currentClickPoint.y < rect.origin.y + rect.size.height) {
            if ([self.delegate respondsToSelector:@selector(clickHotSearchViewBackIndex:)]) {
                [self.delegate clickHotSearchViewBackIndex:i];break;//找到了就跳出循环
            }
        }else {
            if ([self.delegate respondsToSelector:@selector(hiddenKeyBord)]) {
                [self.delegate hiddenKeyBord]; //让代理隐藏键盘
            }
        }
    }
}

#pragma mark --根据数据源数组对应下标的文字计算宽度
- (CGFloat)calculateWidthWithIndex:(NSInteger)index {
    NSString *text = _hotDataArray[index];
    CGFloat hight = FontSize.lineHeight + space; //行高
    CGRect frame = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, hight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:FontSize} context:nil];
    return frame.size.width + 40;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    _topTitleLabel.frame = CGRectMake(15, 5, WIDTH - 30, 30);
}

#pragma mark --懒加载
- (UILabel *)topTitleLabel {
    if (!_topTitleLabel) {
        _topTitleLabel = [[UILabel alloc] init];
        _topTitleLabel.text = @"大家都在搜...";
        _topTitleLabel.hidden = YES;
        _topTitleLabel.textAlignment = NSTextAlignmentLeft;
        _topTitleLabel.backgroundColor = [UIColor clearColor];
        _topTitleLabel.textColor = [UIColor colorWithWhite:.5 alpha:1];
        _topTitleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _topTitleLabel;
}
@end
