//
//  TKAURLImageModel.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAURLImageModel.h"

#import "NSFileManager+TKAExtension.h"
#import "NSURL+TKAExtension.h"

#import "TKAMacros.h"

//static const NSTimeInterval kTKASleepTime   = 1;
static NSString * const    kTKAURL1        = @"http://donutey.com/images/format/PNG1.png";
static NSString * const    kTKAURL2        = @"http://steelasophical.com/hello-world/1283614816-rasta1-png/";

@interface TKAURLImageModel ()
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;
@property (nonatomic, readonly) NSString *fileName;
@property (nonatomic, readonly) NSString *fileFolder;
@property (nonatomic, readonly) NSString *filePath;
@property (nonatomic, readonly) BOOL cached;

@end

@implementation TKAURLImageModel

@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;
@dynamic cached;

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.downloadTask = nil;
    self.session = nil;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fileFolder {
    return [NSFileManager documentsDirectory];
}

- (NSString *)fileName {
    return [NSURL fileNameFromURL:self.url];
}

- (NSString *)filePath {
    return [NSFileManager pathForDocumentsDirectoryWithFileName:self.fileName];
}

- (BOOL)isCached {
    return [NSFileManager fileExistsWithFileName:self.fileName];
}

- (NSURLSession *)session {
    return [TKAURLImageModel sharedSession];
}

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (downloadTask != _downloadTask) {
        [_downloadTask cancel];
        _downloadTask = downloadTask;
        [_downloadTask resume];
    }
}

+ (NSURLSession *)sharedSession {
    static NSURLSession *__object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        __object = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    });
    
    return __object;
}

#pragma mark -
#pragma mark Public

- (void)finishLoading {
    TKAWeakifyVariable(self);
    TKAPerformBlockSyncOnMainQueue(^{
        TKAStrongifyVariable(self);
        self.state = self.image ? TKAModelDidLoad : TKAModelDidFailLoading;
    });
}

- (void)performLoadingWithCompletion:(void(^)(UIImage * image, id error))completion {
    if (self.cached) {
        [self performLoadingWithFile:(NSString *)self.filePath withCompletion:completion];
    } else {
        [self performLoadingWithURLWithCompletion:completion];
    }
}

- (void)dump {
    self.state = TKAModelDidFailLoading;
}

- (void)performLoadingWithURLWithCompletion:(void(^)(UIImage *image, id error))completion {
    NSError *error = nil;
    UIImage *image = nil;
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    self.downloadTask = [self.session downloadTaskWithRequest:request
                                              completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                  location = self.url;
                                                  NSURL *destination = [NSURL URLWithString:self.filePath];
                                                  NSFileManager *fileManager = [NSFileManager defaultManager];
        
                                                  [fileManager removeItemAtURL:destination error:NULL];
                                                  [fileManager copyItemAtURL:location toURL:destination error:&error];
                                              }];
    if (!error) {
        [self performLoadingWithFile:self.filePath withCompletion:completion];
    } else {
        [self deleteFromCache];
    }
    
    if (completion) {
        completion(image, error);
    }
}

- (void)performLoadingWithFile:(NSString *)filePath withCompletion:(void(^)(UIImage *image, id error))completion {
    
}

- (void)deleteFromCache {
    [[NSFileManager defaultManager] removeItemAtPath:self.filePath error:NULL];
}

#pragma mark -
#pragma mark Private

@end