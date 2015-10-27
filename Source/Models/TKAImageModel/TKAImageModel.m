//
//  TKAImageModel.m
//  IOSHomeWork
//
//  Created by Taisiya on 22.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAImageModel.h"
#import "TKACache.h"
#import "TKAFileImageModel.h"
#import "TKAURLImageModel.h"

#import "TKAMacros.h"

#import "NSFileManager+TKAExtension.h"

static const NSTimeInterval kTKASleepTime   = 1;
static NSString * const    kTKAURL1        = @"http://donutey.com/images/format/PNG1.png";
static NSString * const    kTKAURL2        = @"http://steelasophical.com/hello-world/1283614816-rasta1-png/";

@interface TKAImageModel ()
//@property (nonatomic, strong) UIImage   *image;
@property (nonatomic, strong) NSURL     *url;
//@property (nonatomic, strong) TKACache  *cache;
//@property (nonatomic, readonly) NSString *fileName;
//@property (nonatomic, readonly) NSString *filePath;
//@property (nonatomic, readonly) BOOL cached;

@end

@implementation TKAImageModel

@dynamic fileName;
@dynamic filePath;
@dynamic cached;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithUrl:(NSURL *)url {
    Class class = url.fileURL ? [TKAFileImageModel class] : [TKAURLImageModel class];
    
    return [[class alloc] initWithUrl:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self.cache removeObjectForKey:self.url];
    self.url = nil;
    self.image = nil;
    [self clear];
    self.cache = nil;
}

- (instancetype)init {
    return [self initWithUrl:nil];
}

- (instancetype)initWithUrl:(NSURL *)url {
    @synchronized (self) {
        TKACache *cache = self.cache;
        id object = [cache objectForKey:url];
        
        if (object) {
            return object;
        }
        
        self = [super init];

        if (self) {
            self.url = url;
            [self.cache setObject:self forKey:url];
        }
    } 

    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSURL *)url {
    return [NSURL URLWithString:kTKAURL2];
}

- (TKACache *)cache {
    return [[self class] sharedCache];
}

- (NSString *)fileFolder {
    return [NSFileManager documentsDirectory];
}

- (NSString *)fileName {
    return [NSFileManager fileNameFromURL:self.url];
}

- (NSString *)filePath {
    return [NSFileManager pathForDocumentsDirectoryWithFileName:self.fileName];
}

- (BOOL)isCached {
    return [NSFileManager fileExistsWithFileName:self.fileName];
}

- (NSURLSession *)session {
    return [[self class] sharedSession];
}

#pragma mark -
#pragma mark Public

- (void)clear {
    [self.cache removeAllObjects];
}

- (void)performLoading {
    TKASleep(kTKASleepTime);
    
    if (self.cached) {
        [self performLoadingFromFile];
    } else {
        [self performLoadingFromURL];
    }
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

- (void)performLoadingFromFile {
    
}

- (void)performLoadingFromURL {
    
}

- (void)performLoadingFromFileWithComplition:(void(^)(UIImage *image, id error))complition {

}

- (void)performLoadingFromURLWithComplition:(void(^)(UIImage *image, id error))complition {

}

#pragma mark -
#pragma mark Private

@end

