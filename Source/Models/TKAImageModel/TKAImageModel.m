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

static const NSTimeInterval kTKASleepTime  = 1;
static NSString * const    kTKAURL1        = @"http://donutey.com/images/format/PNG1.png";
static NSString * const    kTKAURL2        = @"http://steelasophical.com/hello-world/1283614816-rasta1-png/";

@interface TKAImageModel ()
@property (nonatomic, strong) UIImage   *image;
@property (nonatomic, strong) NSURL     *url;
@property (nonatomic, readonly) TKACache  *cache;

@end

@implementation TKAImageModel

@dynamic cache;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithUrl:(NSURL *)url {
    Class class = url.fileURL ? [TKAFileImageModel class] : [TKAURLImageModel class];
    
    return [[class alloc] initWithUrl:url];
}

+ (TKACache *)sharedCache {
    return [TKACache sharedCache];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self.cache removeObjectForKey:self.url];
    [self cancel];
}

//- (instancetype)init {
//    return [self initWithUrl:nil];
//}

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
            [cache setObject:self forKey:url];
        }
    }

    return self;
}

#pragma mark -
#pragma mark Accessors

- (TKACache *)cache {
    return [[self class] sharedCache];
}

#pragma mark -
#pragma mark Public

- (void)cancel {

}

- (void)performLoading {
    TKASleep(kTKASleepTime);
    TKAWeakifyVariable(self);
    [self performLoadingWithCompletion:^(UIImage *image, id error) {
        TKAStrongifyVariable(self)
        [self finalizeLoadingWithImage:image error:error];
        [self notificationOfStateWithImage:image error:error];
    }];
}

- (void)setupLoading {
    self.state = TKAModelWillLoad;
}

- (void)notificationOfStateWithImage:(UIImage *)image error:(id)error {
    TKAWeakifyVariable(self);
    TKAPerformBlockSyncOnMainQueue(^{
        TKAStrongifyVariable(self);
        self.state = self.image ? TKAModelDidLoad : TKAModelDidFailLoading;
    });
}

- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error {
    self.image = image;
}

- (void)performLoadingWithCompletion:(void(^)(UIImage *image, id error))completion {

}

#pragma mark -
#pragma mark Private

@end

