 //
//  TKAUser.m
//  IOSHomeWork
//
//  Created by Taisiya on 22.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAUser.h"
#import "NSString+TKARandomWord.h"

static NSString * const kTKAImageName        = @"image";
static NSString * const kTKAImageExtension   = @"jpg";
static NSString * const kTKAKeyUser          = @"TKAKeyUser";

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
    static UIImage *__image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [[NSBundle mainBundle] URLForResource:kTKAImageName
                                             withExtension:kTKAImageExtension];
        __image = [UIImage imageWithContentsOfFile:[url path]];
    });

    return __image;
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:kTKAKeyUser];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self) {
        self.name = [decoder decodeObjectForKey:kTKAKeyUser];
    }
    
    return self;
}

@end
