//
//  TKAFileImageModel.m
//  IOSHomeWork
//
//  Created by Taisiya on 26.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAFileImageModel.h"
#import "TKACache.h"

#import "NSFileManager+TKAExtension.h"

#import "TKAMacros.h"

@interface TKAFileImageModel ()
@property (nonatomic, readonly) NSString *fileName;
@property (nonatomic, readonly) NSString *filePath;
@property (nonatomic, readonly) BOOL cached;

@end

@implementation TKAFileImageModel

@dynamic fileName;
@dynamic filePath;
@dynamic cached;

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

#pragma mark -
#pragma mark Accessors

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

#pragma mark -
#pragma mark Public

- (void)finishLoading {
    TKAWeakifyVariable(self);
    TKAPerformBlockSyncOnMainQueue(^{
        TKAStrongifyVariable(self);
        if (self.image) {
            self.state = TKAModelDidLoad;
        } else {
            [self.cache removeObjectForKey:self.url];
            self.state = TKAModelDidFailLoading;
        }
    });
}

- (void)performLoadingFromFile {
    UIImage *image = [UIImage imageWithContentsOfFile:self.filePath];
    self.image = image;
}

- (void)performLoadingWithFileWithComplition:(void(^)(UIImage * image, id error))complition {

}


#pragma mark -
#pragma mark Private

@end
