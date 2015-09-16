//
//  TKAView.m
//  IOSHomeWork
//
//  Created by Taisiya on 08.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAView.h"
#import "TKAMacros.h"

static const NSTimeInterval kTKADurationTime        = 1.0;
static const NSTimeInterval kTKADelayTime           = 0.1;

@implementation TKAView

#pragma mark -
#pragma mark Accessors

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

- (void)setSquarePosition:(TKASquarePosition)nextSquarePosition
                 animated:(BOOL)animated
        completionHandler:(void(^)())handlerBlock
{
    CGRect frame = self.squareView.frame;
    frame = [self nextSquareFrame:nextSquarePosition];

    [UIView animateWithDuration:animated ? kTKADurationTime : 0
                          delay:kTKADelayTime
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^(void){
                         self.animating = YES;
                         self.squareView.frame = frame;
                     }
                     completion:^(BOOL finished){
                         _squarePosition = nextSquarePosition;
                         self.animating = NO;
                         
                         if (handlerBlock && finished) {
                             handlerBlock();
                         }
                     }];
}

#pragma mark -
#pragma mark Public

- (void)animateSquare {
    if (self.moving && !self.animating) {
        TKAWeakifyVariable(self)
        [self setSquarePosition:[self nextSquarePosition]
                       animated:YES
              completionHandler:^(){
                  TKAStrongifyVariableAndReturnEntity(self, TKAEmpty)
                  [self animateSquare];
              }];
    }
}

#pragma mark -
#pragma mark Private

- (CGRect)nextSquareFrame:(TKASquarePosition)nextSquarePosition  {
    CGRect screen = self.frame;
    CGRect squareFrame = self.squareView.frame;
    CGPoint point = CGPointZero;
    
    CGFloat pointX = CGRectGetWidth(screen) - CGRectGetWidth(squareFrame);
    CGFloat pointY = CGRectGetHeight(screen) - CGRectGetHeight(squareFrame);
    
    switch (nextSquarePosition) {
        case TKATopRightSquarePosition:
            point.x = pointX;
            break;
        
        case TKABottomLeftSquarePosition:
            point.y = pointY;
            break;
        
        case TKABottomRightSquarePosition:
            point.x = pointX;
            point.y = pointY;
            break;
        
        default:
            break;
    }
    
    squareFrame.origin = point;

    return squareFrame;
}

- (TKASquarePosition)nextSquarePosition {
    return ((self.squarePosition + 1) % TKACountSquarePosition);
}

@end

