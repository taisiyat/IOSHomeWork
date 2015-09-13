//
//  TKAView.h
//  IOSHomeWork
//
//  Created by Taisiya on 08.09.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TKASquarePosition) {
    TKATopLeftSquarePosition,
    TKATopRightSquarePosition,
    TKABottomLeftSquarePosition,
    TKABottomRightSquarePosition
};

@interface TKAView : UIView
@property (nonatomic, strong) IBOutlet UIButton *moveSquareButton;
@property (nonatomic, strong) IBOutlet UIView   *squareView;
@property (nonatomic, assign) TKASquarePosition squarePosition;
@property (nonatomic, assign) BOOL              movingSquare;
@property (nonatomic, assign) BOOL              animationSquare;

- (void)setSquarePosition:(TKASquarePosition)squarePosition;
- (void)setSquarePosition:(TKASquarePosition)squarePosition animated:(BOOL)animated;
- (CGPoint)pointSquarePosition;
- (TKASquarePosition)nextSquarePosition;
- (void)animationMovingSquare;

@end
