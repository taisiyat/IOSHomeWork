 //
//  TKAUser.m
//  IOSHomeWork
//
//  Created by Taisiya on 22.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAUser.h"

#import "NSString+TKARandomWord.h"
#import "NSFileManager+TKAExtension.h"

#import "TKAMacros.h"

static const NSTimeInterval kTKASleepTime    = 1;
static NSString * const kTKAImageName        = @"image";
static NSString * const kTKAImageExtension   = @"jpg";
static NSString * const kTKAKeyUser          = @"TKAKeyUser";
static NSString * const kTKAFileName         = @"usersArray";

@interface TKAUser ()
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, readonly) NSString    *fileFolder;
@property (nonatomic, readonly) NSString    *filePath;
@property (nonatomic, readonly, getter=isFileExists) BOOL fileExists;

@end

@implementation TKAUser

@dynamic image;
@dynamic fileFolder;
@dynamic filePath;
@dynamic fileExists;

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
//        self.name = [NSString randomName];
//        [self load];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors


- (BOOL)fileExists {
    return [NSFileManager fileExistsWithFileName:kTKAFileName];
}

#pragma mark -
#pragma mark Public

- (void)performLoading {
    TKASleep(kTKASleepTime);
    
    UIImage *image = nil;
    NSURL *url = [[NSBundle mainBundle] URLForResource:kTKAImageName
                                         withExtension:kTKAImageExtension];
    image = [UIImage imageWithContentsOfFile:[url path]];
    self.image = image;
    void(^block)() =nil;
    
    if (self.isFileExists) {
        block = ^{
            self.name = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
        };
    } else {
        block = ^{ self.name = [NSString randomName];};
    }
    
    [self performBlock:block shouldNotify:NO];
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
