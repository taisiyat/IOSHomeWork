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
#import "NSURL+TKAExtension.h"

static const NSTimeInterval kTKASleepTime   = 1;
static NSString * const    kTKAURL1        = @"http://donutey.com/images/format/PNG1.png";
static NSString * const    kTKAURL2        = @"http://steelasophical.com/hello-world/1283614816-rasta1-png/";

@interface TKAImageModel ()
@property (nonatomic, strong) UIImage   *image;
@property (nonatomic, strong) NSURL     *url;
@property (nonatomic, strong) TKACache  *cache;
//@property (nonatomic, readonly) NSString *fileName;
//@property (nonatomic, readonly) NSString *filePath;
//@property (nonatomic, readonly) BOOL cached;

@end

@implementation TKAImageModel

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
    TKACache *cache = self.cache;
    @synchronized (cache) {
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
    return [NSURL URLWithString:kTKAURL1];
    return self.url;
}

- (TKACache *)cache {
//    return [[self class] sharedCache];
    return [TKACache sharedCache];
}

#pragma mark -
#pragma mark Public

- (void)clear {
    [self.cache removeAllObjects];
}

- (void)performLoading {
    TKASleep(kTKASleepTime);
    TKAWeakifyVariable(self);
    [self performLoadingWithCompletion:^(UIImage *image, id error) {
        TKAStrongifyVariable(self)
        [self finalizeLoadingWithDate:image withError:error];
    }];
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

- (void)finalizeLoadingWithDate:(UIImage *)image withError:(id)error {
    if (!error && image) {
        self.image = image;
    } else {
        self.image = nil;
    }
}

- (void)performLoadingWithCompletion:(void(^)(UIImage *image, id error))completion {

}

#pragma mark -
#pragma mark Private

@end

