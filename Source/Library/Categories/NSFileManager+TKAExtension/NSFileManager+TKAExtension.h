//
//  NSFileManager+TKAExtension.h
//  IOSHomeWork
//
//  Created by Taisiya on 09.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (TKAExtension)
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *fileFolder;

- (NSString *)fileName;
- (NSString *)fileFolder;
- (NSString *)filePath;

- (BOOL)cached;

@end
