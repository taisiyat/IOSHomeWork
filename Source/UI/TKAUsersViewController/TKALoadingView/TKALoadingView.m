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
        self.visibleView = [TKAVisibleView visibleViewWithSuperView:self];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)showLoadingView {
    if (!self.visibleView) {
        self.visibleView = [self reloadLoadingView];
    }
    
    [self bringSubviewToFront:self.visibleView];
    [self.visibleView setVisible:YES animate:YES];
}

- (void)hideLoadingView {
    [self.visibleView setVisible:NO animate:YES];
}

- (BOOL)isHidden {
    return self.visibleView.visible;
}

- (id)reloadLoadingView {
    return [TKAVisibleView visibleViewWithSuperView:self];
}

@end
