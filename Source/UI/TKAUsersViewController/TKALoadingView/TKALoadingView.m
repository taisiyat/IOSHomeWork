//
//  TKALoadingView.m
//  IOSHomeWork
//
//  Created by Taisiya on 16.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKALoadingView.h"

#import "TKAVisibleView.h"

@implementation TKALoadingView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.loadingView = [self newLoadingView];
    }
    
    return self;
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    
//    if (self) {
//        self.loadingView = [self newLoadingView];
//    }
//}

#pragma mark -
#pragma mark Accessors

- (BOOL)isHidden {
    return self.loadingView.visible;
}

#pragma mark -
#pragma mark Public

- (void)showLoadingView {
    if (!self.loadingView) {
        self.loadingView = [self newLoadingView];
    }
    
    [self bringSubviewToFront:self.loadingView];
    [self.loadingView setVisible:YES animate:YES];
}

- (void)hideLoadingView {
    [self.loadingView setVisible:NO animate:YES];
//    [self sendSubviewToBack:self.loadingView];
}

- (id)newLoadingView {
    return [TKAVisibleView visibleViewWithSuperview:self];
}

@end
