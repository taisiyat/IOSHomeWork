//
//  TKAView.m
//  IOSHomeWork
//
//  Created by Taisiya on 08.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAView.h"

@implementation TKAView

- (void)setSquarePosition:(TKASquarePosition)squarePosition {
//   [self setSquarePosition:squarePosition animated:NO];
    CGRect frame = self.frame;
    frame.origin = CGPointMake(50, 50);
}

- (void)setSquarePosition:(TKASquarePosition)squarePosition animated:(BOOL)animated {
    CGRect frame = self.frame;
    frame.origin = [self pointSquarePosition];
    if (animated) {
        [UIView animateWithDuration:5.0
                       animations:^{
                           self.frame = frame;
                       }];
    }
    else {
        self.frame = frame;
    }
}

- (CGPoint)pointSquarePosition {
    TKASquarePosition squarePosition = [self squarePosition];
    CGRect screan = [self.superview frame];
    CGRect square = self.frame;
    switch (squarePosition) {
        case TKATopLeftSquarePosition:
            return CGPointMake(CGRectGetMinX(screan),
                               CGRectGetMinY(screan)) ;
        case TKATopRightSquarePosition:
            return CGPointMake(CGRectGetMaxX(screan) - CGRectGetWidth(square),
                               CGRectGetMinY(screan));
        case TKABottomLeftSquarePosition:
            return CGPointMake(CGRectGetMinX(screan),
                               CGRectGetMaxY(screan) - CGRectGetHeight(square));
        case TKABottomRightSquarePosition:
            return CGPointMake(CGRectGetMaxX(screan) - CGRectGetWidth(square),
                               CGRectGetMaxY(screan) - CGRectGetHeight(square));
    }
}

- (TKASquarePosition)nextSquarePosition {
    NSUInteger countSquarePosition = 4;
    NSUInteger squarePosition = (NSUInteger)[self squarePosition];
    return (squarePosition++)%countSquarePosition;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end

