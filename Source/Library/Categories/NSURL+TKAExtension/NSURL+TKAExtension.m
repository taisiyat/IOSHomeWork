//
//  NSURL+TKAExtension.m
//  IOSHomeWork
//
//  Created by Taisiya on 29.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "NSURL+TKAExtension.h"

@implementation NSURL (TKAExtension)

+ (NSString *)fileNameFromURL:(NSURL *)url {
    NSString *fileName = [NSString stringWithFormat:@"%@", url];
    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@"/.@*!:^#{}[]()$;=+$%?<>,"];
    
    return [fileName stringByAddingPercentEncodingWithAllowedCharacters:charSet];
    //    fileName stringByAddingPercentEscapesUsingEncoding:<#(NSStringEncoding)#>
}

@end
