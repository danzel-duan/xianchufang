//
//  LJOnlineServiceModel.h
//  xianchufang
//
//  Created by zhenglong duan on 26/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJOnlineServiceModel : NSObject
/*** msg消息 ***/
@property (nonatomic,strong) NSString *msg;
/*** 在哪边 ***/
@property (nonatomic,assign) BOOL isRight;
/*** cell高度 ***/
@property (nonatomic,assign) CGFloat cellHight;
@end
