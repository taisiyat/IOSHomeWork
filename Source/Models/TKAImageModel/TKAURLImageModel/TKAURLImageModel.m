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

//static NSString * const    kTKAURL1        = @"http://donutey.com/images/format/PNG1.png";
//static NSString * const    kTKAURL2        = @"http://steelasophical.com/hello-world/1283614816-rasta1-png/";

@interface TKAURLImageModel ()
@property (nonatomic, readonly) NSURLSession             *session;
@property (nonatomic, strong)   NSURLSessionDownloadTask *downloadTask;
@property (nonatomic, readonly) NSString                 *fileName;
@property (nonatomic, readonly) NSString                 *fileFolder;
@property (nonatomic, readonly) NSString                 *filePath;
@property (nonatomic, readonly) BOOL cached;

@end

@implementation TKAURLImageModel

@dynamic session;
@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;
@dynamic cached;

#pragma mark -
#pragma mark Class Methods

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
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.downloadTask = nil;
//    self.session = nil;
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

#pragma mark -
#pragma mark Public

- (void)performLoadingWithCompletion:(void(^)(UIImage * image, id error))completion {
    if (self.cached) {
        [super performLoadingWithCompletion:completion];
    } else {
        [self performLoadingWithURLWithCompletion:completion];
    }
}

- (void)dump {
    self.state = TKAModelDidFailLoading;
}

- (void)performLoadingWithURLWithCompletion:(void(^)(UIImage *image, id error))completion {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    self.downloadTask = [self.session downloadTaskWithRequest:request
                                            completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                if (!error) {
                                                    NSFileManager *fileManager = [NSFileManager defaultManager];
                                                    NSURL *destination = [NSURL URLWithString:self.filePath];
                                                    [fileManager removeItemAtURL:destination error:NULL];
                                                    [fileManager copyItemAtURL:location toURL:destination error:&error];
                                                    if (error) {
                                                        [self deleteFromCache];
                                                    }
                                                    [super performLoadingWithCompletion:completion];
                                                 }
                                            }];
}

- (void)deleteFromCache {
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:self.filePath error:&error];
    assert(!error);
}

#pragma mark -
#pragma mark Private

@end