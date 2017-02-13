//
//  LJData.m
//  meishimeike
//
//  Created by zhenglong duan on 12/02/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "LJData.h"

@implementation LJData

- (void)getDataForParameter:(NSDictionary *)parameter url:(NSString *)url {
//    __block NSMutableArray *resultArr = [NSMutableArray array];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
////        if ((int)[responseObject valueForKey:@"code"]==200) {
//            resultArr = [responseObject valueForKey:@"result"];
//            [self.delegate data:resultArr];
////        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
}

- (void)postDataForParameter:(NSDictionary *)parameter url:(NSString *)url {
//    __block NSMutableArray *resultArr = [NSMutableArray array];
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if ((int)[responseObject valueForKey:@"code"]==200) {
//            resultArr = [responseObject valueForKey:@"result"];
//            [self.delegate data:resultArr];
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//    }];
}
@end
