//
//  TKAFileImageModel.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAFileImageModel.h"
#import "TKACache.h"

#import "NSFileManager+TKAExtension.h"

#import "TKAMacros.h"

@implementation TKAFileImageModel

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

#pragma mark -
#pragma mark Accessors

#pragma mark -
#pragma mark Public

- (void)performLoadingWithCompletion:(void(^)(UIImage * image, id error))completion {
    if (completion) {
        UIImage *image = [UIImage imageWithContentsOfFile:self.url.path];
        completion(image, nil);
    }
}

#pragma mark -
#pragma mark Private

@end
