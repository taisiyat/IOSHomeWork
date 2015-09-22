//
//  NSString+TKARandomWord.m
//  IOSHomeWork
//
//  Created by Taisiya on 15.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "NSString+TKARandomWord.h"
#import "NSString+TKAExtension.h"

static const NSUInteger kTKALengthWord = 8;

@implementation NSString (TKARandomWord)

+ (instancetype)randomWord {
    return [self randomStringWithLength:kTKALengthWord alphabet:[self lowercaseLetterAlphabet]];
}

+ (instancetype)randomName {
    return [[self randomWord] capitalizedString];
}

@end
