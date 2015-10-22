//
//  TKAVisibleView.m
//  IOSHomeWork
//
//  Created by Taisiya on 08.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAVisibleView.h"

#import "UINib+TKAExtension.h"

static const NSTimeInterval kTKATimeDuration    = 3.0;
static const NSTimeInterval kTKATimeDelay       = 0.0;
static const NSTimeInterval kTKATimeIntervalNUL = 0.0;
static const CGFloat        kTKAVisibleView     = 1.0;

@implementation TKAVisibleView

#pragma mark -
#pragma mark Initializations and Deallocations

+ (instancetype)visibleViewWithSuperview:(UIView *)superview {
    TKAVisibleView *visibleView = [UINib objectWithClass:[self class]];
    [superview addSubview:visibleView];
    visibleView.frame = superview.bounds;
    
    return visibleView;
}

#pragma mark -
#pragma mark Accesssors

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible animate:NO];
}

- (void)setVisible:(BOOL)visible animate:(BOOL)animate {
    [self setVisible:visible animate:animate completion:nil];
}

- (void)setVisible:(BOOL)visible animate:(BOOL)animate completion:(void(^)())completion {
    if (_visible != visible) {
        [UIView animateWithDuration:animate ? kTKATimeDuration : kTKATimeIntervalNUL
                              delay:kTKATimeDelay
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.alpha = visible ? kTKAVisibleView : 0.0;
                         }
                         completion:^(BOOL finished) {
                             _visible = visible;
                             
                             if (completion) {
                                 completion();
                             }
                         }];
    }
}

@end
