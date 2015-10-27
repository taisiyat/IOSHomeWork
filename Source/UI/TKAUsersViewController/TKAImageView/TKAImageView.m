//
//  TKAImageView.m
//  IOSHomeWork
//
//  Created by Taisiya on 22.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAImageView.h"
#import "TKAImageModel.h"

#import "TKAMacros.h"

@implementation TKAImageView

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.imageModel = nil;
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
    TKASynthesizeObservingSetter(imageModel, imageModel);
    [self fillWithModel:_imageModel];
    [_imageModel load];
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

- (void)fillWithModel:(TKAImageModel *)imageModel {
    if (imageModel) {
        self.imageView.image = imageModel.image;
    } else {
        self.imageView.image = nil;
        [self.imageModel load];
    }
}

#pragma mark -
#pragma mark Private

#pragma mark -
#pragma mark TKAModelObserver

- (void)modelWillLoad:(TKAImageModel *)imageModel {
    [self showLoadingView];
}

- (void)modelDidLoad:(TKAImageModel *)imageModel {
    [self fillWithModel:imageModel];
    [self hideLoadingView];
}

- (void)modelUnload:(TKAImageModel *)imageModel {
    
}

- (void)modelDidFailLoading:(TKAImageModel *)imageModel {
    [self.imageModel load];
}


@end
