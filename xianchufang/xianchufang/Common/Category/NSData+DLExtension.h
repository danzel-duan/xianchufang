//
//  NSData+DLExtension.h
//  DLCycleBannerVIew
//
//  Created by zhenglong duan on 13/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//


/**      沙盒中有三大文件夹  Documents,  Library, 和temp    **/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN   //和下面的 NS_ASSUME_NONNULL_END搭配来指定这区域间的方法属性参数都不能为空，需要为空的定向指定

@interface NSData (DLExtension)
#pragma mark -- Documents 文件夹

/*################ 字符操作 ###########################*/
/*** 清空某个文件中的所有字符 ***/
+(void)clearCharacterformFile:(NSString *)fileName;
/*** 删除某个文件中的一个字符 ***/
+ (void)clearCharacterByCharacter:(NSString *)character formFile:(NSString *)fileName;
/*** 得到某一个文件中的所有字符 ***/
+ (NSArray *)getCharacterFromFile:(NSString *)fileName;
/*** 将某个字符写到某一个文件中 ***/
+ (void)writeToDocumentPathFile:(NSString *)fileName character:(NSString *)character;
/*###########################################*/

#pragma mark -- Library/cache 文件夹
/*** 将指定路径的文件写到Cache中 ***/
- (void)saveDataCacheWithSubPath:(NSString * _Nullable)SubPath Identifier:(NSString *)identifier;
/*** 来获取此字符串的文件是否存在指定路径的Cache中，如果有就返回data ***/
+ (NSData *)getDataCacheWithSubPath:(NSString *_Nullable)SubPath Identifier:(NSString *)identifier;
/*** 清除Cache路径中的文件 ***/
+ (void)clearCacheWithSubPath:(NSString *_Nullable)SubPath;
#pragma mark -- temp 文件夹
@end

NS_ASSUME_NONNULL_END
