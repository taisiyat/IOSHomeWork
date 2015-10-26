//
//  TKAImageModel.m
//  IOSHomeWork
//
//  Created by Taisiya on 22.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAImageModel.h"

static NSString * const kTKAURL1 = @"http://donutey.com/images/format/PNG1.png";
static NSString * const kTKAURL2 = @"http://steelasophical.com/hello-world/1283614816-rasta1-png/";

@interface TKAImageModel ()
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSURL   *url;
@property (nonatomic, strong) NSURLSessionTask *sessionTask;


@end

@implementation TKAImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithUrl:(NSURL *)url {
    return [[self alloc] initWithUrl:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.url = nil;
    self.image = nil;
}

- (instancetype)initWithUrl:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

#pragma mark -
#pragma mark Public

- (void)performLoading {
    [self loadWithPath];
    
}

- (void)setupLoading {
    self.state = TKAModelWillLoad;
}

- (void)finishLoading {
    self.state = self.image ? TKAModelDidLoad : TKAModelFailLoad;
}

- (void)nameCacheFileFromURL:(NSURL *)url {
    
}

- (void)path {
    
}

#pragma mark -
#pragma mark Private

- (void)load {
//    if () {
//        //load from file
//    } else {
//        //load from net
//    }
}

- (void)loadWithPath {
    self.image = [UIImage imageWithContentsOfFile:[self.url absoluteString]];

}


@end
