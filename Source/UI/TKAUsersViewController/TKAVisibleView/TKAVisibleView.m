//
//  TKAVisibleView.m
//  IOSHomeWork
//
//  Created by Taisiya on 08.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAVisibleView.h"

//#import "TKAUsersView.h"
#import "UINib+TKAExtension.h"

static const NSTimeInterval kTKATimeDuration    = 1.0;
static const NSTimeInterval kTKATimeDelay    = 0.0;
static const NSTimeInterval kTKATimeIntervalNUL = 0.0;
static const CGFloat        kTKAVisibleView            = 0.6;

//@interface TKAVisibleView ()
////@property (nonatomic, assign, getter = isAnimate) BOOL animate;
////@property (nonatomic, assign, getter = isVisible) BOOL visible;
//
//@end

@implementation TKAVisibleView

#pragma mark -
#pragma mark Initializations and Deallocations

//- (void)awakeFromNib {
//    [super awakeFromNib];
//}

+ (instancetype)visibleViewWithSuperView:(UIView *)superView {
    TKAVisibleView *visibleView = [UINib objectWithClass:[self class]];
    [superView addSubview:visibleView];
    visibleView.frame = superView.bounds;
    
    return visibleView;
}

#pragma mark -
#pragma mark Accesssors

//- (BOOL)visible {
//    return self.visible;
//}

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible animate:NO];
}

- (void)setVisible:(BOOL)visible animate:(BOOL)animate {
    [self setVisible:visible animate:animate completion:nil];
}

- (void)setVisible:(BOOL)visible animate:(BOOL)animate completion:(void(^)())completion {
    NSTimeInterval animateDuration = animate ? kTKATimeDuration : kTKATimeIntervalNUL;
    
    if (_visible != visible) {
        [UIView animateWithDuration:animateDuration
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
