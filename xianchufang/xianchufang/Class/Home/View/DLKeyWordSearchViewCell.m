//
//  DLKeyWordSearchViewCell.m
//  DLKeyWordSearch
//
//  Created by zhenglong duan on 15/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "DLKeyWordSearchViewCell.h"

@implementation DLKeyWordSearchViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.keyWordLabel];
        [self.contentView addSubview:self.deleteKeyWordBtn];
        [self.contentView addSubview:self.lineView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _deleteKeyWordBtn.frame = CGRectMake(self.contentView.frame.size.width - self.contentView.frame.size.height, 0, 20, 20);
    _deleteKeyWordBtn.lj_centerY = self.contentView.lj_height / 2;
    _keyWordLabel.frame = CGRectMake(10, 0, self.contentView.frame.size.width- self.contentView.frame.size.height - 10, self.contentView.frame.size.height - 1);
    _lineView.frame = CGRectMake(10, self.contentView.frame.size.height - 1, self.contentView.frame.size.width - 20, 0.5);
}

#pragma mark --懒加载
- (UILabel *)keyWordLabel {
    if (!_keyWordLabel) {
        _keyWordLabel = [[UILabel alloc] init];
        _keyWordLabel.textColor = [UIColor colorWithWhite:.2 alpha:1];
        _keyWordLabel.font = [UIFont systemFontOfSize:15];
        _keyWordLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _keyWordLabel;
}

- (UIButton *)deleteKeyWordBtn {
    if (!_deleteKeyWordBtn) {
        _deleteKeyWordBtn = [[UIButton alloc] init];
        [_deleteKeyWordBtn setImage:[UIImage imageNamed:@"search_delete"] forState:UIControlStateNormal];
        [_deleteKeyWordBtn addTarget:self action:@selector(deleteKeyWordBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteKeyWordBtn;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.2];
    }
    return _lineView;
}

#pragma mark --删除响应事件
- (void)deleteKeyWordBtnClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(deleteKeyWordAtCell:keyWord:)]) {
        /*** 让代理去做 ***/
        [self.delegate deleteKeyWordAtCell:self keyWord:self.keyWordLabel.text];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
