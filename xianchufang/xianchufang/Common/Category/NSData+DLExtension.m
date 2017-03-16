//
//  NSData+DLExtension.m
//  DLCycleBannerVIew
//
//  Created by zhenglong duan on 13/03/2017.
//  Copyright © 2017 zhenglong duan. All rights reserved.
//

#import "NSData+DLExtension.h"
#import <CommonCrypto/CommonDigest.h>

#define DLSubPathMaxFileAmount 40  //Cache下子目录最大文件数量

@implementation NSData (DLExtension)
#pragma mark -- Documents 文件夹
/*** Documents路径 ***/
+ (NSString *)getDocumentPath {
    NSArray* pathes = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *DocumentPath = pathes[0];
    return DocumentPath;
}

/*** 将某个字符写到某一个文件中 ***/
+ (void)writeToDocumentPathFile:(NSString *)fileName character:(NSString *)character {
    NSString *CachesPath = [self getDocumentPath];
    NSString *filePath = [CachesPath stringByAppendingPathComponent:fileName];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    if (!data) {
        NSData *wordData = [character dataUsingEncoding:NSUTF8StringEncoding];
        [wordData writeToFile:filePath atomically:YES];
    }else{
        if ([self isExistCharacter:character formFile:fileName]) {
            [self clearCharacterByCharacter:character formFile:fileName];
        }
        NSData *newData = [NSData dataWithContentsOfFile:filePath];
        NSString *value = [[NSString alloc]initWithData:newData encoding:NSUTF8StringEncoding];
        NSMutableString *keywordsMuT = [NSMutableString stringWithFormat:@"%@",value];
        [keywordsMuT appendString:[NSString stringWithFormat:@"&&%@",character]];
        NSString *keywords = keywordsMuT.description;
        NSData *wordData = [keywords dataUsingEncoding:NSUTF8StringEncoding];
        [wordData writeToFile:filePath atomically:YES];
    }
}

/*** 得到某一个文件中的所有字符 ***/
+ (NSArray *)getCharacterFromFile:(NSString *)fileName {
    NSString *CachesPath = [self getDocumentPath];
    NSString *filePath = [CachesPath stringByAppendingPathComponent:fileName];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    if (data) {
        NSString *value = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSArray *VidArrs = [NSMutableArray arrayWithArray:[value componentsSeparatedByString:@"&&"]];
        NSMutableArray *mutArr = [NSMutableArray array];
        for (NSString *str in VidArrs) {
            if (![str isEqualToString:@""]) {
                [mutArr addObject:str];
            }
        }
        return [[mutArr reverseObjectEnumerator] allObjects];
    }
    return [NSArray array];
}

/*** 删除某个文件中的一个字符 ***/
+ (void)clearCharacterByCharacter:(NSString *)character formFile:(NSString *)fileName {
    NSString *CachesPath = [self getDocumentPath];
    NSString *filePath = [CachesPath stringByAppendingPathComponent:fileName];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSString *value = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    if (value) {
        NSArray *VidArrs = [NSMutableArray arrayWithArray:[value componentsSeparatedByString:@"&&"]];
        NSMutableString *keywordsMuT = [NSMutableString string];
        int i = 0;
        for (NSString *Str in VidArrs) {
            if (![character isEqualToString:Str]) {
                if (i == 0) {
                    [keywordsMuT appendString:[NSString stringWithFormat:@"%@",Str]];
                }else{
                    [keywordsMuT appendString:[NSString stringWithFormat:@"&&%@",Str]];
                }
                i++;
            }
        }
        NSString *keywords = keywordsMuT.description;
        NSData *wordData = [keywords dataUsingEncoding:NSUTF8StringEncoding];
        [wordData writeToFile:filePath atomically:YES];
    }
}

/*** 判断某个字符是否在这个文件中 ***/
+(BOOL)isExistCharacter:(NSString *)character formFile:(NSString *)fileName {
    BOOL isLike = NO;
    NSString *CachesPath = [self getDocumentPath];
    NSString *filePath = [CachesPath stringByAppendingPathComponent:fileName];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSString *value = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    if (value) {
        NSArray *VidArrs = [NSMutableArray arrayWithArray:[value componentsSeparatedByString:@"&&"]];
        for (NSString *docStr in VidArrs) {
            if ([docStr isEqualToString:character]) {
                isLike = YES;
            }
        }
    }
    return isLike;
}

/*** 清空某个文件中的所有字符 ***/
+(void)clearCharacterformFile:(NSString *)fileName {
    NSString *CachesPath = [self getDocumentPath];
    NSString *filePath = [CachesPath stringByAppendingPathComponent:fileName];
    NSString *keywords = @"";
    NSData *wordData = [keywords dataUsingEncoding:NSUTF8StringEncoding];
    [wordData writeToFile:filePath atomically:YES];
}

#pragma mark -- Library/cache 文件夹
/*** 创建cachePath路径 ***/
+ (NSString *)cacheSubPath:(nullable NSString *)SubPath {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingPathComponent:SubPath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return path;
}
/*** 创建路径用指定的字符串 ***/
+ (NSString *)creatDataPathWithSubPath:(nullable NSString *)SubPath String:(NSString *)string {
    NSString *path = [NSData cacheSubPath:SubPath];
    path = [path stringByAppendingPathComponent:[self creatMD5StringWithString:string]];
    return path;
}
/*** 将指定路径的文件写到Cache中 ***/
- (void)saveDataCacheWithSubPath:(nullable NSString *)SubPath Identifier:(NSString *)identifier {
    NSString *path = [NSData creatDataPathWithSubPath:SubPath String:identifier];
    [self writeToFile:path atomically:YES];
}
/*** 来获取此字符串的文件是否存在指定路径的Cache中，如果有就返回data ***/
+ (NSData *)getDataCacheWithSubPath:(nullable NSString *)SubPath Identifier:(NSString *)identifier {
    static BOOL isCheckedCacheDisk = NO;
    if (!isCheckedCacheDisk) {
        NSFileManager *manager = [NSFileManager defaultManager];
        NSArray *contents = [manager contentsOfDirectoryAtPath:[self cacheSubPath:SubPath] error:nil];
        if (contents.count >= DLSubPathMaxFileAmount) {  //如果cache路径中文件大于40就移除所有文件
            [manager removeItemAtPath:[self cacheSubPath:SubPath] error:nil];
        }
        isCheckedCacheDisk = YES;
    }
    NSString *path = [self creatDataPathWithSubPath:SubPath String:identifier];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}

+ (void)clearCacheWithSubPath:(nullable NSString *)SubPath {
    NSFileManager *manager = [NSFileManager defaultManager];
    [manager removeItemAtPath:[self cacheSubPath:SubPath] error:nil];
}
#pragma mark -- temp 文件夹

#pragma mark --comment使用的方法
+ (NSString *)creatMD5StringWithString:(NSString *)string {
    const char *original_str = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    [hash lowercaseString];
    return hash;
}
@end
