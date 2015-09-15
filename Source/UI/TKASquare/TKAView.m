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
                             _squarePosition = nextSquarePosition;
                            
                             if (handlerBlock && finished) {
                                 handlerBlock();
                             }
                         }];
}

- (void)setMoving:(BOOL)moving {
    if (_moving != moving) {
        _moving = moving;
    }

    __weak typeof(self) weakSelf = self;
    [self setSquarePosition:[self nextSquarePosition]
                   animated:YES
          completionHandler:^{
              __strong typeof(weakSelf) strongSelf = weakSelf;
              
              if (strongSelf.moving){
                  [strongSelf setMoving:moving];
              }
          }];

//    __block void(^handlerBlock)() = ^(){
//        if (self.moving) {
//            [self setSquarePosition:[self nextSquarePosition] animated:YES completionHandler:handlerBlock];
//        }
//    };
    
//    handlerBlock();
}

#pragma mark -
#pragma mark Private

- (CGRect)nextSquareFrame:(TKASquarePosition)nextSquarePosition  {
    CGRect screenFrame = self.frame;
    CGRect squareFrame = self.squareView.frame;
    CGPoint nextPoint = CGPointZero;
    
    CGFloat maxX = CGRectGetWidth(screenFrame) - CGRectGetWidth(squareFrame);
    CGFloat maxY = CGRectGetHeight(screenFrame) - CGRectGetHeight(squareFrame);
    
    switch (nextSquarePosition) {
        case TKATopRightSquarePosition:
            nextPoint.x = maxX;
            break;
        
        case TKABottomLeftSquarePosition:
            nextPoint.y = maxY;
            break;
        
        case TKABottomRightSquarePosition:
            nextPoint.x = maxX;
            nextPoint.y = maxY;
            break;
        
        default:
            break;
    }
    
    //return CGRectMake(nextPoint.x, nextPoint.y, CGRectGetWidth(squareFrame), CGRectGetHeight(squareFrame));
    squareFrame.origin = CGPointMake(nextPoint.x, nextPoint.y);

    return squareFrame;
}

- (TKASquarePosition)nextSquarePosition {
    NSUInteger squarePosition = self.squarePosition;
    
    return ((squarePosition + 1) % TKACountSquarePosition);
}

@end

