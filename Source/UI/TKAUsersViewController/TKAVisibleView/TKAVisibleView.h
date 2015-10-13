//
//  TKAVisibleView.h
//  IOSHomeWork
//
//  Created by Taisiya on 08.10.15.
//  Copyright (c) 2015 TKAHomeWork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TKAVisibleView : UIView
@property (nonatomic, assign, getter = isVisible) BOOL visible;

+ (instancetype)visibleViewWithSuperView:(UIView *)superView;

- (void)show;
- (void)hide;
- (void)showWithAnimate:(BOOL)animate;
- (void)hideWithAnimate:(BOOL)animate;

@end
