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
@property (nonatomic, strong)   UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

@property (nonatomic, strong) TKACache  *cache;
@property (nonatomic, readonly) NSString *fileName;
@property (nonatomic, readonly) NSString *filePath;
@property (nonatomic, readonly) BOOL cached;

+ (instancetype)imageWithUrl:(NSURL *)url;

- (instancetype)initWithUrl:(NSURL *)url;

@end
