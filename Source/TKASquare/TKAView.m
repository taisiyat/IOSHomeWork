//
//  TKAView.m
//  IOSHomeWork
//
//  Created by Taisiya on 08.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAView.h"

static const NSTimeInterval kTKADurationTime        = 1.0;
static const NSTimeInterval kTKADelayTime           = 0.1;

@implementation TKAView

- (void)setSquarePosition:(TKASquarePosition)nextSquarePosition {
   [self setSquarePosition:nextSquarePosition animated:NO];
}

- (void)setSquarePosition:(TKASquarePosition)nextSquarePosition
                 animated:(BOOL)animated
{
    [self setSquarePosition:nextSquarePosition
                   animated:animated
          completionHandler:nil];
}

typedef void(^TKABlock)(void);

- (void)setSquarePosition:(TKASquarePosition)nextSquarePosition
                 animated:(BOOL)animated
        completionHandler:(void(^)())handlerBlock
{
    CGRect frame = self.squareView.frame;
    frame.origin = [self pointNextSquarePosition:nextSquarePosition];

    [UIView animateWithDuration:animated ? kTKADurationTime : 0
                              delay:kTKADelayTime
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^(void){
                             self.squareView.frame = frame;
                         }
                         completion:^(BOOL finished){

                             if (_squarePosition != nextSquarePosition) {
                                 _squarePosition = nextSquarePosition;
                             }

                             if (finished) {
                                 if (self.squareMoved) {
                                     [self setSquarePosition:[self nextSquarePosition]
                                                    animated:YES
                                           completionHandler:handlerBlock];
                                 }
                             }
                             
//                             if (handlerBlock && finished) {
//                                 handlerBlock();
//                             }
                         }];
}

- (CGPoint)pointNextSquarePosition:(TKASquarePosition)nextSquarePosition  {
    CGRect screen = [self.superview frame];
    CGRect squareFrame = self.squareView.frame;
    
    switch (nextSquarePosition) {
        case TKATopLeftSquarePosition:
            return CGPointMake(CGRectGetMinX(screen),
                               CGRectGetMinY(screen));
        case TKATopRightSquarePosition:
            return CGPointMake(CGRectGetMaxX(screen) - CGRectGetWidth(squareFrame),
                               CGRectGetMinY(screen));
        case TKABottomLeftSquarePosition:
            return CGPointMake(CGRectGetMinX(screen),
                               CGRectGetMaxY(screen) - CGRectGetHeight(squareFrame));
        case TKABottomRightSquarePosition:
            return CGPointMake(CGRectGetMaxX(screen) - CGRectGetWidth(squareFrame),
                               CGRectGetMaxY(screen) - CGRectGetHeight(squareFrame));
        default:
            return squareFrame.origin;
    }
}


- (void)setSquareMoved:(BOOL)squareMoved {
    if (_squareMoved != squareMoved) {
        _squareMoved = squareMoved;
    }
        
    void(^handlerBlock)(void) = ^(void){
        if (self.squareMoved) {
            [self setSquarePosition:[self nextSquarePosition] animated:YES completionHandler:handlerBlock];
        }
    };
        
    handlerBlock();
}


- (TKASquarePosition)nextSquarePosition {
    NSUInteger squarePosition = self.squarePosition;
    
    return ((++squarePosition) % TKACountSquarePosition);
}

@end

