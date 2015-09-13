//
//  TKAView.m
//  IOSHomeWork
//
//  Created by Taisiya on 08.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAView.h"

@implementation TKAView

- (void)setSquarePosition:(TKASquarePosition)nextSquarePosition {
   [self setSquarePosition:nextSquarePosition animated:NO];
    }

- (void)setSquarePosition:(TKASquarePosition)nextSquarePosition
                 animated:(BOOL)animated
{
    [self setSquarePosition:nextSquarePosition
                   animated:animated
          completionHandler:(^{})];
}

typedef void(^TKABlock)(void);

- (void)setSquarePosition:(TKASquarePosition)nextSquarePosition
                 animated:(BOOL)animated
        completionHandler:(void(^)(void))handler
{

    NSTimeInterval durationTime = 3.0;
    NSTimeInterval delayTime = 0.5;
    CGRect frame = self.squareView.frame;
    frame.origin = [self pointNextSquarePosition:nextSquarePosition];
    
    void (^animationBlock)(void) = ^(void){
//        [self setMovingSquare:YES];
       self.animationSquare = YES;
       self.squareView.frame = frame;
    };
   
    if (animated) {
//        [UIView animateWithDuration:0.5
//                         animations:^{
//                             self.squareView.frame = frame;
//                         }];
        [UIView animateWithDuration:durationTime
                              delay:delayTime
                            options:UIViewAnimationCurveEaseIn
                         animations:^(void){
//                             [self setMovingSquare:YES];
                             self.animationSquare = YES;
                             self.squareView.frame = frame;
                         }
                         completion:^(BOOL finished){
                             if (_squarePosition != nextSquarePosition) {
                                 _squarePosition = nextSquarePosition;
                             }
                             self.animationSquare = NO;
//                                        [self setMovingSquare:NO];
                                     }];
    }
    else {
        animationBlock();
        self.animationSquare = NO;
//        [self setMovingSquare:NO];
    }
}

- (CGPoint)pointNextSquarePosition:(TKASquarePosition)nextSquarePosition  {
    CGRect screan = [self.superview frame];
    CGRect squareFrame = self.squareView.frame;
    switch (nextSquarePosition) {
        case TKATopLeftSquarePosition:
            return CGPointMake(CGRectGetMinX(screan),
                               CGRectGetMinY(screan)) ;
        case TKATopRightSquarePosition:
            return CGPointMake(CGRectGetMaxX(screan) - CGRectGetWidth(squareFrame),
                               CGRectGetMinY(screan));
        case TKABottomLeftSquarePosition:
            return CGPointMake(CGRectGetMinX(screan),
                               CGRectGetMaxY(screan) - CGRectGetHeight(squareFrame));
        case TKABottomRightSquarePosition:
            return CGPointMake(CGRectGetMaxX(screan) - CGRectGetWidth(squareFrame),
                               CGRectGetMaxY(screan) - CGRectGetHeight(squareFrame));
    }
}

- (void)setMovingSquare:(BOOL)movingSquare {
    if (_movingSquare != movingSquare) {
        _movingSquare = movingSquare;
        
        if (movingSquare && !self.animationSquare) {
            [self setSquarePosition:[self nextSquarePosition] animated:YES];
        }
    }
}

- (void)setAnimationSquare:(BOOL)animationSquare {
    if (_animationSquare != animationSquare) {
        _animationSquare = animationSquare;
        
        if (!animationSquare && self.movingSquare) {
            [self setSquarePosition:[self nextSquarePosition] animated:YES];
        }
    }
}

- (void)animationMovingSquare {
    if (self.movingSquare) {
        self.movingSquare = NO;
    }
    else {
        self.movingSquare = YES;
    }
}



- (TKASquarePosition)nextSquarePosition {
    NSUInteger countSquarePosition = 4;
    NSUInteger squarePosition = (NSUInteger)[self squarePosition];
    return (TKASquarePosition)((++squarePosition)%countSquarePosition);

}

@end

