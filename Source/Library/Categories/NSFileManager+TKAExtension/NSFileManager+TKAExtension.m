//
//  NSFileManager+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 09.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "NSFileManager+TKAExtension.h"

static NSString *const kTKAFileName = @"usersArray";

@implementation NSFileManager (TKAExtension)

@dynamic fileName;
@dynamic fileFolder;

- (NSString *)fileName {
    return kTKAFileName;
}

- (NSString *)fileFolder {
    return [NSHomeDirectory()];
    //return [NSSearchPathForDirectoriesInDomains(NSUserDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

- (BOOL)cached {
    return [[NSFileManager defaultManager] fileExistsAtPath:[self filePath]];
}

@end
