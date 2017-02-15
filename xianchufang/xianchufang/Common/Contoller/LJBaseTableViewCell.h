//
//  LJBaseTableViewCell.h
//  xianchufang
//
//  Created by zhenglong duan on 15/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^imageViewBlock)();

@interface LJBaseTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *TextLabel;
@property (nonatomic,strong) UIImageView *ImageView;

@property (nonatomic,copy) imageViewBlock imageViewblock;

@end
