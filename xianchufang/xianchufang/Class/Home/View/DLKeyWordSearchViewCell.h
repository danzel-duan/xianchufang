//
//  DLKeyWordSearchViewCell.h
//  DLKeyWordSearch
//
//  Created by zhenglong duan on 15/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DLKeyWordSearchViewCellDelegate <NSObject>
/*** 删除当前cell对应的关键字 ***/
- (void)deleteKeyWordAtCell:(UITableViewCell *)cell keyWord:(NSString*)keyWord;
@end

@interface DLKeyWordSearchViewCell : UITableViewCell
@property (nonatomic,weak) id <DLKeyWordSearchViewCellDelegate> delegate;
/*** 关键字 ***/
@property (nonatomic,strong) UILabel *keyWordLabel;
/*** 删除按钮 ***/
@property (nonatomic,strong) UIButton *deleteKeyWordBtn;
/*** 下划线 ***/
@property (nonatomic,strong) UIView *lineView;
@end
