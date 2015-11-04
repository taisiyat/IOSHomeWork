//
//  TKAImageModel.h
//  IOSHomeWork
//
//  Created by Taisiya on 22.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "TKAModel.h"

@class TKACache;

@interface TKAImageModel : TKAModel
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageWithUrl:(NSURL *)url;
+ (TKACache *)sharedCache;

- (instancetype)initWithUrl:(NSURL *)url;
- (void)cancel;

- (void)performLoadingWithCompletion:(void(^)(UIImage *image, id error))completion;
- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error;
- (void)notificationOfStateWithImage:(UIImage *)image error:(id)error;

@end
