 //
//  TKAUser.m
//  IOSHomeWork
//
//  Created by Taisiya on 22.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAUser.h"
#import "TKAImageModel.h"

#import "NSString+TKARandomWord.h"
#import "NSFileManager+TKAExtension.h"

#import "TKAMacros.h"

//static const NSTimeInterval kTKASleepTime    = 1;
static NSString * const kTKAImageName        = @"image";
static NSString * const kTKAImageExtension   = @"jpg";
static NSString * const kTKAKeyUser          = @"TKAKeyUser";
static NSString * const kTKAURL2             = @"http://steelasophical.com/hello-world/1283614816-rasta1-png/";

@implementation TKAUser

@dynamic imageModel;

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

- (TKAImageModel *)imageModel {
    return [TKAImageModel imageWithUrl:[NSURL URLWithString:kTKAURL2]];
}

#pragma mark -
#pragma mark Public

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:kTKAKeyUser];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.name = [decoder decodeObjectForKey:kTKAKeyUser];
    }
    
    return self;
}

@end
