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
static const CGFloat        kTKAHide            = 0.2;

@interface TKAVisibleView ()
@property (nonatomic, assign, getter = isAnimate) BOOL animate;

@end

@implementation TKAVisibleView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)awakeFromNib {
    [super awakeFromNib];
}

+ (instancetype)visibleViewWithSuperView:(UIView *)superView {
    TKAVisibleView *visibleView = [UINib objectWithClass:[TKAVisibleView class]];
    [superView addSubview:visibleView];
    visibleView.frame = superView.bounds;
    
    return visibleView;
}

- (void)setVisible:(BOOL)visible {
    if (_visible != visible) {
        [UIView animateWithDuration:self.animate ? kTKATimeDuration : kTKATimeIntervalNUL
                              delay:self.animate ? kTKATimeInterval : kTKATimeIntervalNUL
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.alpha = self.visible ? kTKAHide : kTKAShow;
                         }
                         completion:^(BOOL finished) {
                             _visible = visible;
                         }];
   
    }
}

- (void)show {
    [self showWithAnimate:YES];
 }

- (void)hide {
    [self hideWithAnimate:YES];
}

- (void)showWithAnimate:(BOOL)animate {
    self.animate = animate;
    self.visible = YES;
}

- (void)hideWithAnimate:(BOOL)animate {
    self.animate = animate;
    self.visible = NO;
}

@end
