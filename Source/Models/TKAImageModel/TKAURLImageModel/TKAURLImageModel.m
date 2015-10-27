//
//  TKAURLImageModel.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAURLImageModel.h"

#import "NSFileManager+TKAExtension.h"

#import "TKAMacros.h"

static const NSTimeInterval kTKASleepTime   = 1;
static NSString * const    kTKAURL1        = @"http://donutey.com/images/format/PNG1.png";
static NSString * const    kTKAURL2        = @"http://steelasophical.com/hello-world/1283614816-rasta1-png/";

@interface TKAURLImageModel ()
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;

@end

@implementation TKAURLImageModel

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

- (NSURLSession *)session {
    return [[self class] sharedSession];
}

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (downloadTask != _downloadTask) {
        [_downloadTask cancel];
        _downloadTask = downloadTask;
        [_downloadTask resume];
    }
}

- (NSURLSession *)sharedSession {
    static NSURLSession *__object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];//backgroundSessionConfigurationWithIdenticator, ephemeralSessionConfiguration, downloadSessionConfiguration
        __object = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    });
    
    return __object;
}

#pragma mark -
#pragma mark Public

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

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {

}

- (void)performLoadingWithURLWithComplition:(void(^)(UIImage * image, id error))complition {

}

- (void)performLoadingWithURL {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
//    self.downloadTask = [[self sharedSession] downloadTaskWithURL:self.url];
    self.downloadTask = [[self sharedSession] downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        location = self.url;
        NSURL *destination = [NSURL URLWithString:self.filePath];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        [fileManager removeItemAtURL:destination error:NULL];
        [fileManager copyItemAtURL:location toURL:destination error:NULL];
 
    } ];
    
    [self.downloadTask resume];
    self.image = [UIImage imageWithData:[NSData dataWithContentsOfFile:self.filePath]];
}

- (void)dump {
    self.image = nil;
    self.state = TKAModelDidFailLoading;
}


#pragma mark -
#pragma mark Private

@end