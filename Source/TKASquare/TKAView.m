//
//  TKAView.m
//  IOSHomeWork
//
//  Created by Taisiya on 08.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import "TKAView.h"
#import "TKAMacro.h"

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



#pragma mark -
#pragma mark Private

- (CGRect)nextSquareFrame:(TKASquarePosition)nextSquarePosition  {
    CGRect screenFrame = self.frame;
    CGRect squareFrame = self.squareView.frame;
    CGRect nextSquareFrame = squareFrame;
    
    switch (nextSquarePosition) {
        case TKATopLeftSquarePosition:
            TKASquareFrameOriginWithOrigin(x)
            TKASquareFrameOriginWithOrigin(y)
            break;
        
        case TKATopRightSquarePosition:
            TKASquareFrameOriginWithOrigin(y)
            TKASquareFrameOriginWithSize(x, width)
            break;
        
        case TKABottomLeftSquarePosition:
            TKASquareFrameOriginWithOrigin(x)
            TKASquareFrameOriginWithSize(y, height)
            break;
        
        case TKABottomRightSquarePosition:
            TKASquareFrameOriginWithSize(x, width)
            TKASquareFrameOriginWithSize(y, height)
            break;
        
        default:
            return nextSquareFrame;
    }
    
    return nextSquareFrame;
}

- (TKASquarePosition)nextSquarePosition {
    NSUInteger squarePosition = self.squarePosition;
    
    return ((++squarePosition) % TKACountSquarePosition);
}

@end

