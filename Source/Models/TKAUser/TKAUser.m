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

static const NSTimeInterval kTKASleepTime    = 1;
static NSString * const kTKAImageName        = @"image";
static NSString * const kTKAImageExtension   = @"jpg";
static NSString * const kTKAKeyUser          = @"TKAKeyUser";
static NSString * const kTKAURL2             = @"http://steelasophical.com/hello-world/1283614816-rasta1-png/";

@interface TKAUser ()
//@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, strong)   TKAImageModel     *image;
@property (nonatomic, readonly) NSString    *fileFolder;
@property (nonatomic, readonly) NSString    *filePath;
@property (nonatomic, readonly, getter=isFileExists) BOOL fileExists;

@end

@implementation TKAUser

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
        self.name = [NSString randomName];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

#pragma mark -
#pragma mark Public

- (void)performLoading {
    TKASleep(kTKASleepTime);
//    NSURL *url = [[NSBundle mainBundle] URLForResource:kTKAImageName
//                                         withExtension:kTKAImageExtension];
//    UIImage *image = [UIImage imageWithContentsOfFile:[url path]];
//    self.image = image;
    TKAImageModel *imageModel = [[TKAImageModel alloc] initWithUrl:[NSURL URLWithString:kTKAURL2]];
    self.image = imageModel;
}

- (void)setupLoading {
    self.state = TKAModelWillLoad;
}

- (void)finishLoading {
    TKAWeakifyVariable(self);
    TKAPerformBlockSyncOnMainQueue(^{
        TKAStrongifyVariable(self);
        self.state = self.image ? TKAModelDidLoad : TKAModelDidFailLoading;
    });
}

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
