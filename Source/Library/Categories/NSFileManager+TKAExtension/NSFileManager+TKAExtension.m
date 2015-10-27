//
//  NSFileManager+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 18.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "NSFileManager+TKAExtension.h"

@implementation NSFileManager (TKAExtension)

+ (NSString *)documentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *)pathForDocumentsDirectoryWithFileName:(NSString *)fileName {
    return [[self documentsDirectory] stringByAppendingPathComponent:fileName];
}

+ (BOOL)fileExistsWithFileName:(NSString *)fileName {
    return [[NSFileManager defaultManager] fileExistsAtPath:[self pathForDocumentsDirectoryWithFileName:fileName]];
}

+ (NSString *)fileNameFromURL:(NSURL *)url {
    NSString *fileName = [NSString stringWithFormat:@"%@", url];
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"/.@*!:^#{}[]()$;=+$%?<>,"];
    
    return [fileName stringByAddingPercentEncodingWithAllowedCharacters:charSet];
//    fileName stringByAddingPercentEscapesUsingEncoding:<#(NSStringEncoding)#>
}

@end
