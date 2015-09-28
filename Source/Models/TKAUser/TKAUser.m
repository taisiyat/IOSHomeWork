 //
//  TKAUser.m
//  IOSHomeWork
//
//  Created by Taisiya on 22.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAUser.h"
#import "NSString+TKARandomWord.h"

@implementation TKAUser

@dynamic image;

#pragma mark -
#pragma mark Class Method

+ (instancetype)user {
    return [TKAUser new];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomName];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (UIImage *)image {
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"jpg"];
//        return [UIImage imageWithContentsOfFile:path];
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"image" withExtension:@"jpg"];
//    return [UIImage imageWithContentsOfFile:[url path]];
    static UIImage *image = nil;
    static dispatch_once_t onceToken;
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"image" withExtension:@"jpg"];
    dispatch_once(&onceToken, ^{
        image = [UIImage imageWithContentsOfFile:[url path]];
    });

    return image;
}

@end
