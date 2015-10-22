//
//  TKAImageView.m
//  IOSHomeWork
//
//  Created by Taisiya on 22.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAImageView.h"

@implementation TKAImageView

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.imageView = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!self.imageView) {

    }
}

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(TKAImageModel *)imageModel {
    if (imageModel != _imageModel) {
        _imageModel = nil;
        _imageModel = imageModel;
        if (!imageModel) {
            self.imageView.image = nil;
        } else {
//            self.imageView.image = imageModel.image;
        }
    }
}

- (void)setImageView:(UIImageView *)imageView {
    if (imageView != _imageView) {
        [_imageView removeFromSuperview];
        _imageView = imageView;
        [self addSubview:imageView];
    }
}

#pragma mark -
#pragma mark Public

#pragma mark -
#pragma mark Private



@end
