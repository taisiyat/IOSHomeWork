//
//  NSFileManager+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 18.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "NSFileManager+TKAExtension.h"

@implementation NSFileManager (TKAExtension)

+ (NSString *)fileFolder {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)filePathWithFileName:(NSString *)fileName {
    return [[self fileFolder] stringByAppendingPathComponent:fileName];
}

+ (BOOL)fileExistsWithFileName:(NSString *)fileName {
    return [[NSFileManager defaultManager] fileExistsAtPath:[self filePathWithFileName:fileName]];
}

@end
