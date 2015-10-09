//
//  TKAVisibleView.m
//  IOSHomeWork
//
//  Created by Taisiya on 08.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAVisibleView.h"
#import "TKAUsersView.h"
#import "UINib+TKAExtension.h"

static const NSTimeInterval kTKATimeDuration    = 1.0;
static const NSTimeInterval kTKATimeInterval    = 0.0;
static const NSTimeInterval kTKATimeIntervalNUL = 0.0;
static const CGFloat        kTKAShow            = 1.0;
static const CGFloat        kTKAHide            = 0.0;

@interface TKAVisibleView ()
@property (nonatomic, assign, getter = isAnimate) BOOL animate;

@end

@implementation TKAVisibleView

- (void)awakeFromNib {
    [super awakeFromNib];
}

+ (instancetype)visibleView {
    TKAVisibleView *visibleView = [UINib objectWithClass:[TKAVisibleView class]];
//    [superview addSubview:visibleView];
//    visibleView.frame = superview.bounds;
    
    return visibleView;
}

- (void)setVisible:(BOOL)visible {
    if (_visible != visible) {
        _visible = visible;
        [self animateVisibleView];
    }
}

- (void)animateVisibleView {
    [UIView animateWithDuration:self.animate ? kTKATimeDuration : kTKATimeIntervalNUL
                          delay:self.animate ? kTKATimeInterval : kTKATimeIntervalNUL
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.alpha = self.visible ? kTKAHide : kTKAShow;
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

- (void)showView {
    [self showViewWithAnimate:NO];
 }

- (void)hideView {
    [self hideViewWithAnimate:NO];
}

- (void)showViewWithAnimate:(BOOL)animate {
    self.animate = animate;
    self.visible = YES;
}

- (void)hideViewWithAnimate:(BOOL)animate {
    self.animate = animate;
    self.visible = NO;
}

@end
