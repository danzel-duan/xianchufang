//
//  LJData.h
//  meishimeike
//
//  Created by zhenglong duan on 12/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <AFNetworking.h>
@protocol LJDataDelegate
- (void)data :(NSMutableArray *)array;
@end

@interface LJData : NSObject
@property (nonatomic,weak) id <LJDataDelegate> delegate;
/*** GET请求 ***/
- (void)getDataForParameter:(NSDictionary *)parameter url:(NSString *)url;
/*** POST请求 ***/
- (void)postDataForParameter:(NSDictionary *)parameter url:(NSString *)url;
@end
