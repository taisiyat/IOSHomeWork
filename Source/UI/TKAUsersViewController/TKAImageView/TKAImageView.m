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
}

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(TKAImageModel *)imageModel {
    TKASynthesizeObservingSetter(imageModel, imageModel);
    [self fillWithModel:_imageModel];
    [_imageModel load];
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(TKAImageModel *)imageModel {
   self.imageModelView.image = imageModel.image;
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
