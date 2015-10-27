//
//  NSFileManager+TKAExtension.h
//  IOSHomeWork
//
//  Created by Taisiya on 18.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (TKAExtension)

+ (NSString *)documentsDirectory;
+ (NSString *)pathForDocumentsDirectoryWithFileName:(NSString *)fileName;
+ (BOOL)fileExistsWithFileName:(NSString *)fileName;

+ (NSString *)fileNameFromURL:(NSURL *)url;

@end
