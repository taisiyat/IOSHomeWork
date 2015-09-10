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
@property (nonatomic, strong) IBOutlet UIButton *movingSquareButton;
@property (nonatomic, strong) IBOutlet UIView   *squareView;
@property (nonatomic, assign) NSUInteger        squarePosition;

@end
