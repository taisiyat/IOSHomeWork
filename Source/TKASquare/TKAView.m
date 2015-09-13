//
//  TKAView.m
//  IOSHomeWork
//
//  Created by Taisiya on 08.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAView.h"

static const NSUInteger     kTKACountSquarePosition = 4;
static const NSTimeInterval kTKADurationTime        = 3.0;
static const NSTimeInterval kTKADelayTime           = 0.5;

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
    CGRect frame = self.squareView.frame;
    frame.origin = [self pointNextSquarePosition:nextSquarePosition];
    
    void (^animationBlock)(void) = ^(void){
       self.animationSquare = YES;
       self.squareView.frame = frame;
    };
    
    void (^handlerBlock)(BOOL) = ^(BOOL finished){
        if (_squarePosition != nextSquarePosition) {
            _squarePosition = nextSquarePosition;
        }
        
        self.animationSquare = NO;
    };
   
    if (animated) {
        [UIView animateWithDuration:kTKADurationTime
                              delay:kTKADelayTime
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^(void){
                                        self.animationSquare = YES;
                                        self.squareView.frame = frame;
                                    }
                         completion:^(BOOL finished){
                                        handler();
                             
                                        if (_squarePosition != nextSquarePosition) {
                                            _squarePosition = nextSquarePosition;
                                        }
                             
                                        self.animationSquare = NO;
                                     }];
    } else {
        animationBlock();
        handlerBlock(YES);
    }
}

- (CGPoint)pointNextSquarePosition:(TKASquarePosition)nextSquarePosition  {
    CGRect screen = [self.superview frame];
    CGRect squareFrame = self.squareView.frame;
    
    switch (nextSquarePosition) {
        case TKATopLeftSquarePosition:
            self.colorSquare = [UIColor yellowColor];
            return CGPointMake(CGRectGetMinX(screen),
                               CGRectGetMinY(screen));
        case TKATopRightSquarePosition:
            self.colorSquare = [UIColor greenColor];
            return CGPointMake(CGRectGetMaxX(screen) - CGRectGetWidth(squareFrame),
                               CGRectGetMinY(screen));
        case TKABottomLeftSquarePosition:
            self.colorSquare = [UIColor orangeColor];
            return CGPointMake(CGRectGetMinX(screen),
                               CGRectGetMaxY(screen) - CGRectGetHeight(squareFrame));
        case TKABottomRightSquarePosition:
            self.colorSquare = [UIColor purpleColor];
            return CGPointMake(CGRectGetMaxX(screen) - CGRectGetWidth(squareFrame),
                               CGRectGetMaxY(screen) - CGRectGetHeight(squareFrame));
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
            [self setSquarePosition:[self nextSquarePosition]
                           animated:YES
                  completionHandler:^{
                                        self.squareView.backgroundColor = self.colorSquare;
                                    }];
        }
    }
}

- (void)animatedMovingSquare {
    self.movingSquare = (self.movingSquare) ? NO : YES;
}

- (TKASquarePosition)nextSquarePosition {
    NSUInteger squarePosition = self.squarePosition;

    return ((++squarePosition)%kTKACountSquarePosition);
}

@end

